// ignore_for_file: file_names
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:recipe_app/core/model/calorie_model.dart';
import 'package:sqflite/sqflite.dart';

class CalorieHelper {
  late Database database;
  static CalorieHelper calorieHelper = CalorieHelper();
  final String tableName = 'caloriecount';
  final String idColumn = 'id';
  final String heightColumn = 'height';
  final String weightColumn = 'weight';

  initDatabase() async {
    database = await connectToDatabase();
  }

  Future<Database> connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '$directory/calorie.db';
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $heightColumn INTEGER, $weightColumn INTEGER)');
      },
    );
  }

  Future<List<CalorieModel>> getAllCalorie() async {
    List<Map<String, dynamic>> tasks = await database.query(tableName);
    return tasks.map((e) => CalorieModel.fromMap(e)).toList();
  }

  insertNewCalorie(CalorieModel calorieModel) {
    database.insert(tableName, calorieModel.toMap());
  }

  deleteCalorie(CalorieModel calorieModel) {
    database
        .delete(tableName, where: '$idColumn=?', whereArgs: [calorieModel.id]);
  }

  deleteAllCalories() {
    database.delete(tableName);
  }

  updateCalorie(CalorieModel calorieModel) async {
    await database.update(
        tableName,
        {
          heightColumn: calorieModel.height,
          weightColumn: calorieModel.weight,
        },
        where: '$idColumn=?',
        whereArgs: [calorieModel.id]);
  }
}

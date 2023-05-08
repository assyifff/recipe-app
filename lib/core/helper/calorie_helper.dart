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

  insertNewCalorie(CalorieModel calorieModel) {
    database.insert(tableName, calorieModel.toMap());
  }
}

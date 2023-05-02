// ignore_for_file: file_names
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:recipe_app/core/model/recipe_model.dart';
import 'package:sqflite/sqflite.dart';

class RecipeHelper {
  late Database database;
  static RecipeHelper recipeHelper = RecipeHelper();
  final String tableName = 'recipeData';
  final String titleColumn = 'title';
  final String idColumn = 'id';
  final String isSavedColumn = 'isSaved';
  final String ingredientsColumn = 'ingredients';
  final String stepsColumn = 'steps';
  final String cookTimeColumn = 'cookTime';
  final String imageColumn = 'image';
  final String servesColumn = 'serves';
  final String caloriesColumn = 'calories';

  initDatabase() async {
    database = await connectToDatabase();
  }

  Future<Database> connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '$directory/recipeTable.db';
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $titleColumn TEXT,$caloriesColumn INTEGER, $servesColumn INTEGER, $cookTimeColumn INTEGER, $isSavedColumn INTEGER, $ingredientsColumn TEXT, $stepsColumn TEXT, $imageColumn TEXT)');
      },
    );
  }

  Future<List<RecipeModel>> getAllRecipes() async {
    List<Map<String, dynamic>> tasks = await database.query(tableName);
    return tasks.map((e) => RecipeModel.fromMap(e)).toList();
  }

  insertNewRecipe(RecipeModel recipeModel) {
    database.insert(tableName, recipeModel.toMap());
  }

  deleteRecipe(RecipeModel recipeModel) {
    database
        .delete(tableName, where: '$idColumn=?', whereArgs: [recipeModel.id]);
  }

  // deleteRecipes() {
  //   database.delete(tableName);
  // }

  updateRecipe(RecipeModel recipeModel) async {
    await database.update(
        tableName,
        {
          isSavedColumn: recipeModel.isSaved ? 1 : 0,
          titleColumn: recipeModel.title,
          caloriesColumn: recipeModel.calories,
          servesColumn: recipeModel.serves,
          cookTimeColumn: recipeModel.cookTime,
          imageColumn: recipeModel.image!.path,
          ingredientsColumn: recipeModel.ingredients,
          stepsColumn: recipeModel.steps,
        },
        where: '$idColumn=?',
        whereArgs: [recipeModel.id]);
  }

  updateIsFavorite(RecipeModel recipeModel) {
    database.update(tableName, {isSavedColumn: !recipeModel.isSaved ? 1 : 0},
        where: '$idColumn=?', whereArgs: [recipeModel.id]);
  }
}

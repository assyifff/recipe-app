import 'package:recipe_app/core/model/recipe_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RecipeHelper {
  static RecipeHelper? _recipeHelper;
  static late Database _database;

  RecipeHelper._internal() {
    _recipeHelper = this;
  }

  factory RecipeHelper() => _recipeHelper ?? RecipeHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDB();
    return _database;
  }

  final String _tableName = 'recipe';

  Future<Database> _initializeDB() async {
    final db = openDatabase(join(await getDatabasesPath(), 'recipe_db.db'),
        onCreate: (db, version) async {
      await db.execute(
        '''CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, serves TEXT, cookTime TEXT, ingredients TEXT, steps TEXT)''',
      );
    }, version: 1);

    return db;
  }

  Future<void> insertRecipe(RecipeModel recipeModel) async {
    final db = await database;
    await db.insert(_tableName, recipeModel.toMap());
  }

  Future<List<RecipeModel>> getRecipe() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    return results.map((e) => RecipeModel.fromMap(e)).toList();
  }

  Future<void> updateRecipe(RecipeModel recipeModel) async {
    final db = await database;
    await db.update(
      _tableName,
      recipeModel.toMap(),
      where: 'id = ?',
      whereArgs: [recipeModel.id],
    );
  }

  Future<void> deleteRecipe(int id) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:recipe_app/core/helper/recipe_helper.dart';
import 'package:recipe_app/core/model/recipe_model.dart';

class RecipeProvider with ChangeNotifier {
  final RecipeHelper _recipeHelper = RecipeHelper();
  List<RecipeModel> _recipes = [];

  List<RecipeModel> get recipes => _recipes;

  void getAllRecipes() async {
    _recipes = await _recipeHelper.getRecipe();
    notifyListeners();
  }

  void addRecipe(RecipeModel recipeModel) async {
    await _recipeHelper.insertRecipe(recipeModel);
    notifyListeners();
    getAllRecipes();
  }

  void updateContact(RecipeModel recipeModel) async {
    await _recipeHelper.updateRecipe(recipeModel);
    getAllRecipes();
  }

  void deleteContact(int id) async {
    await _recipeHelper.deleteRecipe(id);
    getAllRecipes();
  }
}

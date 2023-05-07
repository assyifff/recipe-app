import 'package:flutter/material.dart';
import 'package:recipe_app/core/model/recipe_model.dart';

class SearchRecipeProvider extends ChangeNotifier {
  List<RecipeModel> _filteredRecipes = [];

  List<RecipeModel> get filteredRecipes => _filteredRecipes;

  void filterRecipes(List<RecipeModel> recipes, String query) {
    _filteredRecipes = recipes
        .where((recipe) =>
            recipe.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}

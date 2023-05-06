import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipe_app/core/helper/recipe_helper.dart';
import 'package:recipe_app/core/model/recipe_model.dart';

class RecipeProvider extends ChangeNotifier {
  RecipeProvider() {
    getRecipes();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();
  TextEditingController servesController = TextEditingController();
  TextEditingController cookTimeController = TextEditingController();
  TextEditingController stepsController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  File? image;

  List<RecipeModel> allRecipes = [];
  List<RecipeModel> favoriteRecipes = [];
  getRecipes() async {
    allRecipes = await RecipeHelper.recipeHelper.getAllRecipes();
    favoriteRecipes = allRecipes.where((e) => e.isSaved).toList();
    notifyListeners();
  }

  insertNewRecipe() {
    RecipeModel recipeModel = RecipeModel(
      isSaved: false,
      title: titleController.text,
      image: image,
      calories: int.parse(
          caloriesController.text != '' ? caloriesController.text : '0'),
      ingredients: ingredientsController.text,
      serves:
          int.parse(servesController.text != '' ? servesController.text : '0'),
      steps: stepsController.text,
      cookTime: int.parse(
          cookTimeController.text != '' ? cookTimeController.text : '0'),
    );
    RecipeHelper.recipeHelper.insertNewRecipe(recipeModel);
    getRecipes();
  }

  updateRecipe(RecipeModel recipeModel) async {
    await RecipeHelper.recipeHelper.updateRecipe(recipeModel);
    getRecipes();
  }

  deleteRecipe(RecipeModel recipeModel) {
    RecipeHelper.recipeHelper.deleteRecipe(recipeModel);
    getRecipes();
  }

  updateIsSaved(RecipeModel recipeModel) {
    RecipeHelper.recipeHelper.updateIsSaved(recipeModel);
    getRecipes();
  }

  Future<File?> getImageFile(String? imagePath) async {
    if (imagePath == null || imagePath.isEmpty) {
      return null;
    }

    final imageFile = File(imagePath);
    if (await imageFile.exists()) {
      return imageFile;
    } else {
      return null;
    }
  }
}

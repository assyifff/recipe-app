import 'package:flutter/material.dart';
import 'package:recipe_app/core/helper/recipe_helper.dart';
import 'package:recipe_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RecipeHelper.recipeHelper.initDatabase();
  runApp(const MyApp());
}

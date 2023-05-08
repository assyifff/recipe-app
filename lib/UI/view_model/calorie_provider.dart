import 'package:flutter/material.dart';
import 'package:recipe_app/core/helper/calorie_helper.dart';
import 'package:recipe_app/core/model/calorie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalorieProvider extends ChangeNotifier {
  int? _caloriesPerDay;

  int? get caloriesPerDay => _caloriesPerDay;

  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  Future<void> calculateCalories(int height, int weight) async {
    final calories = (66 + (13.7 * weight) + (5 * height) - (6.8 * 30)).round();
    _caloriesPerDay = calories;
    notifyListeners();

    final calorieModel = CalorieModel(height: height, weight: weight);
    final calorieHelper = CalorieHelper.calorieHelper;
    await calorieHelper.initDatabase();
    await calorieHelper.insertNewCalorie(calorieModel);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('caloriesPerDay', calories);
  }

  Future<void> loadCaloriesFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _caloriesPerDay = prefs.getInt('caloriesPerDay');
    notifyListeners();
  }

  Future<void> clearCaloriesFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('caloriesPerDay');
    _caloriesPerDay = null;
    notifyListeners();
  }

  String? validateCalorie(String? value) {
    final number = int.tryParse(value ?? '');
    if (number == null) {
      return 'Please enter a valid calorie!';
    }
    return null;
  }
}

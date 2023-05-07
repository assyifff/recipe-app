import 'package:flutter/material.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view_model/edit_recipe_provider.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';

class CalorieWidget extends StatelessWidget {
  const CalorieWidget({
    super.key,
    required this.recipeProvider,
    required this.editProvider,
    required this.colorStyle,
  });

  final RecipeProvider recipeProvider;
  final EditRecipeProvider editProvider;
  final ColorStyle colorStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: recipeProvider.caloriesController,
      validator: editProvider.validateCalorie,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: 'Enter food/drink calories (per 1 serve)',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorStyle.base, width: 1),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorStyle.base,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorStyle.base,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorStyle.base,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}

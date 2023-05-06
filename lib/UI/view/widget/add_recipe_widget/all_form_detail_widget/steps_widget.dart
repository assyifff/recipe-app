import 'package:flutter/material.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';

class StepsWidget extends StatelessWidget {
  const StepsWidget({
    super.key,
    required this.recipeProvider,
    required this.colorStyle,
  });

  final RecipeProvider recipeProvider;
  final ColorStyle colorStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: recipeProvider.stepsController,
      maxLines: 15,
      maxLength: 10000,
      decoration: InputDecoration(
        hintText: 'Enter your recipe steps',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorStyle.base, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorStyle.base,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

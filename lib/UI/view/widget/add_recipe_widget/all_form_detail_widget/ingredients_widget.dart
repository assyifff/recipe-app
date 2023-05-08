import 'package:flutter/material.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';

class IngredientsWidget extends StatelessWidget {
  const IngredientsWidget({
    super.key,
    required this.recipeProvider,
    required this.colorStyle,
  });

  final RecipeProvider recipeProvider;
  final ColorStyle colorStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: recipeProvider.ingredientsController,
      maxLines: 15,
      maxLength: 1000,
      decoration: InputDecoration(
        hintText: 'Enter your recipe ingredients',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorStyle.base,
            width: 1,
          ),
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

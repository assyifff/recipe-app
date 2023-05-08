import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view_model/add_recipe_provider.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';

class BuildSaveButtonWidget extends StatelessWidget {
  const BuildSaveButtonWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.recipeProvider,
    required this.colorStyle,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final RecipeProvider recipeProvider;
  final ColorStyle colorStyle;

  @override
  Widget build(BuildContext context) {
    final addProvider = Provider.of<AddRecipeProvider>(context, listen: false);
    return ElevatedButton(
      onPressed: () {
        recipeProvider.image = addProvider.image;
        if (_formKey.currentState!.validate() && addProvider.image != null) {
          recipeProvider.insertNewRecipe();
          recipeProvider.titleController.clear();
          recipeProvider.caloriesController.clear();
          recipeProvider.servesController.clear();
          recipeProvider.cookTimeController.clear();
          recipeProvider.ingredientsController.clear();
          recipeProvider.stepsController.clear();
          _formKey.currentState!.reset();
          Navigator.pushReplacementNamed(context, '/');
          addProvider.clearImage();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error! image must be uploaded'),
            ),
          );
        }
      },
      style: ButtonStyle(
        fixedSize: const MaterialStatePropertyAll(
          Size(335, 54),
        ),
        backgroundColor: MaterialStatePropertyAll(colorStyle.base),
      ),
      child: const Text(
        'Save my recipes',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view/widget/add_recipe_widget/build_image_picker_widget.dart';
import 'package:recipe_app/UI/view/widget/add_recipe_widget/build_recipe_form_widget.dart';
import 'package:recipe_app/UI/view_model/add_recipe_provider.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  ColorStyle colorStyle = ColorStyle();
  final _formKey = GlobalKey<FormState>();
  List<int?> timeItems = List.generate(500, (index) => index + 1);
  List<int?> serveItems = List.generate(50, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
    final addRecipeProvider =
        Provider.of<AddRecipeProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 16,
                right: 16,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      recipeProvider.titleController.clear();
                      recipeProvider.caloriesController.clear();
                      recipeProvider.servesController.clear();
                      recipeProvider.cookTimeController.clear();
                      recipeProvider.stepsController.clear();
                      recipeProvider.ingredientsController.clear();
                      Navigator.of(context).pop();
                      recipeProvider.image = null;
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Create recipe',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            BuildImagePickerWidget(colorStyle: colorStyle),
            BuildRecipeFormWidget(
              formKey: _formKey,
              recipeProvider: recipeProvider,
              addRecipeProvider: addRecipeProvider,
              colorStyle: colorStyle,
              serveItems: serveItems,
              timeItems: timeItems,
            ),
          ],
        ),
      ),
    );
  }
}

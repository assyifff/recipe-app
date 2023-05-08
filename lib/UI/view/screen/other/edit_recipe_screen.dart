import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view/widget/edit_recipe_widget/edit_form_widget.dart';
import 'package:recipe_app/UI/view/widget/edit_recipe_widget/image_edit_widget.dart';
import 'package:recipe_app/UI/view_model/edit_recipe_provider.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';
import 'package:recipe_app/core/model/recipe_model.dart';

class EditRecipeScreen extends StatefulWidget {
  final RecipeModel recipeModel;
  const EditRecipeScreen({super.key, required this.recipeModel});

  @override
  State<EditRecipeScreen> createState() => _EditRecipeScreenState();
}

class _EditRecipeScreenState extends State<EditRecipeScreen> {
  final ColorStyle colorStyle = ColorStyle();

  final List<int?> timeItems = List.generate(500, (index) => index + 1);
  final List<int?> serveItems = List.generate(50, (index) => index + 1);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
    final editProvider =
        Provider.of<EditRecipeProvider>(context, listen: false);

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
                    editProvider.clearImage();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Edit recipe',
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
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageEditWidget(
                    provider: editProvider,
                    recipeModel: widget.recipeModel,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        EditFormWidget(
                            formKey: _formKey,
                            recipeProvider: recipeProvider,
                            editProvider: editProvider,
                            colorStyle: colorStyle,
                            serveItems: serveItems,
                            timeItems: timeItems),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                editProvider.image != null) {
                              widget.recipeModel.title =
                                  recipeProvider.titleController.text;
                              widget.recipeModel.calories = int.parse(
                                  recipeProvider.caloriesController.text != ''
                                      ? recipeProvider.caloriesController.text
                                      : '0');
                              widget.recipeModel.serves = int.parse(
                                  recipeProvider.servesController.text != ''
                                      ? recipeProvider.servesController.text
                                      : '0');
                              widget.recipeModel.cookTime = int.parse(
                                  recipeProvider.cookTimeController.text != ''
                                      ? recipeProvider.cookTimeController.text
                                      : '0');
                              widget.recipeModel.image = editProvider.image;
                              widget.recipeModel.ingredients =
                                  recipeProvider.ingredientsController.text;
                              widget.recipeModel.steps =
                                  recipeProvider.stepsController.text;
                              recipeProvider.updateRecipe(widget.recipeModel);
                              Navigator.of(context).pop();
                              recipeProvider.titleController.clear();
                              recipeProvider.caloriesController.clear();
                              recipeProvider.servesController.clear();
                              recipeProvider.cookTimeController.clear();
                              recipeProvider.stepsController.clear();
                              recipeProvider.ingredientsController.clear();
                              editProvider.clearImage();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Error! image must be changed'),
                                ),
                              );
                            }
                          },
                          style: ButtonStyle(
                              fixedSize: const MaterialStatePropertyAll(
                                Size(335, 54),
                              ),
                              backgroundColor:
                                  MaterialStatePropertyAll(colorStyle.base)),
                          child: const Text(
                            'Save changes',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

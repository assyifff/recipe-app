// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/screen/other/edit_recipe_screen.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view/widget/show_detail_recipe_widget/build_detail_recipe_widget.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';
import 'package:recipe_app/core/model/recipe_model.dart';

class ShowDetailRecipeScreen extends StatelessWidget {
  final RecipeModel recipeModel;

  ShowDetailRecipeScreen({super.key, required this.recipeModel});

  ColorStyle colorStyle = ColorStyle();

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(
      builder: ((context, provider, child) => Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      top: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                        ),
                        PopupMenuButton(
                          icon: const Icon(Icons.more_horiz),
                          itemBuilder: ((context) => [
                                PopupMenuItem(
                                  onTap: () async {
                                    final navigator = Navigator.of(context);
                                    await Future.delayed(Duration.zero);
                                    provider.titleController.text =
                                        recipeModel.title;
                                    provider.caloriesController.text =
                                        recipeModel.calories.toString();
                                    provider.servesController.text =
                                        recipeModel.serves.toString();
                                    provider.cookTimeController.text =
                                        recipeModel.cookTime.toString();
                                    provider.ingredientsController.text =
                                        recipeModel.ingredients;
                                    provider.stepsController.text =
                                        recipeModel.steps;
                                    provider.image = recipeModel.image;
                                    navigator.push(
                                      MaterialPageRoute(
                                        builder: (context) => EditRecipeScreen(
                                          recipeModel: recipeModel,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(Icons.edit),
                                      SizedBox(width: 8),
                                      Text('Edit'),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  onTap: () {
                                    provider.deleteRecipe(recipeModel);
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(Icons.delete),
                                      SizedBox(width: 8),
                                      Text('Delete'),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  BuildDetailRecipeWidget(
                      recipeModel: recipeModel, colorStyle: colorStyle),
                ],
              ),
            ),
          )),
    );
  }
}

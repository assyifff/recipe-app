// ignore_for_file: must_be_immutable
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/screen/other/edit_recipe_screen.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
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
                                    navigator.push(MaterialPageRoute(
                                        builder: (_) => EditRecipeScreen(
                                            recipeModel: recipeModel)));

                                    // push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: ((context) => EditRecipeScreen(
                                    //         recipeModel: recipeModel)),
                                    //   ),
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
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'How to make ${recipeModel.title}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 100),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 200,
                    width: 200,
                    child: FutureBuilder<File?>(
                      future:
                          Provider.of<RecipeProvider>(context, listen: false)
                              .getImageFile(recipeModel.image!.path),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          return Image.file(
                            snapshot.data!,
                            fit: BoxFit.contain,
                          );
                        } else {
                          return Center(
                              child: Image.asset(
                            'assets/image/food_logo.jpg',
                            fit: BoxFit.contain,
                          ));
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 66,
                      width: 335,
                      decoration: BoxDecoration(
                        color: colorStyle.textField,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.local_dining,
                                  color: colorStyle.base,
                                ),
                                const SizedBox(width: 16),
                                const Text('Calories'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: Text(
                              '${recipeModel.calories} kkal',
                              textAlign: TextAlign.end,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 66,
                      width: 335,
                      decoration: BoxDecoration(
                        color: colorStyle.textField,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.people,
                                  color: colorStyle.base,
                                ),
                                const SizedBox(width: 16),
                                const Text('Serves'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: Text(
                              '${recipeModel.serves} person',
                              textAlign: TextAlign.end,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 66,
                      width: 335,
                      decoration: BoxDecoration(
                        color: colorStyle.textField,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: colorStyle.base,
                                ),
                                const SizedBox(width: 16),
                                const Text('Cook Time'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: Text(
                              '${recipeModel.cookTime} min',
                              textAlign: TextAlign.end,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: colorStyle.textField,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        recipeModel.ingredients,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Instructions',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: colorStyle.textField,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        recipeModel.steps,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )),
    );
  }
}

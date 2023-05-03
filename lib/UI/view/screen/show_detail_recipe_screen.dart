import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';
import 'package:recipe_app/core/model/recipe_model.dart';

class ShowDetailRecipeScreen extends StatelessWidget {
  final RecipeModel recipeModel;

  const ShowDetailRecipeScreen({super.key, required this.recipeModel});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(
        builder: ((context, provider, child) => Scaffold(
              appBar: AppBar(
                actions: [
                  InkWell(
                      onTap: () {
                        // provider.titleController.text = recipeModel.title;
                        // provider.caloriesController.text =
                        //     recipeModel.calories.toString();
                        // provider.servesController.text =
                        //     recipeModel.serves.toString();
                        // provider.cookTimeController.text =
                        //     recipeModel.cookTime.toString();
                        // provider.ingredientsController.text =
                        //     recipeModel.ingredients;
                        // provider.stepsController.text = recipeModel.steps;
                        // provider.image = recipeModel.image;
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: ((context) => EditRecipeScreen(
                        //             recipeModel: recipeModel))));
                      },
                      child: const Icon(Icons.edit)),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        provider.deleteRecipe(recipeModel);
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.delete)),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    height: 170,

                    // child: recipeModel.image == null
                    //     ? const Center(
                    //         child: CircleAvatar(
                    //         radius: 40,
                    //         backgroundImage:
                    //             AssetImage('assets/image/food_logo.jpg'),
                    //       ))
                    //     : Image.file(
                    //         recipeModel.image!,
                    //       ),
                    child: FutureBuilder<File?>(
                      future:
                          Provider.of<RecipeProvider>(context, listen: false)
                              .getImageFile(recipeModel.image!.path),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          return Image.file(
                            snapshot.data!,
                            // height: 130,
                            // width: 160,
                          );
                        } else {
                          return const Center(
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  AssetImage('assets/image/food_logo.jpg'),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      recipeModel.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const Text(
                          'Preperation time :',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${recipeModel.cookTime} mins',
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const Text(
                          'Calories :',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${recipeModel.calories} kkal',
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const Text(
                          'serve:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${recipeModel.serves} ',
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ingredients',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          recipeModel.ingredients,
                          style: const TextStyle(fontSize: 26),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Instructions',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          recipeModel.steps,
                          style: const TextStyle(fontSize: 26),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            )));
  }
}

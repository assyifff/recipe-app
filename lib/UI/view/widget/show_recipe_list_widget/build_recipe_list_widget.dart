import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';
import 'package:recipe_app/core/model/recipe_model.dart';

class BuildRecipeListWidget extends StatelessWidget {
  const BuildRecipeListWidget({
    super.key,
    required this.recipeModel,
    required this.provider,
  });

  final RecipeModel recipeModel;
  final RecipeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 180,
                width: 335,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FutureBuilder<File?>(
                future: Provider.of<RecipeProvider>(context, listen: false)
                    .getImageFile(recipeModel.image!.path),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        snapshot.data!,
                        fit: BoxFit.cover,
                        height: 180,
                        width: 335,
                      ),
                    );
                  } else {
                    return SizedBox(
                      width: 335,
                      height: 180,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/image/food_logo.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        onTap: () {
                          provider.updateIsSaved(recipeModel);
                        },
                        child: recipeModel.isSaved
                            ? const Icon(
                                Icons.bookmark,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.bookmark_border,
                                color: Colors.red,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'How to make ${recipeModel.title}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text('${recipeModel.calories} kkal'),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

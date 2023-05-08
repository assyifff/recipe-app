import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/screen/other/show_recipe_list_screen.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view/widget/home_widget/show_recipe_added_widget.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';

class BuildRecipeAddedWidget extends StatelessWidget {
  const BuildRecipeAddedWidget({
    super.key,
    required this.colorStyle,
  });

  final ColorStyle colorStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your recipe',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShowRecipeListScreen(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: colorStyle.base,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: colorStyle.base,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer<RecipeProvider>(builder: (context, provider, child) {
            return SizedBox(
              height: 260,
              child: provider.allRecipes.isNotEmpty
                  ? ListView.separated(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemCount: min(4, provider.allRecipes.length),
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 150,
                          child:
                              ShowRecipeAddedWidget(provider.allRecipes[index]),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 8);
                      },
                    )
                  : const Center(
                      child: Text('Recipe not found...'),
                    ),
            );
          }),
        ),
      ],
    );
  }
}

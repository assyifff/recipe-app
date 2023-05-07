import 'package:flutter/material.dart';
import 'package:recipe_app/UI/view/screen/other/search_recipe_screen.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';

class BuildSearchWidget extends StatelessWidget {
  const BuildSearchWidget({
    super.key,
    required this.colorStyle,
    required this.recipeProvider,
  });

  final ColorStyle colorStyle;
  final RecipeProvider recipeProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 28,
      ),
      child: TextField(
        cursorColor: colorStyle.base,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: colorStyle.base,
          ),
          hintText: 'Search recipes',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: colorStyle.base),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) =>
                  SearchRecipeScreen(recipes: recipeProvider.allRecipes)),
            ),
          );
        },
      ),
    );
  }
}

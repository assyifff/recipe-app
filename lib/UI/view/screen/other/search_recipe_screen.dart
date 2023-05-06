// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view/widget/show_recipe_list_widget/show_recipe_list_widget.dart';
import 'package:recipe_app/core/model/recipe_model.dart';

class SearchRecipeScreen extends StatefulWidget {
  final List<RecipeModel> recipes;
  List<RecipeModel> filteredRecipes = [];

  SearchRecipeScreen({super.key, required this.recipes}) {
    filteredRecipes = recipes;
  }

  @override
  State<SearchRecipeScreen> createState() => _SearchRecipeScreenState();
}

class _SearchRecipeScreenState extends State<SearchRecipeScreen> {
  final ColorStyle colorStyle = ColorStyle();
  void filterRecipes(value) {
    setState(
      () {
        widget.filteredRecipes = widget.recipes
            .where(
              (recipe) => recipe.title.toLowerCase().contains(
                    value.toLowerCase(),
                  ),
            )
            .toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 22,
              ),
              child: Text(
                'Find best recipes\nfor cooking',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                bottom: 20,
                top: 28,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        filterRecipes(value);
                      },
                      autofocus: true,
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
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: widget.filteredRecipes.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.filteredRecipes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ShowRecipeListWidget(
                            widget.filteredRecipes[index]);
                      })
                  : const Center(
                      child: Text('Recipe not found...'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

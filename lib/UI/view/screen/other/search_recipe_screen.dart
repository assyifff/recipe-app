// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view/widget/show_recipe_list_widget/show_recipe_list_widget.dart';
import 'package:recipe_app/UI/view_model/search_recipe_provider.dart';
import 'package:recipe_app/core/model/recipe_model.dart';

class SearchRecipeScreen extends StatefulWidget {
  final List<RecipeModel> recipes;

  const SearchRecipeScreen({super.key, required this.recipes});

  @override
  State<SearchRecipeScreen> createState() => _SearchRecipeScreenState();
}

class _SearchRecipeScreenState extends State<SearchRecipeScreen> {
  final ColorStyle colorStyle = ColorStyle();

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
                        Provider.of<SearchRecipeProvider>(context,
                                listen: false)
                            .filterRecipes(widget.recipes, value);
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
            Consumer<SearchRecipeProvider>(builder: (context, provider, child) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: provider.filteredRecipes.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: provider.filteredRecipes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ShowRecipeListWidget(
                              provider.filteredRecipes[index]);
                        })
                    : const Center(
                        child: Text('Recipe not found...'),
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

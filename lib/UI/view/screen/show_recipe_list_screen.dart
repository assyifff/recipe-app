import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/widget/show_recipe_list_widget/show_recipe_list_widget.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';

class ShowRecipeListScreen extends StatelessWidget {
  const ShowRecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RecipeProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
              itemCount: provider.allRecipes.length,
              itemBuilder: (context, index) {
                return ShowRecipeListWidget(provider.allRecipes[index]);
              });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/widget/show_recipe_list_widget/show_recipe_list_widget.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';

class SavedRecipeScreen extends StatelessWidget {
  const SavedRecipeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          body: ListView(
            children: [
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.only(
                  left: 28,
                  top: 16,
                ),
                child: Text(
                  'Saved recipe',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 35),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.favoriteRecipes.length,
                itemBuilder: (context, index) {
                  return ShowRecipeListWidget(provider.favoriteRecipes[index]);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}

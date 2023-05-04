import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/widget/show_recipe_list_widget/show_recipe_list_widget.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';

class ShowRecipeListScreen extends StatelessWidget {
  const ShowRecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 16,
                right: 16,
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  // const Icon(Icons.more_horiz)
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Your recipe',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Consumer<RecipeProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.allRecipes.length,
                    itemBuilder: (context, index) {
                      return ShowRecipeListWidget(provider.allRecipes[index]);
                    });
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

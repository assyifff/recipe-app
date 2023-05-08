import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view/widget/show_recipe_list_widget/show_recipe_list_widget.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';

class ShowUserRecipeWidget extends StatelessWidget {
  const ShowUserRecipeWidget({
    super.key,
    required this.colorStyle,
  });

  final ColorStyle colorStyle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            'Syifa',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
                'Welcome to my profile, where I share my passion for cooking and healthy living. Let\'s explore the world of delicious and nutritious meals together!'),
          ),
          Divider(
            color: colorStyle.black,
            thickness: 0.1,
            height: 20,
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      fixedSize: const MaterialStatePropertyAll(
                        Size(335, 30),
                      ),
                      backgroundColor:
                          MaterialStatePropertyAll(colorStyle.textField),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: Text(
                      'Video',
                      style: TextStyle(fontSize: 16, color: colorStyle.base),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      fixedSize: const MaterialStatePropertyAll(
                        Size(335, 30),
                      ),
                      backgroundColor:
                          MaterialStatePropertyAll(colorStyle.base),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Recipe',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
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
        ],
      ),
    );
  }
}

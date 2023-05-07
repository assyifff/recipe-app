import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/screen/other/show_detail_recipe_screen.dart';
import 'package:recipe_app/UI/view/widget/show_recipe_list_widget/build_recipe_list_widget.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';
import 'package:recipe_app/core/model/recipe_model.dart';

class ShowRecipeListWidget extends StatelessWidget {
  final RecipeModel recipeModel;

  const ShowRecipeListWidget(this.recipeModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecipeProvider>(context, listen: false);
    return InkWell(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) =>
                ShowDetailRecipeScreen(recipeModel: recipeModel)),
          ),
        );
      }),
      child:
          BuildRecipeListWidget(recipeModel: recipeModel, provider: provider),
    );
  }
}

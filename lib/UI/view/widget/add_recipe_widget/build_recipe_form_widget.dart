import 'package:flutter/material.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view/widget/add_recipe_widget/all_form_detail_widget/calorie_widget.dart';
import 'package:recipe_app/UI/view/widget/add_recipe_widget/all_form_detail_widget/cook_time_widget.dart';
import 'package:recipe_app/UI/view/widget/add_recipe_widget/all_form_detail_widget/ingredients_widget.dart';
import 'package:recipe_app/UI/view/widget/add_recipe_widget/all_form_detail_widget/serves_widget.dart';
import 'package:recipe_app/UI/view/widget/add_recipe_widget/all_form_detail_widget/steps_widget.dart';
import 'package:recipe_app/UI/view/widget/add_recipe_widget/all_form_detail_widget/title_widget.dart';
import 'package:recipe_app/UI/view/widget/add_recipe_widget/build_save_button_widget.dart';
import 'package:recipe_app/UI/view_model/add_recipe_provider.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';

class BuildRecipeFormWidget extends StatelessWidget {
  const BuildRecipeFormWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.recipeProvider,
    required this.addRecipeProvider,
    required this.colorStyle,
    required this.serveItems,
    required this.timeItems,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final RecipeProvider recipeProvider;
  final AddRecipeProvider addRecipeProvider;
  final ColorStyle colorStyle;
  final List<int?> serveItems;
  final List<int?> timeItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                TitleWidget(
                    recipeProvider: recipeProvider,
                    addRecipeProvider: addRecipeProvider,
                    colorStyle: colorStyle),
                const SizedBox(height: 20),
                CalorieWidget(
                    recipeProvider: recipeProvider,
                    addRecipeProvider: addRecipeProvider,
                    colorStyle: colorStyle),
                const SizedBox(height: 20),
                ServesWidget(
                    recipeProvider: recipeProvider,
                    colorStyle: colorStyle,
                    serveItems: serveItems),
                const SizedBox(height: 20),
                CookTimeWidget(
                    recipeProvider: recipeProvider,
                    colorStyle: colorStyle,
                    timeItems: timeItems),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                IngredientsWidget(
                    recipeProvider: recipeProvider, colorStyle: colorStyle),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Steps',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                StepsWidget(
                    recipeProvider: recipeProvider, colorStyle: colorStyle),
                const SizedBox(height: 20),
              ],
            ),
          ),
          BuildSaveButtonWidget(
              formKey: _formKey,
              recipeProvider: recipeProvider,
              colorStyle: colorStyle),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

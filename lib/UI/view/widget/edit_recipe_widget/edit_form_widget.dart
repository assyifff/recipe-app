import 'package:flutter/material.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view/widget/edit_recipe_widget/all_form_detail_widget/calorie_widget.dart';
import 'package:recipe_app/UI/view/widget/edit_recipe_widget/all_form_detail_widget/cook_time_widget.dart';
import 'package:recipe_app/UI/view/widget/edit_recipe_widget/all_form_detail_widget/ingredients_widget.dart';
import 'package:recipe_app/UI/view/widget/edit_recipe_widget/all_form_detail_widget/serves_widget.dart';
import 'package:recipe_app/UI/view/widget/edit_recipe_widget/all_form_detail_widget/steps_widget.dart';
import 'package:recipe_app/UI/view/widget/edit_recipe_widget/all_form_detail_widget/title_widget.dart';
import 'package:recipe_app/UI/view_model/edit_recipe_provider.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';

class EditFormWidget extends StatelessWidget {
  const EditFormWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.recipeProvider,
    required this.editProvider,
    required this.colorStyle,
    required this.serveItems,
    required this.timeItems,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final RecipeProvider recipeProvider;
  final EditRecipeProvider editProvider;
  final ColorStyle colorStyle;
  final List<int?> serveItems;
  final List<int?> timeItems;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 20),
          TitleWidget(
              recipeProvider: recipeProvider,
              editProvider: editProvider,
              colorStyle: colorStyle),
          const SizedBox(height: 20),
          CalorieWidget(
              recipeProvider: recipeProvider,
              editProvider: editProvider,
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
          IngredientsWidget(
              recipeProvider: recipeProvider, colorStyle: colorStyle),
          const SizedBox(height: 20),
          StepsWidget(recipeProvider: recipeProvider, colorStyle: colorStyle),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

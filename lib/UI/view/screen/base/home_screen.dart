import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view/widget/home_widget/build_calorie_card_widget.dart';
import 'package:recipe_app/UI/view/widget/home_widget/build_recipe_added_widget.dart';
import 'package:recipe_app/UI/view/widget/home_widget/build_search_widget.dart';
import 'package:recipe_app/UI/view/widget/home_widget/build_trending_widget.dart';
import 'package:recipe_app/UI/view_model/calorie_provider.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';
import 'package:recipe_app/UI/view_model/recipe_trending_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ColorStyle colorStyle = ColorStyle();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final calorieProvider =
          Provider.of<CalorieProvider>(context, listen: false);
      await calorieProvider.loadCaloriesFromPrefs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
    final trendingProvider =
        Provider.of<RecipeTrendingProvider>(context, listen: false);
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
            BuildSearchWidget(
                colorStyle: colorStyle, recipeProvider: recipeProvider),
            BuildCalorieCardWidget(colorStyle: colorStyle),
            BuildTrendingWidget(
                colorStyle: colorStyle, trendingProvider: trendingProvider),
            BuildRecipeAddedWidget(colorStyle: colorStyle),
          ],
        ),
      ),
    );
  }
}

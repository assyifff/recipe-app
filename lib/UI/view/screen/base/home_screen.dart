import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
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
  ColorStyle colorStyle = ColorStyle();

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
    final calorieProvider = Provider.of<CalorieProvider>(context);
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
            Column(
              children: [
                const SizedBox(height: 20),
                Card(
                  color: colorStyle.textField,
                  elevation: 3,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Youy daily calorie intake',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            const Text(
                              'should be',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              children: [
                                Text(
                                  '${calorieProvider.caloriesPerDay ?? 0}',
                                  style: const TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                const Text(
                                  'kcal',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  '/day',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                BuildTrendingWidget(
                    colorStyle: colorStyle, trendingProvider: trendingProvider),
              ],
            ),
            BuildRecipeAddedWidget(colorStyle: colorStyle),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/screen/base/add_recipe_screen.dart';
import 'package:recipe_app/UI/view/widget/bottom_base_widget/initial_bottom_widget.dart';
import 'package:recipe_app/UI/view_model/add_recipe_provider.dart';
import 'package:recipe_app/UI/view_model/calorie_provider.dart';
import 'package:recipe_app/UI/view_model/initial_bottom_provider.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';
import 'package:recipe_app/UI/view_model/recipe_trending_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => InitialBottomProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecipeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CalorieProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddRecipeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecipeTrendingProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (context) => const InitialBottomWidget(),
          '/add_recipe': (context) => const AddRecipeScreen(),
        },
      ),
    );
  }
}

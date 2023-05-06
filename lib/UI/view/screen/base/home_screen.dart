import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/screen/base/calculate_calorie_screen.dart';
import 'package:recipe_app/UI/view/screen/other/search_recipe_screen.dart';
import 'package:recipe_app/UI/view/screen/other/show_recipe_list_screen.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view/widget/home_widget/show_recipe_added_widget.dart';
import 'package:recipe_app/UI/view_model/calorie_provider.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ColorStyle colorStyle = ColorStyle();
  bool isSaladPressed = false;
  bool isBreakfastPressed = false;
  bool isAppetizerPressed = false;
  bool isNoodlePressed = false;
  bool isLunchPressed = false;
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final calorieProvider =
          Provider.of<CalorieProvider>(context, listen: false);
      await calorieProvider.loadCaloriesFromPrefs();
      _heightController.text = calorieProvider.heightController.text;
      _weightController.text = calorieProvider.weightController.text;
    });
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
    final calorieProvider = Provider.of<CalorieProvider>(context);
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
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 28,
              ),
              child: TextField(
                cursorColor: colorStyle.base,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: colorStyle.base,
                  ),
                  hintText: 'Search recipes',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: colorStyle.base),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => SearchRecipeScreen(
                          recipes: recipeProvider.allRecipes)),
                    ),
                  );
                },
              ),
            ),
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
                                  // '${showCalorieProvider.caloriesPerDay ?? '-'}',
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
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CalculateCalorieScreen()));
                            },
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Trending now 🔥',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      InkWell(
                        child: Row(
                          children: [
                            Text(
                              'See all',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: colorStyle.base,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: colorStyle.base,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Popular category',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(
                              () {
                                isSaladPressed = !isSaladPressed;
                                isBreakfastPressed = false;
                                isAppetizerPressed = false;
                                isNoodlePressed = false;
                                isLunchPressed = false;
                              },
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              isSaladPressed
                                  ? Colors.red
                                  : Colors.transparent.withOpacity(0),
                            ),
                            fixedSize: MaterialStateProperty.all(
                              const Size.fromHeight(34),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: Text(
                            'Salad',
                            style: TextStyle(
                              color: isSaladPressed ? Colors.white : Colors.red,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isBreakfastPressed = !isBreakfastPressed;
                              isSaladPressed = false;
                              isAppetizerPressed = false;
                              isNoodlePressed = false;
                              isLunchPressed = false;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              isBreakfastPressed
                                  ? Colors.red
                                  : Colors.transparent.withOpacity(0),
                            ),
                            fixedSize: MaterialStateProperty.all(
                              const Size.fromHeight(34),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: Text(
                            'Breakfast',
                            style: TextStyle(
                              color: isBreakfastPressed
                                  ? Colors.white
                                  : Colors.red,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isAppetizerPressed = !isAppetizerPressed;
                              isSaladPressed = false;
                              isBreakfastPressed = false;
                              isNoodlePressed = false;
                              isLunchPressed = false;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              isAppetizerPressed
                                  ? Colors.red
                                  : Colors.transparent.withOpacity(0),
                            ),
                            fixedSize: MaterialStateProperty.all(
                              const Size.fromHeight(34),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: Text(
                            'Appetizer',
                            style: TextStyle(
                              color: isAppetizerPressed
                                  ? Colors.white
                                  : Colors.red,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isNoodlePressed = !isNoodlePressed;
                              isSaladPressed = false;
                              isAppetizerPressed = false;
                              isBreakfastPressed = false;
                              isLunchPressed = false;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              isNoodlePressed
                                  ? Colors.red
                                  : Colors.transparent.withOpacity(0),
                            ),
                            fixedSize: MaterialStateProperty.all(
                              const Size.fromHeight(34),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: Text(
                            'Noodle',
                            style: TextStyle(
                              color:
                                  isNoodlePressed ? Colors.white : Colors.red,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isLunchPressed = !isLunchPressed;
                              isSaladPressed = false;
                              isAppetizerPressed = false;
                              isNoodlePressed = false;
                              isBreakfastPressed = false;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              isLunchPressed
                                  ? Colors.red
                                  : Colors.transparent.withOpacity(0),
                            ),
                            fixedSize: MaterialStateProperty.all(
                              const Size.fromHeight(34),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: Text(
                            'Lunch',
                            style: TextStyle(
                              color: isLunchPressed ? Colors.white : Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Your recipe',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ShowRecipeListScreen(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              'See all',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: colorStyle.base,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: colorStyle.base,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Consumer<RecipeProvider>(
                      builder: (context, provider, child) {
                    return SizedBox(
                      height: 240,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: min(4, provider.allRecipes.length),
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 150,
                            child: ShowRecipeAddedWidget(
                                provider.allRecipes[index]),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 8);
                        },
                      ),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

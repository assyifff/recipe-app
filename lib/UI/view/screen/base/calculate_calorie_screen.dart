import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view/widget/calculate_calorie_widget/calorie_form_widget.dart';
import 'package:recipe_app/UI/view_model/calorie_provider.dart';

class CalculateCalorieScreen extends StatefulWidget {
  const CalculateCalorieScreen({Key? key}) : super(key: key);

  @override
  State<CalculateCalorieScreen> createState() => _CalculateCalorieScreenState();
}

class _CalculateCalorieScreenState extends State<CalculateCalorieScreen> {
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
    final calorieProvider =
        Provider.of<CalorieProvider>(context, listen: false);
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
              'Calculate calories',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'By monitoring your daily caloric intake, you can ensure that you are providing your body with the energy and nutrients it needs to function optimally.',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 35),
          CalorieFormWidget(
            calorieProvider: calorieProvider,
            colorStyle: colorStyle,
            mounted: mounted,
          ),
        ],
      ),
    );
  }
}

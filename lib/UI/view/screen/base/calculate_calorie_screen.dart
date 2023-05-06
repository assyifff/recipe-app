import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view_model/calorie_provider.dart';

class CalculateCalorieScreen extends StatefulWidget {
  const CalculateCalorieScreen({Key? key}) : super(key: key);

  @override
  State<CalculateCalorieScreen> createState() => _CalculateCalorieScreenState();
}

class _CalculateCalorieScreenState extends State<CalculateCalorieScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  ColorStyle colorStyle = ColorStyle();

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _heightController,
                    decoration: InputDecoration(
                      hintText: 'Enter your height (cm)',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      prefixIcon: const Icon(Icons.accessibility),
                      prefixIconColor: colorStyle.base,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorStyle.base,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _weightController,
                    decoration: InputDecoration(
                      hintText: 'Enter your weight (kg)',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      prefixIcon: const Icon(Icons.monitor_weight),
                      prefixIconColor: colorStyle.base,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorStyle.base,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  Consumer<CalorieProvider>(
                      builder: (context, calorieProvider, child) {
                    return Column(
                      children: [
                        const SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () async {
                            final height =
                                int.tryParse(_heightController.text) ?? 0;
                            final weight =
                                int.tryParse(_weightController.text) ?? 0;
                            await calorieProvider.calculateCalories(
                                height, weight);
                            _heightController.clear();
                            _weightController.clear();
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Your calorie: ${calorieProvider.caloriesPerDay ?? 0}! Please check your calories in home',
                                  ),
                                ),
                              );
                            }
                          },
                          style: ButtonStyle(
                              fixedSize: const MaterialStatePropertyAll(
                                Size(335, 54),
                              ),
                              backgroundColor:
                                  MaterialStatePropertyAll(colorStyle.base)),
                          child: const Text(
                            'Calculate',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

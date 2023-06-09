import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view_model/calorie_provider.dart';

class CalorieFormWidget extends StatelessWidget {
  CalorieFormWidget({
    super.key,
    required this.calorieProvider,
    required this.colorStyle,
    required this.mounted,
  });

  final CalorieProvider calorieProvider;
  final ColorStyle colorStyle;
  final bool mounted;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              controller: calorieProvider.heightController,
              validator: calorieProvider.validateCalorie,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: 'Enter your height (cm)',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorStyle.base, width: 1),
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
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorStyle.base,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedErrorBorder: OutlineInputBorder(
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
              controller: calorieProvider.weightController,
              validator: calorieProvider.validateCalorie,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: 'Enter your weight (kg)',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorStyle.base, width: 1),
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
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorStyle.base,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedErrorBorder: OutlineInputBorder(
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
                      if (_formKey.currentState!.validate()) {
                        final height = int.tryParse(
                                calorieProvider.heightController.text) ??
                            0;
                        final weight = int.tryParse(
                                calorieProvider.weightController.text) ??
                            0;
                        await calorieProvider.calculateCalories(height, weight);
                        calorieProvider.heightController.clear();
                        calorieProvider.weightController.clear();
                        _formKey.currentState!.reset();
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Your calorie: ${calorieProvider.caloriesPerDay ?? 0}! Please check your calories in home',
                              ),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'There is an error!',
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';

class CookTimeWidget extends StatelessWidget {
  const CookTimeWidget({
    super.key,
    required this.recipeProvider,
    required this.colorStyle,
    required this.timeItems,
  });

  final RecipeProvider recipeProvider;
  final ColorStyle colorStyle;
  final List<int?> timeItems;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: recipeProvider.cookTimeController,
      decoration: InputDecoration(
        filled: true,
        fillColor: colorStyle.textField,
        prefixIcon: const Icon(Icons.timer),
        prefixIconColor: colorStyle.base,
        suffixIconColor: colorStyle.base,
        hintText: 'Cook time (min)',
        suffixIcon: IconButton(
          onPressed: () {
            showModalBottomSheet(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 400,
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      Expanded(
                        child: ListView.builder(
                          itemCount: timeItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(
                                timeItems[index]!.toString(),
                                textAlign: TextAlign.center,
                              ),
                              onTap: () {
                                recipeProvider.cookTimeController.text =
                                    timeItems[index]!.toString();
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              },
            );
          },
          icon: const Icon(Icons.arrow_forward),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: colorStyle.textField),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}

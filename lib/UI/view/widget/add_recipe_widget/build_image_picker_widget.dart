import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view_model/add_recipe_provider.dart';

class BuildImagePickerWidget extends StatelessWidget {
  const BuildImagePickerWidget({
    super.key,
    required this.colorStyle,
  });

  final ColorStyle colorStyle;

  @override
  Widget build(BuildContext context) {
    return Consumer<AddRecipeProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29),
          child: Stack(
            children: [
              Center(
                child: provider.image != null
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colorStyle.base,
                        ),
                        height: 200,
                        width: 350,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            provider.image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        height: 200,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colorStyle.base,
                        ),
                      ),
              ),
              Column(
                children: [
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          onPressed: () {
                            provider.pickImage(ImageSource.gallery, context);
                          },
                          icon: Image.asset('assets/image/edit.png'),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

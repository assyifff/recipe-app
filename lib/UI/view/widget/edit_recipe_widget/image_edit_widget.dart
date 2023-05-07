import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view_model/edit_recipe_provider.dart';
import 'package:recipe_app/core/model/recipe_model.dart';

class ImageEditWidget extends StatefulWidget {
  final EditRecipeProvider provider;
  final RecipeModel recipeModel;

  const ImageEditWidget({
    Key? key,
    required this.provider,
    required this.recipeModel,
  }) : super(key: key);

  @override
  State<ImageEditWidget> createState() => _ImageEditWidgetState();
}

class _ImageEditWidgetState extends State<ImageEditWidget> {
  ColorStyle colorStyle = ColorStyle();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29),
      child: Stack(
        children: [
          Consumer<EditRecipeProvider>(
            builder: (context, provider, child) {
              return FutureBuilder<File?>(
                future: (provider.image ?? widget.recipeModel.image) != null
                    ? Future.value(provider.image ?? widget.recipeModel.image)
                    : Future.value(null),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final imageFile = snapshot.data!;
                    if (imageFile.existsSync()) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          imageFile,
                          fit: BoxFit.cover,
                          height: 180,
                          width: 335,
                        ),
                      );
                    } else {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Center(
                          child: Image.asset(
                            'assets/image/food_logo.jpg',
                            fit: BoxFit.cover,
                            height: 180,
                            width: 335,
                          ),
                        ),
                      );
                    }
                  }
                },
              );
            },
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
                      color: colorStyle.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: () {
                        widget.provider.pickImage(ImageSource.gallery, context);
                      },
                      icon: Image.asset('assets/image/edit.png'),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

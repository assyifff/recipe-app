import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditRecipeProvider extends ChangeNotifier {
  File? _image;

  File? get image => _image;

  Future<void> pickImage(ImageSource source, BuildContext context) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    _image = File(image.path);
    notifyListeners();
  }

  Future<File?> getImageFile(String? imagePath) async {
    if (imagePath == null || imagePath.isEmpty) {
      return null;
    }

    return null;
  }

  String? validateCalorie(String? value) {
    final number = int.tryParse(value ?? '');
    if (number == null) {
      return 'Please enter a valid calorie!';
    }
    return null;
  }

  String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a title!';
    }
    return null;
  }
}

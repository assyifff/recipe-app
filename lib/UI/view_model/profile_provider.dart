import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider extends ChangeNotifier {
  ImageProvider? _image;
  ImageProvider? get image => _image;

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    _image = FileImage(File(image.path));
    notifyListeners();
  }
}

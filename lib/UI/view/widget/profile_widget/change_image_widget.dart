import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view_model/profile_provider.dart';

class ChangeImageWidget extends StatelessWidget {
  const ChangeImageWidget({
    super.key,
    required this.colorStyle,
  });

  final ColorStyle colorStyle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorStyle.grey,
        ),
        child: Consumer<ProfileProvider>(builder: (context, provider, child) {
          return Stack(
            children: [
              CircleAvatar(
                radius: 90,
                backgroundImage: provider.image ??
                    const AssetImage('assets/image/food_logo.jpg'),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: colorStyle.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: () {
                      provider.pickImage(ImageSource.gallery);
                    },
                    icon: Image.asset('assets/image/edit.png'),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

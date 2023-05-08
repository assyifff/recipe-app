import 'package:flutter/material.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view/widget/profile_widget/change_image_widget.dart';
import 'package:recipe_app/UI/view/widget/profile_widget/popup_menu_widget.dart';
import 'package:recipe_app/UI/view/widget/profile_widget/show_user_recipe_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ColorStyle colorStyle = ColorStyle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            PopupMenuWidget(colorStyle: colorStyle),
            ChangeImageWidget(colorStyle: colorStyle),
            ShowUserRecipeWidget(colorStyle: colorStyle)
          ],
        ),
      ),
    );
  }
}

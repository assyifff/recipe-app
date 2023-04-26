import 'package:flutter/material.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view_model/initial_bottom_provider.dart';

class BottomItems extends StatelessWidget {
  const BottomItems({
    super.key,
    required this.provider,
    required this.colorStyle,
  });

  final InitialBottomProvider provider;
  final ColorStyle colorStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialButton(
              onPressed: () {
                provider.homeTab();
              },
              shape: const CircleBorder(),
              child: Icon(
                (Icons.home),
                color: provider.currentTab == 0
                    ? colorStyle.base
                    : Colors.black.withOpacity(0.2),
              ),
            ),
            MaterialButton(
              onPressed: () {
                provider.savedTab();
              },
              shape: const CircleBorder(),
              child: Icon(
                (Icons.bookmark),
                color: provider.currentTab == 1
                    ? colorStyle.base
                    : Colors.black.withOpacity(0.2),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialButton(
              onPressed: () {
                provider.notificationTab();
              },
              shape: const CircleBorder(),
              child: Icon(
                (Icons.notifications),
                color: provider.currentTab == 3
                    ? colorStyle.base
                    : Colors.black.withOpacity(0.2),
              ),
            ),
            MaterialButton(
              onPressed: () {
                provider.profileTab();
              },
              shape: const CircleBorder(),
              child: Icon(
                (Icons.person),
                color: provider.currentTab == 4
                    ? colorStyle.base
                    : Colors.black.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

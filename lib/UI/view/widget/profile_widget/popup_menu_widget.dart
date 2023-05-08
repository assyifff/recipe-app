import 'dart:io';
import 'package:flutter/material.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';

class PopupMenuWidget extends StatelessWidget {
  const PopupMenuWidget({
    super.key,
    required this.colorStyle,
  });

  final ColorStyle colorStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        top: 16,
        right: 16,
        bottom: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'My Profile',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_horiz),
            itemBuilder: ((context) => [
                  PopupMenuItem(
                    onTap: () {},
                    child: Row(
                      children: const [
                        Icon(Icons.settings),
                        SizedBox(width: 8),
                        Text('Settings'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {},
                    child: Row(
                      children: const [
                        Icon(Icons.info),
                        SizedBox(width: 8),
                        Text('About'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: (() => exit(0)),
                    child: Column(
                      children: [
                        Divider(
                          color: colorStyle.black,
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.exit_to_app_outlined,
                              color: colorStyle.base,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text('Exit'),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}

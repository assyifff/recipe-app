import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view/widget/bottom_base_widget/bottom_items_widget.dart';
import 'package:recipe_app/UI/view_model/initial_bottom_provider.dart';

class InitialBottomWidget extends StatefulWidget {
  const InitialBottomWidget({super.key});

  @override
  State<InitialBottomWidget> createState() => _InitialBottomWidgetState();
}

class _InitialBottomWidgetState extends State<InitialBottomWidget> {
  final ColorStyle colorStyle = ColorStyle();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InitialBottomProvider>(context);
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: provider.currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorStyle.base,
        onPressed: () {
          Navigator.pushNamed(context, '/add_recipe');
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 86,
          child: BottomItems(provider: provider, colorStyle: colorStyle),
        ),
      ),
    );
  }
}

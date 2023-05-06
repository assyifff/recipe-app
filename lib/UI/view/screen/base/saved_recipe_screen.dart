import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/widget/show_recipe_list_widget/show_recipe_list_widget.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';

class SavedRecipeScreen extends StatelessWidget {
  const SavedRecipeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          // appBar: AppBar(
          //   title: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const Text('My Recipes'),
          //       const SizedBox(
          //         height: 4,
          //       ),
          //       Text(
          //         'Favorite Recipes:',
          //         style: TextStyle(
          //           fontSize: 16,
          //           color: const Color.fromARGB(255, 244, 143, 177),
          //         ),
          //       )
          //     ],
          //   ),
          //   actions: [
          //     InkWell(
          //         onTap: () {
          //           // Navigator.of(context).push(
          //           //   MaterialPageRoute(
          //           //     builder: ((context) => SearchRecipeScreen(
          //           //         recipes: myProvider.favoriteRecipes)),
          //           //   ),
          //           // );
          //         },
          //         child: const Icon(Icons.search)),
          //     PopupMenuButton(
          //       color: Colors.blue[200],
          //       itemBuilder: ((context) => [
          //             PopupMenuItem(
          //               onTap: (() => Scaffold.of(context).openDrawer()),
          //               child: const Text('Open menu'),
          //             ),
          //             const PopupMenuItem(
          //               child: Text('About'),
          //             ),
          //             PopupMenuItem(
          //               onTap: (() => exit(0)),
          //               child: Column(
          //                 children: [
          //                   const Divider(
          //                     color: Colors.black,
          //                     thickness: 1,
          //                   ),
          //                   const SizedBox(
          //                     height: 5,
          //                   ),
          //                   Row(
          //                     children: const [
          //                       Icon(
          //                         Icons.exit_to_app_outlined,
          //                         color: Colors.red,
          //                       ),
          //                       SizedBox(
          //                         width: 10,
          //                       ),
          //                       Text('Exit'),
          //                     ],
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ]),
          //     ),
          //   ],
          // ),
          body: ListView(
            children: [
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.only(
                  left: 28,
                  top: 16,
                ),
                child: Text(
                  'Saved recipe',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 35),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.favoriteRecipes.length,
                itemBuilder: (context, index) {
                  return ShowRecipeListWidget(provider.favoriteRecipes[index]);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}

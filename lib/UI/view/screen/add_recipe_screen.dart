import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';
import 'package:recipe_app/UI/view_model/recipe_provider.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  ColorStyle colorStyle = ColorStyle();
  final _formKey = GlobalKey<FormState>();

  Future pickImage(BuildContext context, ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    // ignore: use_build_context_synchronously
    final picked = Provider.of<RecipeProvider>(context, listen: false).image =
        File(image.path);
    setState(() {});
    print('image picked $picked');
  }

  List<int?> timeItems = List.generate(500, (index) => index + 1);
  List<int?> serveItems = List.generate(50, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecipeProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 16,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Icon(Icons.more_horiz)
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Create recipe',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29),
              child: Stack(
                children: [
                  Center(
                    child: provider.image != null
                        ? Image.file(
                            provider.image!,
                            width: double.infinity,
                            height: 200,
                          )
                        : Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.amber,
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
                                pickImage(context, ImageSource.gallery);
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: provider.titleController,
                          decoration: InputDecoration(
                            hintText: 'Enter your recipe title',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 1),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: colorStyle.base,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: provider.caloriesController,
                          decoration: InputDecoration(
                            hintText: 'Enter food/drink calories (per 1 serve)',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 1),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: colorStyle.base,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          readOnly: true,
                          controller: provider.servesController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: colorStyle.textField,
                            prefixIcon: const Icon(Icons.people),
                            prefixIconColor: colorStyle.base,
                            suffixIconColor: colorStyle.base,
                            hintText: 'Serves',
                            suffixIcon: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 400,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 24),
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: serveItems.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return ListTile(
                                                  title: Text(
                                                    serveItems[index]!
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  onTap: () {
                                                    provider.servesController
                                                            .text =
                                                        serveItems[index]!
                                                            .toString();
                                                    Navigator.pop(context);
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.arrow_forward),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:
                                  BorderSide(color: colorStyle.textField),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          readOnly: true,
                          controller: provider.cookTimeController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: colorStyle.textField,
                            prefixIcon: const Icon(Icons.timer),
                            prefixIconColor: colorStyle.base,
                            suffixIconColor: colorStyle.base,
                            hintText: 'Cook time',
                            suffixIcon: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 400,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 24),
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: timeItems.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return ListTile(
                                                  title: Text(
                                                    timeItems[index]!
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  onTap: () {
                                                    provider.cookTimeController
                                                            .text =
                                                        timeItems[index]!
                                                            .toString();
                                                    Navigator.pop(context);
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.arrow_forward),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:
                                  BorderSide(color: colorStyle.textField),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Ingredients',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: provider.ingredientsController,
                          maxLines: 15,
                          maxLength: 1000,
                          decoration: InputDecoration(
                            hintText: 'Enter your recipe ingredients',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: colorStyle.base,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Steps',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: provider.stepsController,
                          maxLines: 15,
                          maxLength: 10000,
                          decoration: InputDecoration(
                            hintText: 'Enter your recipe ingredients',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: colorStyle.base,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      provider.insertNewRecipe();
                      provider.titleController.clear();
                      provider.caloriesController.clear();
                      provider.servesController.clear();
                      provider.cookTimeController.clear();
                      provider.ingredientsController.clear();
                      provider.stepsController.clear();
                      Navigator.pushReplacementNamed(context, '/');
                      provider.image = null;
                    },
                    style: ButtonStyle(
                        fixedSize: const MaterialStatePropertyAll(
                          Size(335, 54),
                        ),
                        backgroundColor:
                            MaterialStatePropertyAll(colorStyle.base)),
                    child: const Text(
                      'Save my recipes',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipe_app/UI/view/style/color_style.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  ColorStyle colorStyle = ColorStyle();
  final _titleController = TextEditingController();
  final _serveController = TextEditingController();
  final _timeController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _stepsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<String?> serveItems = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '> 10'
  ];

  List<String?> timeItems = [
    '1 min',
    '2 min',
    '3 min',
    '4 min',
    '5 min',
    '6 min',
    '7 min',
    '8 min',
    '9 min',
    '10 min',
    '11 min',
    '12 min',
    '13 min',
    '14 min',
    '15 min',
    '16 min',
    '17 min',
    '18 min',
    '19 min',
    '20 min',
    '21 min',
    '22 min',
    '23 min',
    '24 min',
    '25 min',
    '26 min',
    '27 min',
    '28 min',
    '29 min',
    '30 min',
    '35 min',
    '40 min',
    '45 min',
    '50 min',
    '55 min',
    '60 min',
    '65 min',
    '70 min',
    '75 min',
    '80 min',
    '85 min',
    '90 min',
  ];

  @override
  Widget build(BuildContext context) {
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
                    child: Container(
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
                                onPressed: () {},
                                icon: Image.asset('assets/image/edit.png')),
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
                          controller: _titleController,
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
                          readOnly: true,
                          controller: _serveController,
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
                                                    serveItems[index]!,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  onTap: () {
                                                    _serveController.text =
                                                        serveItems[index]!;
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
                          controller: _timeController,
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
                                                    timeItems[index]!,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  onTap: () {
                                                    _timeController.text =
                                                        timeItems[index]!;
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
                          controller: _ingredientsController,
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
                          controller: _stepsController,
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
                      // if (_formKey.currentState!.validate()) {
                      //   addRecipeProvider.addRecipe(RecipeModel(
                      //     title: _titleController.text,
                      //     serves: _serveController.text,
                      //     cookTime: _timeController.text,
                      //     ingredients: _ingredientsController.text,
                      //     steps: _stepsController.text,
                      //   ));
                      //   Navigator.pushReplacementNamed(context, '/');
                      //   _titleController.clear();
                      //   _serveController.clear();
                      //   _timeController.clear();
                      //   _ingredientsController.clear();
                      //   _stepsController.clear();
                      // }
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

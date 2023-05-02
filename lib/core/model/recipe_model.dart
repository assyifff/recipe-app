import 'dart:io';

class RecipeModel {
  int? id;
  late String title;
  late bool isSaved;
  File? image;
  late int cookTime;
  late String ingredients;
  late String steps;
  late int serves;
  late int calories;

  RecipeModel({
    this.id,
    required this.title,
    required this.isSaved,
    this.image,
    required this.cookTime,
    required this.ingredients,
    required this.steps,
    required this.serves,
    required this.calories,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isSaved': isSaved ? 1 : 0,
      'cookTime': cookTime,
      'ingredients': ingredients,
      'steps': steps,
      'image': image == null ? '' : image!.path,
      'serves': serves,
      'calories': calories,
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      id: map['id'],
      title: map['title'],
      isSaved: map['isSaved'] == 1 ? true : false,
      cookTime: map['cookTime'],
      ingredients: map['ingredients'],
      steps: map['steps'],
      image: map['image'] != null ? File(map['image']) : null,
      serves: map['serves'],
      calories: map['calories'],
    );
  }
}

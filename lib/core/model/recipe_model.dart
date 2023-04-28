class RecipeModel {
  late int? id;
  late String? title;
  late String? serves;
  late String? cookTime;
  late String? ingredients;
  late String? steps;

  RecipeModel({
    this.id,
    this.ingredients,
    this.title,
    this.serves,
    this.cookTime,
    this.steps,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'serves': serves,
      'cookTime': cookTime,
      'ingredients': ingredients,
      'steps': steps,
    };
  }

  RecipeModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    serves = map['serves'];
    cookTime = map['cookTime'];
    ingredients = map['ingredients'];
    steps = map['steps'];
  }
}

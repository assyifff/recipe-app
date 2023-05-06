class CalorieModel {
  int? id;
  late int height;
  late int weight;

  CalorieModel({
    this.id,
    required this.height,
    required this.weight,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'height': height,
      'weight': weight,
    };
  }

  factory CalorieModel.fromMap(Map<String, dynamic> map) {
    return CalorieModel(
      id: map['id'],
      height: map['height'],
      weight: map['weight'],
    );
  }
}

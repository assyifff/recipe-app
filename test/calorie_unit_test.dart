import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/core/helper/calorie_helper.dart';
import 'package:recipe_app/core/model/calorie_model.dart';

class MockCalorieHelper extends Mock implements CalorieHelper {}

void main() {
  group('Test calorie\n', () {
    late MockCalorieHelper mockCalorieHelper;

    setUp(() async {
      mockCalorieHelper = MockCalorieHelper();
    });

    test('Test inserting calorie', () async {
      final calorieModel = CalorieModel(
        height: 175,
        weight: 70,
      );
      when(mockCalorieHelper.insertNewCalorie(calorieModel))
          .thenAnswer((_) async => null);
      await mockCalorieHelper.insertNewCalorie(calorieModel);
      verify(mockCalorieHelper.insertNewCalorie(calorieModel)).called(1);
    });
  });
}

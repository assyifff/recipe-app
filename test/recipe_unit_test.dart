import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/core/helper/recipe_helper.dart';
import 'package:recipe_app/core/model/recipe_model.dart';

class MockRecipeHelper extends Mock implements RecipeHelper {}

void main() {
  group('Test recipe\n', () {
    late MockRecipeHelper mockHelper;
    setUp(() {
      mockHelper = MockRecipeHelper();
    });
    test('Test inserting recipe', () async {
      final recipeModel = RecipeModel(
        title: 'Test Recipe',
        isSaved: true,
        image: File('test.jpg'),
        cookTime: 30,
        ingredients: 'Ingredient 1, Ingredient 2',
        steps: 'Step 1, Step 2',
        serves: 2,
        calories: 200,
      );

      when(mockHelper.insertNewRecipe(recipeModel))
          .thenAnswer((_) async => null);
      await mockHelper.insertNewRecipe(recipeModel);
      verify(mockHelper.insertNewRecipe(recipeModel)).called(1);
    });

    test('Test updating recipe', () async {
      final recipeModel = RecipeModel(
        id: 1,
        title: 'Test Recipe',
        isSaved: true,
        image: File('test.jpg'),
        cookTime: 30,
        ingredients: 'Ingredient 1, Ingredient 2',
        steps: 'Step 1, Step 2',
        serves: 2,
        calories: 200,
      );

      when(mockHelper.updateRecipe(recipeModel)).thenAnswer((_) async => null);
      await mockHelper.updateRecipe(recipeModel);
      verify(mockHelper.updateRecipe(recipeModel)).called(1);
    });

    test('Test deleting recipe', () async {
      final recipeModel = RecipeModel(
        id: 1,
        title: 'Test Recipe',
        isSaved: true,
        image: File('test.jpg'),
        cookTime: 30,
        ingredients: 'Ingredient 1, Ingredient 2',
        steps: 'Step 1, Step 2',
        serves: 2,
        calories: 200,
      );

      when(mockHelper.deleteRecipe(recipeModel)).thenAnswer((_) async => null);
      await mockHelper.deleteRecipe(recipeModel);
      verify(mockHelper.deleteRecipe(recipeModel)).called(1);
    });
  });
}

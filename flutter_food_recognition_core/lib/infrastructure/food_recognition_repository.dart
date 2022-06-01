import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';

import '../core/food_recognition_exceptions.dart';
import '../core/food_recognition_failures.dart';
import '../domain/food_recognition.dart';
import '../domain/i_food_recognition_repository.dart';
import 'food_recognition_data_source.dart';

class FoodRecognitionRepository implements IFoodRecognitionRepository {
  final FoodRecognitionDataSource _foodRecognitionDataSource;

  FoodRecognitionRepository({required FoodRecognitionDataSource foodRecognitionDataSource})
      : _foodRecognitionDataSource = foodRecognitionDataSource;

  @override
  Future<Either<FoodRecognitionFailure, List<FoodRecognition>>> recognize(String image) async {
    try {
      final recognizedFoods = await _foodRecognitionDataSource.recognize(image);

      return right(
        recognizedFoods
            .map(
              (recognizedFood) => recognizedFood.toDomain(),
            )
            .toList(),
      );
    } on NoFoodDetectedException {
      return left(FoodRecognitionFailure.noFoodDetected);
    }
  }
}

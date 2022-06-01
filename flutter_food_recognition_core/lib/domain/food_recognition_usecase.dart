import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';

import '../core/food_recognition_failures.dart';
import '../core/usecases/usecase.dart';
import 'food_recognition.dart';
import 'food_recognition_value_transformers.dart';
import 'i_food_recognition_repository.dart';

typedef UseCaseType = Either<FoodRecognitionFailure, KtList<FoodRecognition>>;

class FoodRecognitionUseCase implements UseCase<UseCaseType, String> {
  final List<IFoodRecognitionRepository> _foodRecognitionRepositories;

  FoodRecognitionUseCase({required List<IFoodRecognitionRepository> foodRecognitionRepositories})
      : _foodRecognitionRepositories = foodRecognitionRepositories;

  @override
  Future<UseCaseType> call(
    String parameter,
  ) async {
    final recognizedFoodRepositories = await Future.wait(
      _foodRecognitionRepositories
          .map(
            (foodRecognitionRepository) => foodRecognitionRepository.recognize(parameter),
          )
          .toList(),
    );
    var recognizedFoodsFinal = <FoodRecognition>[];
    recognizedFoodRepositories.forEach((recognizedFoodRepository) {
      final recognizedFoods = recognizedFoodRepository.fold(
        (_) => <FoodRecognition>[],
        (recognizedFoods) => recognizedFoods,
      );
      recognizedFoodsFinal = chooseFoodsDuplicatesByBestScore(
        recognizedFoodsFinal: recognizedFoodsFinal,
        recognizedFoods: recognizedFoods,
      );
    });

    if (recognizedFoodsFinal.isEmpty) {
      return left(FoodRecognitionFailure.noFoodDetected);
    }

    return right(recognizedFoodsFinal.toImmutableList());
  }
}

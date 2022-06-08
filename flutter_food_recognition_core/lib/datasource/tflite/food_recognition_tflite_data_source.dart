import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';

import '../../core/food_recognition_exceptions.dart';
import '../../infrastructure/food_recognition_data_source.dart';
import '../../infrastructure/food_recognition_dto.dart';

class FoodRecognitionTfliteDataSource implements FoodRecognitionDataSource {
  FoodRecognitionTfliteDataSource();

  @override
  Future<List<FoodRecognitionDto>> recognize(String image) async {
    final recognizedFoods = await Tflite.runModelOnImage(
      path: image,
      numResults: 3,
      threshold: 0.05,
      imageMean: 50,
      imageStd: 300,
      asynch: false,
    );
    if (recognizedFoods!.isEmpty) {
      throw NoRecognizedFoodException();
    }

    return recognizedFoods
        .map(
          (recognizedFood) => FoodRecognitionDto.fromTflite(
            Map<String, Object>.from(recognizedFood as Map),
          ),
        )
        .toList();
  }
}

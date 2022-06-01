import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';

import '../../infrastructure/food_recognition_dto.dart';
import 'food_recognition_tflite_data_source.dart';

class FoodRecognitionTfliteHubDataSource extends FoodRecognitionTfliteDataSource {
  @override
  Future<List<FoodRecognitionDto>> recognize(String image) async {
    Tflite.loadModel(
      model: 'assets/models/tflite_hub/lite-model_aiy_vision_classifier_food_V1_1.tflite',
      labels: 'assets/models/tflite_hub/lite-model_aiy_vision_classifier_food_V1_1.txt',
    );
    final recognizedFoods = await super.recognize(image);
    Tflite.close();

    return recognizedFoods;
  }
}

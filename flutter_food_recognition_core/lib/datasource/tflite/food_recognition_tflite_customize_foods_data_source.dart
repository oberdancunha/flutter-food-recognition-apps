import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';

import '../../infrastructure/food_recognition_dto.dart';
import 'food_recognition_tflite_data_source.dart';

class FoodRecognitionTfliteCustomizeFoodsDataSource extends FoodRecognitionTfliteDataSource {
  @override
  Future<List<FoodRecognitionDto>> recognize(String image) async {
    Tflite.loadModel(
      model: 'assets/models/customize_foods/customize_foods.tflite',
      labels: 'assets/models/customize_foods/customize_foods.txt',
    );
    final recognizedFoods = await super.recognize(image);
    Tflite.close();

    return recognizedFoods;
  }
}

import 'food_recognition_dto.dart';

abstract class FoodRecognitionDataSource {
  Future<List<FoodRecognitionDto>> recognize(String image);
}

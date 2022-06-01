import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';

import '../core/food_recognition_failures.dart';
import 'food_recognition.dart';

abstract class IFoodRecognitionRepository {
  Future<Either<FoodRecognitionFailure, List<FoodRecognition>>> recognize(String image);
}

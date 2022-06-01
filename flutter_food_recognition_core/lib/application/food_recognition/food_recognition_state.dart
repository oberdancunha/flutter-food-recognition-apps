import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';

import '../../core/food_recognition_failures.dart';
import '../../domain/food_recognition.dart';

abstract class FoodRecognitionState {}

class FoodRecognitionInitialState extends FoodRecognitionState {}

class FoodRecognitionLoadingState extends FoodRecognitionState {}

class FoodRecognitionSuccessState extends FoodRecognitionState {
  final KtList<FoodRecognition> recognizedFoods;

  FoodRecognitionSuccessState({required this.recognizedFoods});
}

class FoodRecognitionFailureState extends FoodRecognitionState {
  final FoodRecognitionFailure failure;

  FoodRecognitionFailureState({required this.failure});
}

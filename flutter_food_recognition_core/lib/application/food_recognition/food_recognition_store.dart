import 'package:flutter/material.dart';

import '../../domain/food_recognition_usecase.dart';
import 'food_recognition_state.dart';

class FoodRecognitionStore extends ValueNotifier<FoodRecognitionState> {
  final FoodRecognitionUseCase foodRecognitionUseCase;

  FoodRecognitionStore({
    required this.foodRecognitionUseCase,
  }) : super(FoodRecognitionInitialState());

  Future<void> fetchFoodRecognition(String image) async {
    value = FoodRecognitionLoadingState();
    final recognizedFoods = await foodRecognitionUseCase(image);
    value = recognizedFoods.fold(
      (failure) => FoodRecognitionFailureState(failure: failure),
      (recognizedFoods) => FoodRecognitionSuccessState(recognizedFoods: recognizedFoods),
    );
  }
}

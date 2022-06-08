import 'package:flutter/material.dart';
import 'package:flutter_food_recognition_core/core/food_recognition_failures.dart';

import 'no_food_recognized_widget.dart';

class FoodRecognitionFailureWidget extends StatelessWidget {
  final FoodRecognitionFailure failure;

  const FoodRecognitionFailureWidget({
    required this.failure,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    switch (failure) {
      case FoodRecognitionFailure.noRecognizedFood:
        return const NoFoodRecognizedWidget();
    }
  }
}

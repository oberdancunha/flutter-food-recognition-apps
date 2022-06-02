import 'package:flutter/material.dart';
import 'package:flutter_food_recognition_core/application/food_recognition/food_recognition_state.dart';
import 'package:flutter_food_recognition_core/application/food_recognition/food_recognition_store.dart';
import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';

import 'food_recognition_result_list_widget.dart';

class FoodRecognitionResultWidget extends StatefulWidget {
  final String imagePath;

  const FoodRecognitionResultWidget({
    required this.imagePath,
    super.key,
  });

  @override
  State<FoodRecognitionResultWidget> createState() => _FoodRecognitionResultWidgetState();
}

class _FoodRecognitionResultWidgetState extends State<FoodRecognitionResultWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FoodRecognitionStore>().fetchFoodRecognition(widget.imagePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    final foodRecognitionStore = context.watch<FoodRecognitionStore>();
    final foodRecognitionState = foodRecognitionStore.value;

    return _selectWidgetByState(foodRecognitionState);
  }

  Widget _selectWidgetByState(FoodRecognitionState foodRecognitionState) {
    switch (foodRecognitionState.runtimeType) {
      case FoodRecognitionSuccessState:
        return FoodRecognitionResultListWidget(
          recognizedFoods: (foodRecognitionState as FoodRecognitionSuccessState).recognizedFoods,
        );
      case FoodRecognitionFailureState:
        return const SizedBox.shrink();
      default:
        return const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
    }
  }
}

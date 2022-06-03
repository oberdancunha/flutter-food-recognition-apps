import 'package:flutter/material.dart';
import 'package:flutter_food_recognition_core/application/food_recognition/food_recognition_state.dart';
import 'package:flutter_food_recognition_core/application/food_recognition/food_recognition_store.dart';
import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';

import 'no_food_recognized_widget.dart';
import 'recognized_food_list_widget.dart';

class FetchResultWidget extends StatefulWidget {
  final String imagePath;

  const FetchResultWidget({
    required this.imagePath,
    super.key,
  });

  @override
  State<FetchResultWidget> createState() => _FetchResultWidgetState();
}

class _FetchResultWidgetState extends State<FetchResultWidget> {
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
        return RecognizedFoodListWidget(
          recognizedFoods: (foodRecognitionState as FoodRecognitionSuccessState).recognizedFoods,
        );
      case FoodRecognitionFailureState:
        return const Expanded(
          child: Center(
            child: NoFoodRecognizedWidget(),
          ),
        );
      default:
        return const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
    }
  }
}

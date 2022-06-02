import 'package:flutter/material.dart';
import 'package:flutter_food_recognition_core/domain/food_recognition.dart';
import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';

class FoodRecognitionResultListWidget extends StatelessWidget {
  final KtList<FoodRecognition> recognizedFoods;

  const FoodRecognitionResultListWidget({
    required this.recognizedFoods,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: recognizedFoods.size,
          itemBuilder: (_, index) => Text(recognizedFoods.elementAt(index).food),
        ),
      );
}

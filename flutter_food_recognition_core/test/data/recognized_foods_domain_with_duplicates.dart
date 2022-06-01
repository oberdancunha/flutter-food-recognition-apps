import 'package:flutter_food_recognition_core/domain/food_recognition.dart';

final mockDataRecognizedFoodsWithDuplicatesDomain = [
  const FoodRecognition(
    food: 'grilled_salmon',
    score: 0.1813567578792572,
  ),
  const FoodRecognition(
    food: "filet_mignon",
    score: 0.10687194764614105,
  ),
  const FoodRecognition(
    food: "filet_mignon",
    score: 0.8,
  ),
];

final mockDataRecognizedFoodsWithoutDuplicatesDomain = [
  const FoodRecognition(
    food: 'grilled_salmon',
    score: 0.1813567578792572,
  ),
  const FoodRecognition(
    food: "filet_mignon",
    score: 0.8,
  ),
];

import 'package:flutter_food_recognition_core/domain/food_recognition.dart';

final mockDataRecognizedFoodsFirstModelDomain = [
  const FoodRecognition(
    food: 'grilled_salmon',
    score: 0.1813567578792572,
  ),
  const FoodRecognition(
    food: "filet_mignon",
    score: 0.10687194764614105,
  ),
];

final mockDataRecognizedFoodsSecondModelDuplicateDomain = [
  const FoodRecognition(
    food: "filet_mignon",
    score: 0.8,
  ),
];

final mockDataRecognizedFoodsTwoModelsWithoutDuplicatesDomain = [
  const FoodRecognition(
    food: 'grilled_salmon',
    score: 0.1813567578792572,
  ),
  const FoodRecognition(
    food: "filet_mignon",
    score: 0.8,
  ),
];

final mockDataRecognizedFoodsSecondModelDomain = [
  const FoodRecognition(
    food: "french_fries",
    score: 0.52377478950059,
  ),
];

final mockDataRecognizedFoodsFirstAndSecondModelsDomain = [
  const FoodRecognition(
    food: 'grilled_salmon',
    score: 0.1813567578792572,
  ),
  const FoodRecognition(
    food: "filet_mignon",
    score: 0.10687194764614105,
  ),
  const FoodRecognition(
    food: "french_fries",
    score: 0.52377478950059,
  ),
];

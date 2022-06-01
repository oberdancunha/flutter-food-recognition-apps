import 'food_recognition.dart';

List<FoodRecognition> chooseFoodsDuplicatesByBestScore({
  required List<FoodRecognition> recognizedFoodsFinal,
  required List<FoodRecognition> recognizedFoods,
}) {
  for (final recognizedFood in recognizedFoods) {
    final foodIndex = _findDuplicateByName(
      recognizedFoodsFinal: recognizedFoodsFinal,
      recognizedFood: recognizedFood,
    );
    if (_wasFoodFound(foodIndex)) {
      final recognizedFoodFinalScore = recognizedFoodsFinal.elementAt(foodIndex).score;
      if (_wasFoodRecognizeBestScore(
        recognizedFoodFinalScore: recognizedFoodFinalScore,
        recognizedFoodScore: recognizedFood.score,
      )) {
        recognizedFoodsFinal
          ..removeAt(foodIndex)
          ..add(recognizedFood);
      }
    } else {
      recognizedFoodsFinal.add(recognizedFood);
    }
  }

  return recognizedFoodsFinal;
}

int _findDuplicateByName({
  required List<FoodRecognition> recognizedFoodsFinal,
  required FoodRecognition recognizedFood,
}) =>
    recognizedFoodsFinal.indexWhere(
      (recognizedFoodNormalized) => recognizedFoodNormalized.food == recognizedFood.food,
    );

bool _wasFoodFound(int foodIndex) => foodIndex > -1;

bool _wasFoodRecognizeBestScore({
  required double recognizedFoodFinalScore,
  required double recognizedFoodScore,
}) =>
    recognizedFoodScore > recognizedFoodFinalScore;

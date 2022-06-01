import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';

import '../domain/food_recognition.dart';

class FoodRecognitionDto extends Equatable {
  final String food;
  final double score;

  const FoodRecognitionDto({
    required this.food,
    required this.score,
  });

  FoodRecognition toDomain() => FoodRecognition(
        food: food,
        score: score,
      );

  factory FoodRecognitionDto.fromTflite(Map<String, Object> data) => FoodRecognitionDto(
        food: data['label'].toString(),
        score: double.tryParse(data['confidence'].toString())!,
      );

  @override
  List<Object?> get props => [
        food,
        score,
      ];
}

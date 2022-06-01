import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';

import '../application/food_recognition/food_recognition_store.dart';
import '../datasource/tflite/food_recognition_tflite_customize_foods_data_source.dart';
import '../datasource/tflite/food_recognition_tflite_hub_data_source.dart';
import '../domain/food_recognition_usecase.dart';
import '../infrastructure/food_recognition_data_source.dart';
import '../infrastructure/food_recognition_repository.dart';

final providers = [
  Provider<FoodRecognitionDataSource>(
    create: (_) => FoodRecognitionTfliteCustomizeFoodsDataSource(),
  ),
  Provider<FoodRecognitionDataSource>(create: (_) => FoodRecognitionTfliteHubDataSource()),
  Provider<FoodRecognitionUseCase>(
    create: (context) => FoodRecognitionUseCase(
      foodRecognitionRepositories: [
        FoodRecognitionRepository(
          foodRecognitionDataSource: context.read<FoodRecognitionTfliteCustomizeFoodsDataSource>(),
        ),
        FoodRecognitionRepository(
          foodRecognitionDataSource: context.read<FoodRecognitionTfliteHubDataSource>(),
        ),
      ],
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => FoodRecognitionStore(
      foodRecognitionUseCase: context.read<FoodRecognitionUseCase>(),
    ),
  ),
];

import 'package:flutter_food_recognition_core/core/food_recognition_exceptions.dart';
import 'package:flutter_food_recognition_core/core/food_recognition_failures.dart';
import 'package:flutter_food_recognition_core/domain/food_recognition.dart';
import 'package:flutter_food_recognition_core/infrastructure/food_recognition_data_source.dart';
import 'package:flutter_food_recognition_core/infrastructure/food_recognition_repository.dart';
import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../data/recognized_foods_domain.dart';
import '../data/recognized_foods_dto.dart';

class MockFoodRecognitionDataSource extends Mock implements FoodRecognitionDataSource {}

void main() {
  late MockFoodRecognitionDataSource mockFoodRecognitionDataSource;
  late FoodRecognitionRepository foodRecognitionRepository;

  setUpAll(
    () {
      mockFoodRecognitionDataSource = MockFoodRecognitionDataSource();
      foodRecognitionRepository = FoodRecognitionRepository(
        foodRecognitionDataSource: mockFoodRecognitionDataSource,
      );
    },
  );

  Future<Either<FoodRecognitionFailure, List<FoodRecognition>>>
      callRepositoryAndVerifyDataSourceCall() async {
    final recognizedFoods = await foodRecognitionRepository.recognize("");
    verify(() => mockFoodRecognitionDataSource.recognize(any())).called(1);

    return recognizedFoods;
  }

  group(
    'Foods recognized success |',
    () {
      test(
        'Should return the list of recognized foods',
        () async {
          when(() => mockFoodRecognitionDataSource.recognize(any())).thenAnswer(
            (_) async => mockDataRecognizedFoodsDto,
          );
          final recognizedFoods = await callRepositoryAndVerifyDataSourceCall();
          expect(recognizedFoods, isA<Right>());
          expect(
            recognizedFoods.toString(),
            equals(
              right<FoodRecognitionFailure, List<FoodRecognition>>(mockDataRecognizedFoodsDomain)
                  .toString(),
            ),
          );
        },
      );
    },
  );

  group(
    'Foods recognized failure |',
    () {
      test(
        'Should return a FoodRecognitionFailure.noRecognizedFood() when there is a NoRecognizedFoodException',
        () async {
          when(() => mockFoodRecognitionDataSource.recognize(any()))
              .thenThrow(NoRecognizedFoodException());
          final recognizedFoods = await callRepositoryAndVerifyDataSourceCall();
          expect(recognizedFoods, isA<Left>());
          expect(
            recognizedFoods,
            equals(
              left<FoodRecognitionFailure, List<FoodRecognition>>(
                FoodRecognitionFailure.noRecognizedFood,
              ),
            ),
          );
        },
      );
    },
  );
}

import 'package:flutter_food_recognition_core/application/food_recognition/food_recognition_state.dart';
import 'package:flutter_food_recognition_core/application/food_recognition/food_recognition_store.dart';
import 'package:flutter_food_recognition_core/core/food_recognition_failures.dart';
import 'package:flutter_food_recognition_core/domain/food_recognition_usecase.dart';
import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:value_listenable_test/value_listenable_test.dart';

import '../../data/recognized_foods_domain.dart';

class MockFoodRecognitionUseCase extends Mock implements FoodRecognitionUseCase {}

void main() {
  late MockFoodRecognitionUseCase mockFoodRecognitionUseCase;
  late FoodRecognitionStore foodRecognitionStore;

  setUpAll(() {
    mockFoodRecognitionUseCase = MockFoodRecognitionUseCase();
  });

  setUp(() {
    foodRecognitionStore = FoodRecognitionStore(foodRecognitionUseCase: mockFoodRecognitionUseCase);
  });

  valueListenableTest<FoodRecognitionStore>(
    'Should change the state from initial to loading first and then to success',
    build: () {
      when(() => mockFoodRecognitionUseCase(any())).thenAnswer(
        (_) async => right(mockDataRecognizedFoodsDomain.toImmutableList()),
      );

      return foodRecognitionStore;
    },
    act: (store) => store.fetchFoodRecognition(""),
    expect: () => [
      isA<FoodRecognitionLoadingState>(),
      isA<FoodRecognitionSuccessState>(),
    ],
  );

  valueListenableTest<FoodRecognitionStore>(
    'Should change the state from initial to loading first and then to noRecognizedFoods failure',
    build: () {
      when(() => mockFoodRecognitionUseCase(any())).thenAnswer(
        (_) async => left(FoodRecognitionFailure.noRecognizedFoods),
      );

      return foodRecognitionStore;
    },
    act: (store) => store.fetchFoodRecognition(""),
    expect: () => [
      isA<FoodRecognitionLoadingState>(),
      isA<FoodRecognitionFailureState>(),
    ],
  );

  tearDown(() {
    foodRecognitionStore.dispose();
  });
}

import 'package:flutter_food_recognition_core/core/food_recognition_failures.dart';
import 'package:flutter_food_recognition_core/domain/food_recognition.dart';
import 'package:flutter_food_recognition_core/domain/food_recognition_usecase.dart';
import 'package:flutter_food_recognition_core/domain/i_food_recognition_repository.dart';
import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../data/recognized_foods_domain.dart';
import '../data/recognized_foods_domain_with_duplicates.dart';
import '../data/recognized_foods_more_one_model_domain.dart';

class MockFoodRecognitionRepository extends Mock implements IFoodRecognitionRepository {}

class MockFoodRecognitionRepositorySecondModel extends Mock implements IFoodRecognitionRepository {}

void main() {
  late MockFoodRecognitionRepository mockFoodRecognitionRepository;
  late MockFoodRecognitionRepositorySecondModel mockFoodRecognitionRepositorySecondModel;

  setUpAll(
    () {
      mockFoodRecognitionRepository = MockFoodRecognitionRepository();
      mockFoodRecognitionRepositorySecondModel = MockFoodRecognitionRepositorySecondModel();
    },
  );

  group(
    'Call only one repository |',
    () {
      late FoodRecognitionUseCase foodRecognitionUseCase;

      setUpAll(
        () {
          foodRecognitionUseCase = FoodRecognitionUseCase(
            foodRecognitionRepositories: [
              mockFoodRecognitionRepository,
            ],
          );
        },
      );

      Future<UseCaseType> callUseCaseAndVerifyRepositoryCall() async {
        final recognizedFoods = await foodRecognitionUseCase("");
        verify(() => mockFoodRecognitionRepository.recognize(any()))
            .called(greaterThanOrEqualTo(1));

        return recognizedFoods;
      }

      group('Foods recognized success |', () {
        void mockCallRepositorySuccess(List<FoodRecognition> recognizedFoodsDomain) {
          when(() => mockFoodRecognitionRepository.recognize(any())).thenAnswer(
            (_) async => right(recognizedFoodsDomain),
          );
        }

        test(
          'Should return the list of recognized foods',
          () async {
            mockCallRepositorySuccess(mockDataRecognizedFoodsDomain);
            final recognizedFoods = await callUseCaseAndVerifyRepositoryCall();
            expect(recognizedFoods, isA<Right>());
            expect(recognizedFoods, equals(right(mockDataRecognizedFoodsDomain.toImmutableList())));
          },
        );

        test(
          'Should return the list of recognized foods without filet mignon duplicated, choosing with score equal to 0.8 |',
          () async {
            mockCallRepositorySuccess(mockDataRecognizedFoodsWithDuplicatesDomain);
            final recognizedFoods = await callUseCaseAndVerifyRepositoryCall();
            expect(recognizedFoods, isA<Right>());
            expect(
              recognizedFoods,
              equals(
                right(mockDataRecognizedFoodsWithoutDuplicatesDomain.toImmutableList()),
              ),
            );
          },
        );
      });

      group('Foods recognized failure |', () {
        test(
          'Should return a failure when no food is recognized',
          () async {
            when(() => mockFoodRecognitionRepository.recognize(any())).thenAnswer(
              (_) async => left(FoodRecognitionFailure.noRecognizedFood),
            );
            final recognizedFoods = await callUseCaseAndVerifyRepositoryCall();
            expect(recognizedFoods, isA<Left>());
            expect(recognizedFoods, equals(left(FoodRecognitionFailure.noRecognizedFood)));
          },
        );
      });
    },
  );

  group(
    'Call two repositories |',
    () {
      late FoodRecognitionUseCase foodRecognitionUseCaseTwoModels;

      setUpAll(() {
        foodRecognitionUseCaseTwoModels = FoodRecognitionUseCase(
          foodRecognitionRepositories: [
            mockFoodRecognitionRepository,
            mockFoodRecognitionRepositorySecondModel,
          ],
        );
      });

      Future<UseCaseType> callUseCaseAndVerifyRepositoriesCall() async {
        final recognizedFoods = await foodRecognitionUseCaseTwoModels("");
        verify(() => mockFoodRecognitionRepository.recognize(any()))
            .called(greaterThanOrEqualTo(1));
        verify(() => mockFoodRecognitionRepositorySecondModel.recognize(any()))
            .called(greaterThanOrEqualTo(1));

        return recognizedFoods;
      }

      test(
        'Should return the list of recognized foods with the union of two models |',
        () async {
          when(() => mockFoodRecognitionRepository.recognize(any())).thenAnswer(
            (_) async => right(mockDataRecognizedFoodsFirstModelDomain),
          );
          when(() => mockFoodRecognitionRepositorySecondModel.recognize(any())).thenAnswer(
            (_) async => right(mockDataRecognizedFoodsSecondModelDomain),
          );
          final recognizedFoods = await callUseCaseAndVerifyRepositoriesCall();
          expect(recognizedFoods, isA<Right>());
          expect(
            recognizedFoods,
            equals(
              right(mockDataRecognizedFoodsFirstAndSecondModelsDomain.toImmutableList()),
            ),
          );
        },
      );

      test(
        'Should return the list of recognized foods without filet mignon duplicated, choosing with score equal to 0.8 |',
        () async {
          when(() => mockFoodRecognitionRepository.recognize(any())).thenAnswer(
            (_) async => right(mockDataRecognizedFoodsFirstModelDomain),
          );
          when(() => mockFoodRecognitionRepositorySecondModel.recognize(any())).thenAnswer(
            (_) async => right(mockDataRecognizedFoodsSecondModelDuplicateDomain),
          );
          final recognizedFoods = await callUseCaseAndVerifyRepositoriesCall();
          expect(recognizedFoods, isA<Right>());
          expect(
            recognizedFoods,
            equals(
              right(mockDataRecognizedFoodsTwoModelsWithoutDuplicatesDomain.toImmutableList()),
            ),
          );
        },
      );

      test(
        'Should return a failure when no food is recognized in any repository',
        () async {
          when(() => mockFoodRecognitionRepository.recognize(any())).thenAnswer(
            (_) async => left(FoodRecognitionFailure.noRecognizedFood),
          );
          when(() => mockFoodRecognitionRepositorySecondModel.recognize(any())).thenAnswer(
            (_) async => left(FoodRecognitionFailure.noRecognizedFood),
          );
          final recognizedFoods = await callUseCaseAndVerifyRepositoriesCall();
          expect(recognizedFoods, isA<Left>());
          expect(recognizedFoods, equals(left(FoodRecognitionFailure.noRecognizedFood)));
        },
      );
    },
  );
}

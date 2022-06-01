import 'package:flutter/services.dart';
import 'package:flutter_food_recognition_core/core/food_recognition_exceptions.dart';
import 'package:flutter_food_recognition_core/datasource/tflite/food_recognition_tflite_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/recognized_foods_dto.dart';
import '../../data/recognized_foods_tflite.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late FoodRecognitionTfliteDataSource foodRecognitionTfliteDatasource;

  setUpAll(
    () {
      foodRecognitionTfliteDatasource = FoodRecognitionTfliteDataSource();
    },
  );

  void setUpMockCallTflite(WidgetTester tester, {required List<dynamic> data}) {
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('tflite'),
      (methodChannel) async {
        if (methodChannel.method == 'runModelOnImage') {
          return data;
        }

        return null;
      },
    );
  }

  testWidgets(
    'Should return a list of foods detected successfully',
    (tester) async {
      setUpMockCallTflite(tester, data: mockDataRecognizedFoodsTflite);
      final recognizedFoods = await foodRecognitionTfliteDatasource.recognize("");
      expect(recognizedFoods, equals(mockDataRecognizedFoodsDto));
    },
  );

  testWidgets(
    'Should return a NoFoodDetectedException when none food is detected',
    (tester) async {
      setUpMockCallTflite(tester, data: []);
      final callRecognizedFoods = foodRecognitionTfliteDatasource.recognize;
      expect(
        () async => callRecognizedFoods(""),
        throwsA(const TypeMatcher<NoFoodDetectedException>()),
      );
    },
  );
}

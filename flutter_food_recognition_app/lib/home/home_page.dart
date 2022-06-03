import 'package:flutter/material.dart';
import 'package:flutter_food_recognition_core/configuration/provider.dart';
import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';

import '../food_recognition/page/food_recognition_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: providers,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Reconhecimento de alimento'),
            automaticallyImplyLeading: false,
          ),
          body: const FoodRecognitionPage(),
        ),
      );
}

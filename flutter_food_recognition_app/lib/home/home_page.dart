import 'package:flutter/material.dart';
import 'package:flutter_food_recognition_core/configuration/provider.dart';
import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: providers,
        child: const Scaffold(
          body: SizedBox.shrink(),
        ),
      );
}

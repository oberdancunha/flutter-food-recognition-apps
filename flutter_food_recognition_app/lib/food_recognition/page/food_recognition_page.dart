import 'package:flutter/material.dart';

import '../widgets/food_recognition_body_widget.dart';

class FoodRecognitionPage extends StatelessWidget {
  const FoodRecognitionPage({super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 237, 227, 253),
              Color.fromARGB(255, 203, 171, 255),
              Color.fromARGB(255, 173, 122, 255),
              Color.fromARGB(255, 117, 41, 239),
              Color.fromARGB(255, 100, 11, 244),
              Colors.red,
            ],
          ),
        ),
        child: const FoodRecognitionBodyWidget(),
      );
}

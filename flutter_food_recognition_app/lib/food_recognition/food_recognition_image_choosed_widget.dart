import 'package:flutter/material.dart';

import 'food_recognition_image_widget.dart';
import 'food_recognition_result_widget.dart';

class FoodRecognitionImageChoosedWidget extends StatelessWidget {
  final String imagePath;

  const FoodRecognitionImageChoosedWidget({
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.45,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Resultado do reconhecimento',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.pink,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FoodRecognitionImageWidget(imagePath: imagePath),
                    FoodRecognitionResultWidget(imagePath: imagePath),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

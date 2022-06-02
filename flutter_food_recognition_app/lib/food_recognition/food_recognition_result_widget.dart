import 'package:flutter/material.dart';

import 'food_recognition_image_widget.dart';

class FoodRecognitionResultWidget extends StatelessWidget {
  final String imagePath;

  const FoodRecognitionResultWidget({
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
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
              Row(
                children: [
                  FoodRecognitionImageWidget(imagePath: imagePath),
                ],
              ),
            ],
          ),
        ),
      );
}

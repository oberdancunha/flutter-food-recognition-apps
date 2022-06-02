import 'dart:io';

import 'package:flutter/material.dart';

class FoodRecognitionImageWidget extends StatelessWidget {
  final String imagePath;

  const FoodRecognitionImageWidget({
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(border: Border.all(width: 2.5)),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.4,
          maxHeight: MediaQuery.of(context).size.height * 0.4,
        ),
        child: Image.file(
          File(imagePath),
          fit: BoxFit.cover,
        ),
      );
}

import 'package:flutter/material.dart';

import 'fetch_result_widget.dart';
import 'show_image_choosed_widget.dart';

class ImageChoosedWidget extends StatelessWidget {
  final String imagePath;

  const ImageChoosedWidget({
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
                    ShowImageWidget(imagePath: imagePath),
                    FetchResultWidget(imagePath: imagePath),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

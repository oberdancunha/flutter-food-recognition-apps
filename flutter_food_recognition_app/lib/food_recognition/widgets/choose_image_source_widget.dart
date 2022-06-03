import 'package:flutter/material.dart';
import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';

import 'image_source_button_widget.dart';

class ChooseImageSourceWidget extends StatelessWidget {
  final Function(ImageSource imageSource) openImage;

  const ChooseImageSourceWidget({
    required this.openImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: 15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageSourceButtonWidget(
              backgroundColor: Colors.blue,
              image: 'camera.png',
              label: 'Câmera',
              onTap: () async {
                await openImage(ImageSource.camera);
              },
            ),
            ImageSourceButtonWidget(
              backgroundColor: Colors.red,
              image: 'gallery.png',
              label: 'Galeria',
              onTap: () async {
                await openImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      );
}

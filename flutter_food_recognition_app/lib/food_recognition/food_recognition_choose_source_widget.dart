import 'package:flutter/material.dart';
import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';

import 'food_recognition_image_choosed_widget.dart';
import 'food_recognition_source_button_widget.dart';

class FoodRecognitionChooseSourceWidget extends StatefulWidget {
  const FoodRecognitionChooseSourceWidget({super.key});

  @override
  State<FoodRecognitionChooseSourceWidget> createState() =>
      _FoodRecognitionChooseSourceWidgetState();
}

class _FoodRecognitionChooseSourceWidgetState extends State<FoodRecognitionChooseSourceWidget> {
  late ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: 15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FoodRecognitionSourceButtonWidget(
              backgroundColor: Colors.blue,
              image: 'camera.png',
              label: 'Câmera',
              onTap: () async {
                await _openImage(ImageSource.camera);
              },
            ),
            FoodRecognitionSourceButtonWidget(
              backgroundColor: Colors.red,
              image: 'gallery.png',
              label: 'Galeria',
              onTap: () async {
                await _openImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      );

  Future<void> _openImage(ImageSource imageSource) async {
    final image = await _imagePicker.pickImage(
      source: imageSource,
      maxWidth: MediaQuery.of(context).size.width * 0.5,
      maxHeight: MediaQuery.of(context).size.height * 0.5,
    );
    if (image != null) {
      showBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (_) => FoodRecognitionImageChoosedWidget(imagePath: image.path),
      );
    }
  }
}

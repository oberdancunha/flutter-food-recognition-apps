import 'package:flutter/material.dart';
import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';

import 'choose_image_source_widget.dart';
import 'image_choosed_widget.dart';

class FoodRecognitionBodyWidget extends StatefulWidget {
  const FoodRecognitionBodyWidget({super.key});

  @override
  State<FoodRecognitionBodyWidget> createState() => _FoodRecognitionBodyWidgetState();
}

class _FoodRecognitionBodyWidgetState extends State<FoodRecognitionBodyWidget> {
  late ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) => ChooseImageSourceWidget(
        openImage: _openImage,
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
        builder: (_) => ImageChoosedWidget(imagePath: image.path),
      );
    }
  }
}

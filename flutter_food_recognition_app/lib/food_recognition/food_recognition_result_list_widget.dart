import 'package:flutter/material.dart';
import 'package:flutter_food_recognition_core/domain/food_recognition.dart';
import 'package:flutter_food_recognition_core/translate/translate_food_name_pt.dart';
import 'package:flutter_food_recognition_dependency_module/flutter_food_recognition_dependency_module.dart';

class FoodRecognitionResultListWidget extends StatefulWidget {
  final KtList<FoodRecognition> recognizedFoods;

  const FoodRecognitionResultListWidget({
    required this.recognizedFoods,
    super.key,
  });

  @override
  State<FoodRecognitionResultListWidget> createState() => _FoodRecognitionResultListWidgetState();
}

class _FoodRecognitionResultListWidgetState extends State<FoodRecognitionResultListWidget> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Expanded(
        child: Scrollbar(
          thumbVisibility: true,
          controller: _scrollController,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.recognizedFoods.size,
            controller: _scrollController,
            itemBuilder: (_, index) => SizedBox(
              height: 35,
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                minVerticalPadding: 0,
                leading: SizedBox(
                  height: double.infinity,
                  child: Image.asset('assets/images/food_icon.png'),
                ),
                minLeadingWidth: 0,
                horizontalTitleGap: 0,
                title: Text(
                  translateToPt[widget.recognizedFoods.elementAt(index).food].toString(),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.deepPurple.shade600,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

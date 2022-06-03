import 'package:flutter/material.dart';

class NoFoodRecognizedWidget extends StatelessWidget {
  const NoFoodRecognizedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/no_food_recognized.png',
            cacheHeight: 80,
            cacheWidth: 80,
          ),
          const SizedBox(height: 20),
          Text(
            'Nenhum alimento reconhecido',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.deepPurple.shade600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );
}

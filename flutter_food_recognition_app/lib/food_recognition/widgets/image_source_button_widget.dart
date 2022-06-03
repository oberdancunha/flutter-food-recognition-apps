import 'package:flutter/material.dart';

class ImageSourceButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final String image;
  final String label;
  final VoidCallback onTap;

  const ImageSourceButtonWidget({
    required this.backgroundColor,
    required this.image,
    required this.label,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            child: Column(),
          ),
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              backgroundColor: backgroundColor,
              radius: MediaQuery.of(context).size.width * 0.15,
              child: Image.asset('assets/images/sources/$image'),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}

import 'package:flutter/material.dart';


class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xffe4e4e4),
      ),
      child: Image.asset(imagePath,height: 40,),
    );
  }
}

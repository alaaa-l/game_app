import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const ActionButton({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 23, 112, 185),
          borderRadius: BorderRadius.circular(40),
        ),
        width: 100,
        height: 100,
        child: Center(child: Image.asset(imagePath)),
      ),
    );
  }
}

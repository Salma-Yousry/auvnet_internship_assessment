import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  final Widget child;

  const InputContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: screenWidth * 0.0025,
        ),
      ),
      child: child,
    );
  }
}


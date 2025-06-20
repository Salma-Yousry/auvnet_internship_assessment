import 'package:flutter/material.dart';

InputDecoration authInputDecoration(BuildContext context, String hint) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(
      color: const Color(0xFF9CA3AF),
      fontSize: screenHeight * 0.02,
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: screenWidth * 0.04,
      vertical: screenHeight * 0.02,
    ),
    border: InputBorder.none,
  );
}


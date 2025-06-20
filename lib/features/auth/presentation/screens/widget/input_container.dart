import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';

class InputContainer extends StatelessWidget {
  final Widget child;

  const InputContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white2,
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
        border: Border.all(
          color: AppColors.white2,
          width: screenWidth * 0.0025,
        ),
      ),
      child: child,
    );
  }
}


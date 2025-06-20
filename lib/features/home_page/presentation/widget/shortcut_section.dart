import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/assets_manager.dart';

class ShortcutSection extends StatelessWidget {
  const ShortcutSection({super.key});

  Widget _buildShortcut({
    required BuildContext context,
    required String imagePath,
    required String label,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double imageSize = screenWidth * 0.17;
    double labelFontSize = screenHeight * 0.016;
    double spacing = screenHeight * 0.011;

    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            width: imageSize,
            height: imageSize,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: spacing),
        Text(
          label,
          style: TextStyle(fontSize: labelFontSize),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final sectionTitleFontSize = screenHeight * 0.023;
    final titleSpacing = screenHeight * 0.012;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Shortcuts",
          style: TextStyle(
            fontSize: sectionTitleFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: titleSpacing),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 8),
              _buildShortcut(
                context: context,
                imagePath: ImageAssets.pastOrder,
                label: AppStrings.Shortcuts,
              ),
              SizedBox(width: 14),
              _buildShortcut(
                context: context,
                imagePath: ImageAssets.supersaver,
                label: AppStrings.Super_Saver,
              ),
              SizedBox(width: 14),
              _buildShortcut(
                context: context,
                imagePath: ImageAssets.Must_tries,
                label: AppStrings.Must_Tries,
              ),
              SizedBox(width: 14),
              _buildShortcut(
                context: context,
                imagePath: ImageAssets.Give_Back,
                label: AppStrings.GiveBack,
              ),
              SizedBox(width: 14),
              _buildShortcut(
                context: context,
                imagePath: ImageAssets.BestSellers,
                label: AppStrings.BestSellers,
              ),
              SizedBox(width: 8),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:auvnet_internship_assessment/core/constants/assets_manager.dart';

import '../../../../core/constants/app_strings.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key});

  Widget _buildRestaurant({
    required BuildContext context,
    required String name,
    required String time,
    required String imagePath,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double avatarRadius = screenWidth * 0.08;
    double nameFontSize = screenHeight * 0.022;
    double timeFontSize = screenHeight * 0.018;
    double spacing = screenHeight * 0.008;

    return Column(
      children: [
        CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.grey[200],
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(height: spacing),
        Text(
          name,
          style: TextStyle(
            fontSize: nameFontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          time,
          style: TextStyle(
            fontSize: timeFontSize,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final titleFontSize = screenHeight * 0.025;
    final sectionSpacing = screenHeight * 0.02;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.Popular,
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: sectionSpacing),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildRestaurant(
              context: context,
              name: AppStrings.AloBeirut,
              time: AppStrings.mins32,
              imagePath: ImageAssets.AlloBeirut,
            ),
            _buildRestaurant(
              context: context,
              name: AppStrings.Laffah,
              time: AppStrings.mins30,
              imagePath: ImageAssets.laffah,
            ),
            _buildRestaurant(
              context: context,
              name: AppStrings.Falafel,
              time: AppStrings.mins44,
              imagePath: ImageAssets.Falafil,
            ),
            _buildRestaurant(
              context: context,
              name: AppStrings.Barbar,
              time: AppStrings.mins34,
              imagePath: ImageAssets.BarBar,
            ),
          ],
        ),
      ],
    );
  }
}

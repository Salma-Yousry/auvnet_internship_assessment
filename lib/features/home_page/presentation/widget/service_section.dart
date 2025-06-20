import 'package:auvnet_internship_assessment/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/assets_manager.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  Widget _buildService({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String promo,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double avatarRadius = screenWidth * 0.11;
    double promoFontSize = screenHeight * 0.017;
    double titleFontSize = screenHeight * 0.022;
    double spacing = screenHeight * 0.011;
    double horizontalPadding = screenWidth * 0.025;
    double verticalPadding = screenHeight * 0.005;
    double borderRadius = screenWidth * 0.03;

    return Column(
      children: [
        CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(height: spacing),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          decoration: BoxDecoration(
            color: AppColors.purple1,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Text(
            promo,
            style: TextStyle(
              fontSize: promoFontSize,
              color:AppColors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: spacing),
        Text(
          title,
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildService(
          context: context,
          imagePath: ImageAssets.food,
          title: AppStrings.food,
          promo: AppStrings.up,
        ),
        _buildService(
          context: context,
          imagePath: ImageAssets.Health,
          title: AppStrings.Health,
          promo: AppStrings.min20,
        ),
        _buildService(
          context: context,
          imagePath: ImageAssets.groceries,
          title: AppStrings.Categories,
          promo: AppStrings.min15,
        ),
      ],
    );
  }
}


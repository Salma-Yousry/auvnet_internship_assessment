import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/assets_manager.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;


    double iconSize = screenWidth * 0.08;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            ImageAssets.nawel,
            width: iconSize,
            height: iconSize * 0.8,
          ),
          label: AppStrings.Home,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            const AssetImage(ImageAssets.outline),
            size: iconSize,
          ),
          label: AppStrings.Categories,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            const AssetImage(ImageAssets.icon_park),
            size: iconSize,
          ),
          label: AppStrings.Deliver,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            const AssetImage(ImageAssets.cart),
            size: iconSize,
          ),
          label: AppStrings.Cart,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            const AssetImage(ImageAssets.profile),
            size: iconSize,
          ),
          label: AppStrings.Profile,
        ),
      ],
    );
  }
}

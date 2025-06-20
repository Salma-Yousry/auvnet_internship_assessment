import 'dart:ui';
import '../constants/app_colors.dart';

class AppTextStyles {
  static TextStyle heading = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle inputText = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static  TextStyle inputHint = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
  );

  static  TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}

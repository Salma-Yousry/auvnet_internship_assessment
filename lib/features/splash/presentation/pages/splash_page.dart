import 'dart:async';
import 'package:auvnet_internship_assessment/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../core/constants/assets_manager.dart';
import '../../../../core/routes/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    final box = Hive.box(AppStrings.settings);
    final seen = box.get(AppStrings.onboardingSeen, defaultValue: false);

    if (seen) {
      Navigator.pushReplacementNamed(context, Routes.signInRoute);
    } else {
      Navigator.pushReplacementNamed(context, Routes.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        ImageAssets.splashScreen,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
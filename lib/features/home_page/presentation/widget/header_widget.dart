import 'package:auvnet_internship_assessment/core/constants/assets_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String username = '...';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? '';
    final nameFromEmail = email.split('@').first;

    setState(() {
      username = nameFromEmail.isNotEmpty ? nameFromEmail : AppStrings.User;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: screenHeight * 0.22,
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.purple,AppColors.yellow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.Deliveringto,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenHeight * 0.02,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  AppStrings.Street,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.027,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  '${AppStrings.Hi} $username!',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: screenHeight * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            ImageAssets.image,
            width: screenWidth * 0.15,
            height: screenWidth * 0.15,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

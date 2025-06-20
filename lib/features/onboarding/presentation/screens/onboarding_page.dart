import 'package:auvnet_internship_assessment/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../../../core/routes/app_router.dart';
import 'onboarding_items.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;


  void _completeOnboarding() {
    Hive.box(AppStrings.settings).put(AppStrings.onboardingSeen, true);
    Navigator.pushReplacementNamed(context, Routes.signInRoute);
  }

  void _nextPage() {
    if (_currentPage < onboardingItems.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onboardingItems.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (_, index) {
                final item = onboardingItems[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        item.imagePath,
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: screenHeight * 0.0355,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      item.description,
                      style: TextStyle(
                        fontSize: screenHeight * 0.02,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),

          // Buttons
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.025,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                ElevatedButton(
                  onPressed: () {
                    if (_currentPage == onboardingItems.length - 1) {
                      _completeOnboarding();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(AppStrings.nextPages),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.025),
                    textStyle: TextStyle(fontSize: screenHeight * 0.025),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text(AppStrings.getStarted),
                ),
                SizedBox(height: screenHeight * 0.015),

                ElevatedButton(
                  onPressed: _nextPage,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02),
                    textStyle: TextStyle(fontSize: screenHeight * 0.022),
                  ),
                  child: const Text(AppStrings.next),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/assets_manager.dart';

class PromoImage extends StatefulWidget {
  const PromoImage({super.key});

  @override
  State<PromoImage> createState() => _PromoImageState();
}

class _PromoImageState extends State<PromoImage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _autoScrollTimer;

  final List<String> _images = [
    ImageAssets.imageInHome,
    ImageAssets.imageInHome,
    ImageAssets.imageInHome,
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_currentPage + 1) % _images.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Widget _buildImageDot(int index, double size) {
    bool isActive = index == _currentPage;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size * 0.3),
      width: isActive ? size : size * 0.8,
      height: isActive ? size : size * 0.8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.black : AppColors.gray,
      ),
    );
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    double imageHeight = screenHeight * 0.23;
    double dotSize = screenWidth * 0.025;
    double spacing = screenHeight * 0.03;
    double borderRadius = screenWidth * 0.03;

    return Column(
      children: [
        SizedBox(
          height: imageHeight,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Image.asset(
                  _images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            },
          ),
        ),
        SizedBox(height: spacing),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _images.length,
                (index) => _buildImageDot(index, dotSize),
          ),
        ),
      ],
    );
  }
}

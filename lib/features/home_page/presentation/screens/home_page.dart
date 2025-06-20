import 'package:flutter/material.dart';

import '../widget/bottom_navbar.dart';
import '../widget/header_widget.dart';
import '../widget/promo_banner.dart';
import '../widget/promo_image.dart';
import '../widget/restaurant_list.dart';
import '../widget/service_section.dart';
import '../widget/shortcut_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final vertical = screenHeight * 0.025;
    final horizontal = screenWidth * 0.04;

    return Scaffold(
      bottomNavigationBar: const BottomNavbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: horizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderWidget(),
              SizedBox(height: vertical),
              const ServiceSection(),
              SizedBox(height: vertical),
              const PromoBanner(),
              SizedBox(height: vertical),
              const ShortcutSection(),
              SizedBox(height: vertical),
              const PromoImage(),
              SizedBox(height: vertical),
              const RestaurantList(),
              SizedBox(height: vertical),
            ],
          ),
        ),
      ),
    );
  }
}

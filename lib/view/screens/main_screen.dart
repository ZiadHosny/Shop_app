// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/logic/controllers/bottom_nav_controller.dart';
import 'package:shop_app/view/screens/favorites_screen.dart';
import 'package:shop_app/view/screens/home_screen.dart';
import 'package:shop_app/view/screens/profile_screen.dart';
import 'package:shop_app/view/screens/screen.dart';

class MainScreen extends StatelessWidget {
  final buttomNavController = Get.find<ButtomNavController>();

  List<BottomNavigationBarItem> btmNavBarItems = [
    const BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(
        Icons.home,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Notifications',
      icon: Icon(
        Icons.notifications,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Favorites',
      icon: Icon(
        Icons.favorite,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Profile',
      icon: Icon(Icons.person),
    ),
  ];

  List<Widget> screens = [
    const HomeScreen(),
    const Screen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ButtomNavController>(
      builder: (_) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: buttomNavController.index,
            onTap: (index) {
              buttomNavController.updateIndex(index);
            },
            items: btmNavBarItems,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 10,
            selectedItemColor: MAIN_COLOR,
            unselectedItemColor: Colors.black87,
            iconSize: 25,
            selectedIconTheme: const IconThemeData(size: 30),
            showUnselectedLabels: false,
            showSelectedLabels: false,
          ),
          body: SafeArea(
            child: screens[buttomNavController.index],
          ),
        );
      },
    );
  }
}

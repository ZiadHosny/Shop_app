// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/logic/controllers/bottom_nav_controller.dart';
import 'package:shop_app/logic/controllers/cart_controller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/view/screens/favorites_screen.dart';
import 'package:shop_app/view/screens/home_screen.dart';
import 'package:shop_app/view/screens/profile_screen.dart';
import 'package:shop_app/view/screens/screen.dart';

class MainScreen extends StatelessWidget {
  final buttomNavController = Get.find<ButtomNavController>();

  final cartController = Get.find<CartController>();

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
    HomeScreen(),
    const Screen(),
    FavoritesScreen(),
    const ProfileScreen(),
  ];

  List<String> titles = [
    'Shop App',
    '',
    'Favorites',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ButtomNavController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              titles[buttomNavController.index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            elevation: 0,
            backgroundColor: MAIN_COLOR,
            actions: [
              Obx(
                () {
                  return Badge(
                    badgeColor: Colors.red,
                    position: BadgePosition.topEnd(
                      top: 0,
                      end: 2,
                    ),
                    badgeContent: Text(
                      cartController.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.cartScreen);
                      },
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
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

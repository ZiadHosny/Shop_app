// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/routes/routes.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: MAIN_COLOR),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: maxHeight(context) / 4 * 3,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/shopping_app.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      'Shop App',
                      style: TextStyle(
                          fontSize: 35,
                          color: MAIN_COLOR,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: MAIN_COLOR,
              ),
              onPressed: () {
                Get.offNamed(Routes.loginScreen);
              },
              child: const Text(
                'Get Start',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Get.offNamed(Routes.signUpScreen);
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

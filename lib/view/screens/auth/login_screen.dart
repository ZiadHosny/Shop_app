// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/logic/controllers/auth_controller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/view/widgets/my_text_field.dart';
import 'package:shop_app/view/widgets/rounded_button.dart';

class LoginScreen extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: maxHeight(context),
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                const Text(
                  'LOGIN',
                  style: TextStyle(
                      color: MAIN_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: maxHeight(context) / 3,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/Mobile_user.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      MyTextField(
                        onChanged: (value) {},
                        icon: Icons.person,
                        hintText: 'Your Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return MyTextField(
                            onChanged: (value) {},
                            icon: Icons.lock,
                            hintText: 'Password',
                            obscureText:
                                authController.isVisible ? true : false,
                            suffixIcon: IconButton(
                              icon: Icon(
                                authController.isVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              color: MAIN_COLOR,
                              onPressed: () {
                                authController.toggleVisibility();
                              },
                            ),
                          );
                        },
                      ),
                      RoundedButton(text: 'LOGIN', press: () {}),
                      Container(
                        alignment: Alignment.centerRight,
                        width: maxWidth(context) * 0.8,
                        child: TextButton(
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.forgetPasswordScreen);
                          },
                        ),
                      ),
                      const Text('Or'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          TextButton(
                              onPressed: () {
                                Get.offNamed(Routes.signUpScreen);
                              },
                              child: const Text('Sign up')),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

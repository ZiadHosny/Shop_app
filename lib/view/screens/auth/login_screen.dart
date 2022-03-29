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
  final formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      MyTextFormField(
                        validator: (value) {
                          if (!RegExp(validationEmail).hasMatch(value!)) {
                            return 'Invalid Email!';
                          }
                          return null;
                        },
                        controller: email,
                        icon: Icons.person,
                        hintText: 'Your Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return MyTextFormField(
                            validator: (value) {
                              if (value!.length < 6) {
                                return 'Password is too short!';
                              }
                              return null;
                            },
                            controller: password,
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
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return RoundedButton(
                              text: 'LOGIN',
                              press: () {
                                if (formKey.currentState!.validate()) {
                                  authController.signIn(
                                    email.text.trim(),
                                    password.text,
                                  );
                                }
                              });
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GetBuilder<AuthController>(
                            builder: (_) {
                              return IconButton(
                                onPressed: () {
                                  authController.signInWithGoogle();
                                },
                                icon: Image.asset(
                                  'assets/images/google.png',
                                ),
                              );
                            },
                          ),
                          TextButton(
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
                        ],
                      ),
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

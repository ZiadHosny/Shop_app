// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/logic/controllers/auth_controller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/view/widgets/my_text_field.dart';
import 'package:shop_app/view/widgets/rounded_button.dart';

class SignUpScreen extends StatelessWidget {
  final authController = Get.find<AuthController>();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: maxHeight(context),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: MAIN_COLOR,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: maxHeight(context) / 5,
                        child: Image.asset('assets/images/Done.png'),
                      ),
                    ],
                  ),
                  MyTextFormField(
                    validator: (value) {
                      if (!RegExp(validationName).hasMatch(value!) ||
                          value.length < 2) {
                        return 'Invalid Name!';
                      }
                      return null;
                    },
                    controller: name,
                    icon: Icons.person,
                    hintText: 'Your Name',
                    keyboardType: TextInputType.name,
                  ),
                  MyTextFormField(
                    controller: phone,
                    icon: Icons.lock,
                    hintText: 'Phone',
                    keyboardType: TextInputType.phone,
                  ),
                  MyTextFormField(
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value!)) {
                        return 'Invalid Email!';
                      }
                      return null;
                    },
                    controller: email,
                    icon: Icons.email,
                    hintText: 'Your Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  GetBuilder<AuthController>(
                    builder: (_) => MyTextFormField(
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Password is too short!';
                        }
                        return null;
                      },
                      controller: password,
                      icon: Icons.lock,
                      hintText: 'Password',
                      obscureText: authController.isVisible ? true : false,
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
                    ),
                  ),
                  GetBuilder<AuthController>(
                    builder: (_) {
                      return RoundedButton(
                        text: 'SIGN UP',
                        press: () {
                          if (formKey.currentState!.validate()) {
                            authController.registration(
                              name.text.trim(),
                              phone.text.trim(),
                              email.text.trim(),
                              password.text,
                            );
                          }
                        },
                      );
                    },
                  ),
                  const Text('Or'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an Account?"),
                      TextButton(
                          onPressed: () {
                            Get.offNamed(Routes.loginScreen);
                          },
                          child: const Text('Log In')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

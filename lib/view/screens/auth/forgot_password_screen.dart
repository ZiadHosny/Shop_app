// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/logic/controllers/auth_controller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/view/widgets/my_text_field.dart';
import 'package:shop_app/view/widgets/rounded_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final authController = Get.find<AuthController>();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MAIN_COLOR,
        title: const Text('Forget Password'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: maxHeight(context),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
                child: const Text(
                  "Enter your email and we'll send you a link to get back into your account.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Image.asset(
                'assets/images/Forgot_password.png',
                fit: BoxFit.cover,
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
                builder: (_) {
                  return RoundedButton(
                      text: 'SEND',
                      press: () {
                        authController.resetPassword(email.text.trim());
                      });
                },
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
      ),
    );
  }
}

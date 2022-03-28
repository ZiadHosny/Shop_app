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
                MyTextField(
                  onChanged: (value) {},
                  icon: Icons.person,
                  hintText: 'Your Name',
                  keyboardType: TextInputType.name,
                ),
                MyTextField(
                  onChanged: (value) {},
                  icon: Icons.lock,
                  hintText: 'Phone',
                  keyboardType: TextInputType.phone,
                ),
                MyTextField(
                  onChanged: (value) {},
                  icon: Icons.email,
                  hintText: 'Your Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                GetBuilder<AuthController>(
                  builder: (_) => MyTextField(
                    onChanged: (value) {},
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
                RoundedButton(
                  text: 'SIGN UP',
                  press: () {},
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
    );
  }
}

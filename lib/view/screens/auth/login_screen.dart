// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/view/widgets/my_text_field.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: maxHeight(context),
          padding: const EdgeInsets.only(top: 40),
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
                    height: maxHeight(context) / 2.3,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/Mobile_user.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  MyTextField(
                    onChanged: (value) {},
                    icon: Icons.person,
                    hintText: 'Your Email',
                  ),
                  MyTextField(
                    onChanged: (value) {},
                    icon: Icons.lock,
                    hintText: 'Password',
                    suffixIcon: Icon(
                      Icons.visibility,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:shop_app/constants/constants.dart';

class MyTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final IconData icon;
  final String hintText;
  TextEditingController? controller;
  IconButton? suffixIcon;
  TextInputType? keyboardType;
  bool obscureText;
  bool autofocus;

  MyTextFormField(
      {this.validator,
      required this.icon,
      required this.hintText,
      this.controller,
      this.suffixIcon,
      this.keyboardType,
      this.obscureText = false,
      this.autofocus = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: maxWidth(context) * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        cursorColor: MAIN_COLOR,
        keyboardType: keyboardType,
        obscureText: obscureText,
        controller: controller,
        validator: validator,
        autofocus: autofocus,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: MAIN_COLOR,
          ),
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

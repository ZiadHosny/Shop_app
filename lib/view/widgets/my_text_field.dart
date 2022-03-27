import 'package:flutter/material.dart';
import 'package:shop_app/constants/constants.dart';

class MyTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final IconData icon;
  final String hintText;
  Icon? suffixIcon;

  MyTextField({
    required this.onChanged,
    required this.icon,
    required this.hintText,
    this.suffixIcon,
  });

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
      child: TextField(
        onChanged: onChanged,
        cursorColor: MAIN_COLOR,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: MAIN_COLOR,
          ),
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
          suffixIconColor: MAIN_COLOR,
        ),
      ),
    );
  }
}

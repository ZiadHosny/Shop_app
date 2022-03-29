// ignore_for_file: constant_identifier_names,

import 'package:flutter/cupertino.dart';

const String URL = 'https://fakestoreapi.com';

const Color MAIN_COLOR = Color.fromRGBO(108, 99, 255, 1);
const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

const String validationEmail =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
const String validationPhone = r'^(?:[+0]9)?[0-9]{10}$';
const String validationName = r'^[a-z A-Z]+$';

double maxHeight(context) => MediaQuery.of(context).size.height;
double maxWidth(context) => MediaQuery.of(context).size.width;


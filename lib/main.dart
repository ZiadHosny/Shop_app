// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: MAIN_COLOR),
    );
    return GetMaterialApp(
      title: 'Shop App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.initialRoute,
      getPages: AppRoute.routes,
    );
  }
}

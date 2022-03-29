// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import './constants/constants.dart';
import './firebase_options.dart';
import './routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

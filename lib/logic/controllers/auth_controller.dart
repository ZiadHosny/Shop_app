import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/routes/routes.dart';

class AuthController extends GetxController {
  bool isVisible = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  late UserCredential userCredential;

  void toggleVisibility() {
    isVisible = !isVisible;
    update();
  }

  void registration(
      String name, String phone, String email, String password) async {
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String message = e.message!;

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      Get.snackbar(
        e.code,
        message,
        backgroundColor: MAIN_COLOR,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: const Color.fromARGB(255, 180, 14, 2),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    }
  }

  void signIn(String email, String password) async {
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String message = e.message!;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }
      Get.snackbar(
        e.code,
        message,
        backgroundColor: MAIN_COLOR,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: const Color.fromARGB(255, 180, 14, 2),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    }
  }
}

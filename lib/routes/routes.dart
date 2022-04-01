import 'package:get/get.dart';
import '../logic/bindings/buttom_nav_binding.dart';
import '../view/screens/cart_screen.dart';
import '../view/screens/main_screen.dart';

import '../logic/bindings/auth_binding.dart';
import '../logic/bindings/product_binding.dart';
import '../view/screens/auth/forgot_password_screen.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/auth/sign_up_screen.dart';
import '../view/screens/welcome_screen.dart';

class AppRoute {
  static const initialRoute = Routes.mainScreen;

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgetPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      
      page: () => MainScreen(),
      bindings: [
        ButtomNavBinding(),
        ProductBinding(),
        AuthBinding(),
      ],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [
        ProductBinding(),
      ],
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const signUpScreen = '/signUpScreen';
  static const loginScreen = '/LoginScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
}

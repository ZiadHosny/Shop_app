import 'package:get/get.dart';
import 'package:shop_app/logic/bindings/auth_binding.dart';
import 'package:shop_app/view/screens/main_screen.dart';
import '../view/screens/auth/forget_password_screen.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/auth/sign_up_screen.dart';
import '../view/screens/welcome_screen.dart';

class AppRoute {
  static const initialRoute = Routes.welcomeScreen;

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
      page: () => ForgetPasswordScreen(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () =>  MainScreen(),
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const signUpScreen = '/signUpScreen';
  static const loginScreen = '/LoginScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const mainScreen = '/mainScreen';
}

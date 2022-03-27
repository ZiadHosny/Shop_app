import 'package:get/get.dart';
import 'package:shop_app/view/screens/auth/login_screen.dart';
import 'package:shop_app/view/screens/auth/sign_up_screen.dart';
import 'package:shop_app/view/screens/welcome_screen.dart';

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
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const signUpScreen = '/signUpScreen';
  static const loginScreen = '/LoginScreen';
}

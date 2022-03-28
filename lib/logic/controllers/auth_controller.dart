import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController {
  bool isVisible = true;

  void toggleVisibility() {
    isVisible = !isVisible;
    update();
  }
}

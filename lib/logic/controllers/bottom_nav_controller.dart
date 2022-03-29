import 'package:get/state_manager.dart';

class ButtomNavController extends GetxController {
  int index = 0;

  updateIndex(int index) {
    this.index = index;

    update();
  }
}

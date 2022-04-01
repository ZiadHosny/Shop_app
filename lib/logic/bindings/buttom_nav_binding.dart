import 'package:get/get.dart';
import '../controllers/bottom_nav_controller.dart';

class ButtomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ButtomNavController());
  }
}

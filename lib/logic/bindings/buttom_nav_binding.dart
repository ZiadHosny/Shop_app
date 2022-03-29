import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/bottom_nav_controller.dart';

class ButtomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ButtomNavController());
  }
}

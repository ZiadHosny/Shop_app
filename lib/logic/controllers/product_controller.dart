import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../models/product.dart';
import '../../services/api.dart';

class ProductController extends GetxController {
  List<Product> products = <Product>[].obs;
  RxBool isLoading = true.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   getProducts();
  // }

  void getProducts() async {
    try {
      products = await Api(Dio()).getProducts();
    } finally {
      isLoading = false.obs;
    }
  }
}

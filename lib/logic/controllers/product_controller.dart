import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../models/product.dart';
import '../../services/api.dart';

class ProductController extends GetxController {
  List<Product> products = <Product>[].obs;
  List<Product> favProducts = <Product>[].obs;
  Map<int, bool> isFav = <int, bool>{}.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    try {
      products = await Api(Dio()).getProducts();
      for (var element in products) {
        isFav[element.id] = false;
      }
    } finally {
      isLoading(false);
    }
  }

  void toggleFav(int id) {
    isFav[id] = !isFav[id]!;

    if (!isFav[id]!) {


      favProducts.removeWhere((favProduct) => favProduct.id == id );
    
    } else {
      Product product = products.firstWhere((element) => element.id == id);

      favProducts.add(product);
    }
  }
}

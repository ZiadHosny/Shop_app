import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/constants.dart';
import '../../models/product.dart';

class CartController extends GetxController {
  List<Product> cartProducts = <Product>[].obs;
  Map<int, int> quantity = <int, int>{}.obs;
  RxBool isInTheCart = false.obs;

  void addProductToCart(Product product) {
    for (var element in cartProducts) {
      if (element.id == product.id) {
        isInTheCart.value = true;
        quantity[product.id] = quantity[product.id]! + 1;
      }
    }

    if (!isInTheCart.value) {
      quantity[product.id] = 1;
      cartProducts.add(product);
    }

    isInTheCart.value = false;
  }

  double get allPrices {
    double price = 0;

    quantity.forEach((key, value) {
      int index = cartProducts.indexWhere((element) => element.id == key);

      if (index != -1) {
        price = price + cartProducts[index].price * value;
      }
    });
    return price;
  }

  int get length {
    return cartProducts.length;
  }

  void removeProductFormCart(int id) {
    cartProducts.removeWhere((element) => element.id == id);
  }

  void addOneMore(int id) {
    quantity[id] = quantity[id]! + 1;
  }

  void deleteOne(int id) {
    if (quantity[id]! <= 1) {
      removeProductFormCart(id);
    } else {
      quantity[id] = quantity[id]! - 1;
    }
  }

  void clearAllProducts() {
    Get.defaultDialog(
      backgroundColor: MAIN_COLOR,
      buttonColor: Colors.red,
      title: 'Are You Sure?',
      titleStyle: const TextStyle(color: Colors.white),
      middleText: 'Your all Cart Items will be deleted.',
      middleTextStyle: const TextStyle(color: Colors.white),
      textConfirm: 'Yes',
      onConfirm: () {
        cartProducts.clear();

        Get.back();
      },
      confirmTextColor: Colors.white,
      textCancel: 'No',
      onCancel: () {
        Get.back();
      },
      cancelTextColor: Colors.white,
    );
  }
}

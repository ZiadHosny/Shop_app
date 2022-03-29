// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:shop_app/constants/constants.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/product_controller.dart';
import 'package:shop_app/models/product.dart';

class CategoryItems extends StatelessWidget {
  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MAIN_COLOR,
    );
    return Obx(
      () {
        return productController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: MAIN_COLOR,
                ),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: productController.products.length,
                  itemBuilder: (context, index) {
                    return CategoryItem(
                        context, productController.products[index]);
                  },
                ),
              );
      },
    );
  }

  Widget CategoryItem(context, Product product) {
    return GridTile(
      header: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.favorite_border,
              color: MAIN_COLOR,
            ),
            Text(
              product.category,
            ),
            const Icon(
              Icons.add,
              color: MAIN_COLOR,
            ),
          ],
        ),
      ),
      child: Container(
        child: Image.network(product.image),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 3,
              blurStyle: BlurStyle.solid,
              color: MAIN_COLOR.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}

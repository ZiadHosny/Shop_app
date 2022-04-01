// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:shop_app/constants/constants.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/cart_controller.dart';
import 'package:shop_app/logic/controllers/product_controller.dart';
import 'package:shop_app/models/product.dart';

class CategoryItems extends StatelessWidget {
  final productController = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return productController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: MAIN_COLOR,
                ),
              )
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
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
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: [
            Obx(
              () {
                return IconButton(
                  onPressed: () {
                    productController.toggleFav(product.id);
                  },
                  icon: Icon(
                    productController.isFav[product.id]!
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  color: MAIN_COLOR,
                );
              },
            ),
            Expanded(
              child: Text(
                product.category,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              onPressed: () {
                cartController.addProductToCart(product);
              },
              icon: const Icon(
                Icons.shopping_cart_sharp,
                color: MAIN_COLOR,
              ),
            ),
          ],
        ),
      ),
      footer: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$${product.price}'),
            Container(
              width: 45,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MAIN_COLOR,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    product.rating.rate.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Image.network(
          product.image,
          fit: BoxFit.fitWidth,
        ),
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

// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/logic/controllers/product_controller.dart';
import 'package:shop_app/models/product.dart';

class FavoritesScreen extends StatelessWidget {
  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => productController.favProducts.isEmpty
          ? Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: maxHeight(context) * .6,
                  child: Image.asset(
                    'assets/images/Empty.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Please, Add your favorites products.',
                  style: TextStyle(
                    color: MAIN_COLOR.withOpacity(.6),
                    fontSize: 18,
                  ),
                )
              ],
            )
          : ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return FavItem(context, index);
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: MAIN_COLOR,
                  thickness: 2,
                );
              },
              itemCount: productController.favProducts.length),
    );
  }

  Widget FavItem(context, index) {
    Product product = productController.favProducts[index];
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(
          product.image,
        ),
        title: Text(product.title),
        trailing: IconButton(
          icon: Icon(
            productController.isFav[product.id]!
                ? Icons.favorite
                : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () {
            productController.toggleFav(product.id);
          },
        ),
      ),
    );
  }
}

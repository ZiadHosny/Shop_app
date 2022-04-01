// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/constants.dart';
import '../../logic/controllers/cart_controller.dart';
import '../../models/product.dart';

class CartItem extends StatelessWidget {
  final Product product;
  const CartItem(this.product);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: MAIN_COLOR.withOpacity(.7),
      ),
      height: maxHeight(context) * .2,
      width: maxWidth(context),
      child: Row(
        children: [
          Card(
            margin:
                const EdgeInsets.only(right: 10, left: 5, top: 5, bottom: 5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                product.image,
                width: maxWidth(context) * .2,
                height: double.maxFinite,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Obx(() => Text(
                      (product.price * cartController.quantity[product.id]!)
                          .toStringAsFixed(2),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      cartController.deleteOne(product.id);
                    },
                    icon: const Icon(Icons.remove_circle),
                    color: Colors.white,
                  ),
                  Obx(() => Text(
                        cartController.quantity[product.id].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )),
                  IconButton(
                    onPressed: () {
                      cartController.addOneMore(product.id);
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    cartController.removeProductFormCart(product.id);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red[800],
                  )),
            ],
          )
        ],
      ),
    );
  }
}

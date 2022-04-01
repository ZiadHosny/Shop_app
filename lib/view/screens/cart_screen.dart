// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/logic/controllers/cart_controller.dart';

import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/view/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart Items'),
          backgroundColor: MAIN_COLOR,
          elevation: 0,
          actions: [
            Obx(
              () => cartController.cartProducts.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear_sharp),
                      onPressed: () {
                        cartController.clearAllProducts();
                      })
                  : Container(),
            ),
          ],
        ),
        body: Obx(
          () {
            return cartController.cartProducts.isNotEmpty
                ? CartItemsList(context)
                : Column(
                    children: [
                      Container(
                        height: maxHeight(context) * .5,
                        width: double.infinity,
                        color: Colors.white,
                        child: Image.asset(
                          'assets/images/empty_cart.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: 'Your Cart is ',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: 'Empty',
                              style: TextStyle(
                                color: MAIN_COLOR,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Add Items to get started',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed(Routes.mainScreen);
                        },
                        child: const Text('Go to Home'),
                        style: ElevatedButton.styleFrom(
                          primary: MAIN_COLOR,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ],
                  );
          },
        ));
  }

  Widget CartItemsList(context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return CartItem(
                cartController.cartProducts[index],
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: MAIN_COLOR,
                thickness: 2,
              );
            },
            itemCount: cartController.cartProducts.length,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Obx(
              () => Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '\$${cartController.allPrices.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: MAIN_COLOR,
                        padding: const EdgeInsets.all(15),
                        elevation: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Check Out'),
                          Icon(
                            Icons.shopping_cart,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

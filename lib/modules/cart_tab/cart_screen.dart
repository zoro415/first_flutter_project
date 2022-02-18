// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/order/cart_item.dart';
import 'package:grocery_nepal/data/models/product/product.dart';
import 'package:grocery_nepal/modules/auth/login/login_screen.dart';
import 'package:grocery_nepal/modules/cart_tab/cart_controller.dart';
import 'package:grocery_nepal/modules/cart_tab/widgets/cart_item_tile.dart';
import 'package:grocery_nepal/modules/checkout/checkout_screen.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';

import '../../app_controller.dart';

// final List<CartItem> cartItems = [
//   CartItem(
//       Product(
//           id: 1,
//           name: 'Cabbage',
//           image: 'assets/images/cabbage.png',
//           description: 'Green crop',
//           price: 250,
//           category: 'Vegetables',
//           unit: '1kg'),
//       3),
//   CartItem(
//       Product(
//           id: 5,
//           name: 'Mutton',
//           image: 'assets/images/cabbage.png',
//           description: 'Tender',
//           price: 500,
//           category: 'Meat',
//           unit: '1kg'),
//       3),
//   CartItem(
//       Product(
//           id: 6,
//           name: 'Salmon',
//           image: 'assets/images/cabbage.png',
//           description: 'Slender body',
//           price: 1550,
//           category: 'Fish',
//           unit: '1pc'),
//       3),
//   CartItem(
//       Product(
//           id: 3,
//           name: 'Mango',
//           image: 'assets/images/cabbage.png',
//           description: 'Tasty',
//           price: 150,
//           category: 'Fruit',
//           unit: '1kg'),
//       3),
// ];

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: GetBuilder<CartController>(builder: (controller) {
        return controller.cartItems.isEmpty
            ? Center(
                child: Text('Your cart is empty.'),
              )
            : Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: controller.cartItems.length,
                          itemBuilder: (context, index) {
                            return CartItemTile(controller.cartItems[index]);
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Obx(
                      () => CustomButton(
                          'Check Out (Rs. ${Get.find<CartController>().total.value})',
                          () {
                        if (Get.find<AppController>().isLoggedIn.isTrue) {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => CheckoutScreen()));
                          Get.to(() => CheckoutScreen(),
                              arguments: controller.cartItems);
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('Login'),
                                    content: Text('Please Login to Continue'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Cancel',
                                            style:
                                                TextStyle(color: Colors.red)),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Get.to(() => LoginScreen());
                                          },
                                          child: Text(
                                            'Login',
                                            style: TextStyle(color: greenColor),
                                          )),
                                    ],
                                  ));
                        }
                      }),
                    ),
                  ),
                ],
              );
      }),
    );
  }
}

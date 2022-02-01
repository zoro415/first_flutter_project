// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/cart_item.dart';
import 'package:grocery_nepal/data/models/product.dart';
import 'package:grocery_nepal/modules/cart_tab/widgets/cart_item_tile.dart';
import 'package:grocery_nepal/modules/checkout/checkout_screen.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';

final List<CartItem> cartItems = [
  CartItem(
      Product(
          id: 1,
          name: 'Cabbage',
          image: 'assets/images/cabbage.png',
          description: 'Green crop',
          price: 250,
          category: 'Vegetables',
          unit: '1kg'),
      3),
  CartItem(
      Product(
          id: 5,
          name: 'Mutton',
          image: 'assets/images/cabbage.png',
          description: 'Tender',
          price: 500,
          category: 'Meat',
          unit: '1kg'),
      3),
  CartItem(
      Product(
          id: 6,
          name: 'Salmon',
          image: 'assets/images/cabbage.png',
          description: 'Slender body',
          price: 1550,
          category: 'Fish',
          unit: '1pc'),
      3),
  CartItem(
      Product(
          id: 3,
          name: 'Mango',
          image: 'assets/images/cabbage.png',
          description: 'Tasty',
          price: 150,
          category: 'Fruit',
          unit: '1kg'),
      3),
];

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return CartItemTile(cartItems[index]);
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: CustomButton('Check Out (Rs. 2500)', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CheckoutScreen()));
            }),
          ),
        ],
      ),
    );
  }
}

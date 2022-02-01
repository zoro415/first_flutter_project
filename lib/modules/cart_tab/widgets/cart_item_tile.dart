// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/cart_item.dart';
import 'package:grocery_nepal/data/models/product.dart';
import 'package:grocery_nepal/modules/cart_tab/widgets/product_counter.dart';
import 'package:grocery_nepal/modules/explore_tab/widgets/category_bar.dart';

class CartItemTile extends StatelessWidget {
  CartItemTile(this.cartItem);
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset(
                cartItem.product.image,
                width: 50,
                height: 50,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.product.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cartItem.product.unit,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      ProductCounter(cartItem.quantity),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(
                    //     Icons.delete_outline,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    InkWell(
                      onTap: () {}(),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Icon(
                          Icons.delete_outline,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Text(
                      '${cartItem.product.price * cartItem.quantity}',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
        )
      ],
    );
  }
}

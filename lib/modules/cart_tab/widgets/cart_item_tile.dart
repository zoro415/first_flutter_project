// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/data/models/order/cart_item.dart';
import 'package:grocery_nepal/modules/cart_tab/cart_controller.dart';
import 'package:grocery_nepal/modules/cart_tab/widgets/product_counter.dart';

import '../../../constants.dart';

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
              // Image.asset(
              //   cartItem.product.image,
              //   width: 50,
              //   height: 50,
              // ),
              CachedNetworkImage(
                imageUrl: imageUrl + cartItem.product.image,
                errorWidget: (context, url, error) =>
                    Image.asset('assets/images/cabbage.png'),
                fit: BoxFit.cover,
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
                      ProductCounter(cartItem),
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
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: Text('Remove product from Cart?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cancel',
                                          style: TextStyle(color: Colors.red)),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Get.find<CartController>()
                                              .removeFromCart(cartItem.product);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Remove')),
                                  ],
                                ));
                      },
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

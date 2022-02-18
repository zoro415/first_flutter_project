// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/order/cart_item.dart';
import 'package:grocery_nepal/modules/cart_tab/widgets/counter_down.dart';
import 'package:grocery_nepal/modules/cart_tab/widgets/counter_up.dart';

import '../cart_controller.dart';

class ProductCounter extends StatelessWidget {
  ProductCounter(this.item);
  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: CounterDown(),
              onTap: () {
                // if (count < 1) {
                //   count == 1;
                // } else {
                //   setState(() {
                //     count--;
                //   });
                // }

                if (item.quantity > 1) {
                  Get.find<CartController>().changeQuantity(
                      CartItem(item.product, item.quantity - 1));
                }
              },
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8)),
                child: Text("${item.quantity}")),
            InkWell(
              child: CounterUp(),
              onTap: () {
                // setState(() {
                //   count++;
                // });
                // Get.find<CartController>()
                //     .changeQuantity(widget.item.product, count);
                Get.find<CartController>()
                    .changeQuantity(CartItem(item.product, item.quantity + 1));
              },
            ),
          ],
        ),
      ),
    );
  }
}

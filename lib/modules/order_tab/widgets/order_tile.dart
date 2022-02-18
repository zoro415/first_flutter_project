// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/order/order.dart';
import 'package:grocery_nepal/modules/order_detail/order_detail_screen.dart';

class OrderTile extends StatelessWidget {
  final Order order;

  OrderTile({required this.order});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => OrderDetailScreen(), arguments: order.id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  offset: Offset(1, 1),
                  blurRadius: 1,
                  spreadRadius: 2)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Id: ${order.id}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Placed on: ${order.dateOrdered ?? ''}'),
                Text(
                  'Rs. ${order.total}',
                  style: TextStyle(color: greenColor),
                ),
                Text(order.status ?? ''),
              ],
            ),
            Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}

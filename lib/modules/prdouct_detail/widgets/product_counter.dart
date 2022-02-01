// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/cart_tab/widgets/counter_down.dart';
import 'package:grocery_nepal/modules/cart_tab/widgets/counter_up.dart';

class ProductCounter extends StatefulWidget {
  ProductCounter(this.quantity);
  final int quantity;

  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int count = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Icon(
              Icons.remove_outlined,
              color: greenColor,
            ),
            onTap: () {
              // if (count < 1) {
              //   count == 1;
              // } else {
              //   setState(() {
              //     count--;
              //   });
              // }

              if (count > 1) {
                setState(() {
                  count--;
                });
              }
            },
          ),
          Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(horizontal: 7),
              constraints: BoxConstraints(minWidth: 30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300)),
              child: Center(child: Text("${count}"))),
          InkWell(
            child: Icon(
              Icons.add_outlined,
              color: greenColor,
            ),
            onTap: () {
              setState(() {
                count++;
              });
            },
          ),
        ],
      ),
    );
  }
}

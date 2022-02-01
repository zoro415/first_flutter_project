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

                if (count > 1) {
                  setState(() {
                    count--;
                  });
                }
              },
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8)),
                child: Text("${count}")),
            InkWell(
              child: CounterUp(),
              onTap: () {
                setState(() {
                  count++;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

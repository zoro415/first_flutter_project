import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';

class CounterUp extends StatelessWidget {
  const CounterUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: greenColor,
        ),
        child: Icon(
          Icons.add_outlined,
          color: Colors.white,
        ));
  }
}

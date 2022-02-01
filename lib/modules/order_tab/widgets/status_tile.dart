import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';

class StatusTile extends StatelessWidget {
  final bool isSelected;
  final String title;

  StatusTile({required this.isSelected, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: isSelected ? greenColor : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: greenColor)),
      child: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.white : greenColor),
      ),
    );
  }
}

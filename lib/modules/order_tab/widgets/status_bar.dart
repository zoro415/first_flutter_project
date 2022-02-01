import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/order_tab/widgets/status_tile.dart';

class StatusBar extends StatelessWidget {
  final List<String> status = [
    "All",
    "Pending",
    "Processing",
    "Delivered",
    "Cancelled"
  ];

  final int selectedIndex;
  final Function onPressed;

  StatusBar({required this.selectedIndex, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: status.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                onPressed(index);
              },
              child: StatusTile(
                title: status[index],
                isSelected: selectedIndex == index,
              ),
            );
          }),
    );
  }
}

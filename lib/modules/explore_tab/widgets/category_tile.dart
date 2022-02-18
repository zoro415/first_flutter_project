import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_nepal/data/models/product/category.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({required this.category, required this.isSelected});

  final Category category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SvgPicture.asset(
            category.icon,
            width: 25,
            height: 20,
            color: isSelected ? Colors.green : Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            category.name,
            style: isSelected
                ? TextStyle(fontWeight: FontWeight.bold, color: Colors.black)
                : TextStyle(fontWeight: FontWeight.normal, color: Colors.grey),
          )
        ],
      ),
    );
  }
}

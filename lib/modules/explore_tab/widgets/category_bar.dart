// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_nepal/data/models/product/category.dart';
import 'package:grocery_nepal/data/models/product/product.dart';
import 'package:grocery_nepal/modules/explore_tab/widgets/product_tile.dart';
import 'category_tile.dart';

final List<Category> categories = [
  Category(name: 'All', icon: 'assets/icons/all.svg'),
  Category(name: 'Fish', icon: 'assets/icons/fish.svg'),
  Category(name: 'Fruit', icon: 'assets/icons/fruit.svg'),
  Category(name: 'Meat', icon: 'assets/icons/meat.svg'),
  Category(name: 'Vegetables', icon: 'assets/icons/vegetable.svg'),
];

// final List<Product> products = [
//   Product(
//       id: 1,
//       name: 'Cabbage',
//       image: 'assets/images/cabbage.png',
//       description: 'Green crop',
//       price: 250,
//       category: 'Vegetables',
//       unit: '2kg'),
//   Product(
//       id: 2,
//       name: 'Tuna',
//       image: 'assets/images/cabbage.png',
//       description: 'Healthy fish',
//       price: 550,
//       category: 'Fish',
//       unit: '1pc'),
//   Product(
//       id: 3,
//       name: 'Mango',
//       image: 'assets/images/cabbage.png',
//       description: 'Tasty',
//       price: 150,
//       category: 'Fruit',
//       unit: '1kg'),
//   Product(
//       id: 4,
//       name: 'Chicken',
//       image: 'assets/images/cabbage.png',
//       description: 'Fiesty',
//       price: 250,
//       category: 'Meat',
//       unit: '1kg'),
//   Product(
//       id: 5,
//       name: 'Mutton',
//       image: 'assets/images/cabbage.png',
//       description: 'Tender',
//       price: 500,
//       category: 'Meat',
//       unit: '1kg'),
//   Product(
//       id: 6,
//       name: 'Salmon',
//       image: 'assets/images/cabbage.png',
//       description: 'Slender body',
//       price: 1550,
//       category: 'Fish',
//       unit: '5pcs'),
// ];

class CategoryBar extends StatefulWidget {
  const CategoryBar({
    required this.products,
    Key? key,
  }) : super(key: key);

  final List<Product> products;

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  String selectedCategory = "All";

  Widget getProducts() {
    List<Product> categoryItem = [];

    if (selectedCategory == "All") {
      categoryItem = widget.products;
    } else {
      for (Product product in widget.products) {
        if (selectedCategory == product.category) {
          categoryItem.add(product);
        }
      }
    }

    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15),
        itemCount: categoryItem.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return ProductTile(
            product: categoryItem[index],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedCategory = categories[index].name;
                      });
                    },
                    child: CategoryTile(
                      category: categories[index],
                      isSelected: selectedCategory == categories[index].name,
                    ),
                  );
                })),
        Expanded(child: getProducts())
      ],
    );
  }
}

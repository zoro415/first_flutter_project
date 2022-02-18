// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/product/product.dart';
import 'product_detail_container.dart';
import 'product_counter.dart';

import 'image_container.dart';

class DetailsBody extends StatelessWidget {
  final Product product;

  DetailsBody({required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageContainer(productImage: imageUrl + product.image),
            SizedBox(
              height: 10,
            ),
            Text(
              product.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              product.unit,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductCounter(),
                Text(
                  'Rs. ${product.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            ProductDetailContainer(
              description: product.description,
            ),
          ],
        ),
      ),
    );
  }
}

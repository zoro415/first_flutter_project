import 'package:flutter/material.dart';
import 'package:grocery_nepal/data/models/product.dart';

import 'widgets/bottom_container.dart';
import 'widgets/details_body.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        children: [
          Expanded(child: DetailsBody(product: product)),
          BottomContainer()
        ],
      ),
    );
  }
}

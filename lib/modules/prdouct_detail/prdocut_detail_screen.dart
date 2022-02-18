import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/data/models/product/product.dart';
import 'package:grocery_nepal/modules/prdouct_detail/product_detail_controller.dart';

import 'widgets/bottom_container.dart';
import 'widgets/details_body.dart';

class ProductDetailScreen extends StatelessWidget {
  // final Product product;
  // ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailController());
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.product.name),
      ),
      body: Column(
        children: [
          Expanded(child: DetailsBody(product: controller.product)),
          BottomContainer(
            product: controller.product,
          )
        ],
      ),
    );
  }
}

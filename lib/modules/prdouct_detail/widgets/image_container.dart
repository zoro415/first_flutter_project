import 'package:flutter/material.dart';

import '../../../constants.dart';

class ImageContainer extends StatelessWidget {
  ImageContainer({required this.productImage});

  final String productImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 200,
      decoration: BoxDecoration(
          color: greenColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          productImage,
          errorBuilder: (context, url, error) {
            return Image.asset(
              'assets/images/cabbage.png',
              fit: BoxFit.fitHeight,
            );
          },
        ),
      ),
    );
  }
}

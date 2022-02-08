// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/product.dart';
import 'package:grocery_nepal/modules/prdouct_detail/prdocut_detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:grocery_nepal/widgets/loading.dart';

class ProductTile extends StatelessWidget {
  ProductTile({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: product)));
      },
      child: Container(
        height: 180,
        width: 140,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  offset: Offset(1, 1),
                  blurRadius: 1,
                  spreadRadius: 2)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child:
                    // CachedNetworkImage(
                    //   imageUrl: imageUrl + product.image,
                    //   placeholder: (context, url) => Loading(
                    //     size: 200,
                    //   ),
                    //   errorWidget: (context, url, error) => Icon(Icons.error),
                    // ),
                    Image.network(
                  imageUrl + product.image,
                  errorBuilder: (context, url, error) {
                    return Image.asset(
                      'assets/images/cabbage.png',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            Text(
              'per ${product.unit}',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rs. ${product.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Added to Cart'),
                      backgroundColor: greenColor,
                      duration: Duration(milliseconds: 1200),
                    ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 35,
                    height: 35,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greenColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

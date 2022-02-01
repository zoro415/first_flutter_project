import 'package:flutter/material.dart';

class ProductDetailContainer extends StatefulWidget {
  ProductDetailContainer({required this.description});

  final String description;

  @override
  State<ProductDetailContainer> createState() => _ProductDetailContainerState();
}

class _ProductDetailContainerState extends State<ProductDetailContainer> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Product Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Icon(isOpen ? Icons.expand_more : Icons.chevron_right)
              ],
            ),
          ),
        ),
        isOpen
            ? Text(
                widget.description,
                textAlign: TextAlign.justify,
              )
            : SizedBox(),
      ],
    );
  }
}

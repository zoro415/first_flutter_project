// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/data/models/product/product.dart';
import 'package:grocery_nepal/modules/explore_tab/explore_tab_controller.dart';

import 'product_tile.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<Product> products = Get.find<ExploreTabConrtoller>().products;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          query = '';
          close(context, null);
        },
        icon: Icon(Icons.arrow_back_ios_new_outlined));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> matchResults = [];
    for (Product product in products) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        matchResults.add(product);
      }
    }
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: matchResults.isEmpty
          ? Center(
              child: Text('No Results found',
                  style: TextStyle(
                    fontSize: 18,
                  )),
            )
          : GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15),
              itemCount: matchResults.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return ProductTile(
                  product: matchResults[index],
                );
              }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> matchResults = [];
    for (Product product in products) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        matchResults.add(product);
      }
    }
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 15),
          itemCount: matchResults.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return ProductTile(
              product: matchResults[index],
            );
          }),
    );
  }
}

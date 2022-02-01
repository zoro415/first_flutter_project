// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery_nepal/modules/explore_tab/widgets/search_bar.dart';
import 'widgets/category_bar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokhara, Nepal'),
      ),
      body: Column(
        children: [
          SearchBar(),
          Expanded(child: CategoryBar()),
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/cart_tab/cart_screen.dart';
import 'package:grocery_nepal/modules/explore_tab/explore_screen.dart';
import 'package:grocery_nepal/modules/order_tab/order_screen.dart';
import 'package:grocery_nepal/modules/profile_tab/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> screens = [
    ExploreScreen(),
    CartScreen(),
    OrderScreen(),
    ProfileScreen()
  ];

//we create this kind of funtions to use the same widgets over and over
  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        unselectedItemColor: greyColor,
        selectedItemColor: greenColor,
        items: [
          _bottomNavigationBarItem(Icons.grid_view_outlined, 'Explore'),
          _bottomNavigationBarItem(Icons.shopping_cart_outlined, 'Cart'),
          _bottomNavigationBarItem(Icons.receipt_long_outlined, 'Order'),
          _bottomNavigationBarItem(Icons.person_outline, 'Profile'),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
    );
  }
}

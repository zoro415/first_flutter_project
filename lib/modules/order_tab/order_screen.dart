// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/order.dart';
import 'package:grocery_nepal/modules/order_tab/widgets/order_tile.dart';
import 'package:grocery_nepal/modules/order_tab/widgets/status_bar.dart';

final List<Order> orders = List.generate(
    20,
    (index) => Order(
        id: index,
        date: DateTime.now().toString(),
        status: index % 5 == 0
            ? "Processing"
            : index % 4 == 0
                ? "Pending"
                : index % 3 == 0
                    ? "Cancelled"
                    : "Delivered",
        total: index * 100));

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int selectedIndex = 0;
  final PageController _controller = PageController();

  Widget getOrders(String status) {
    List<Order> selectedOrders = [];

    if (status == "All") {
      selectedOrders = orders;
    } else {
      for (Order order in orders) {
        if (status == order.status) {
          selectedOrders.add(order);
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
          itemCount: selectedOrders.length,
          itemBuilder: (context, index) {
            return OrderTile(
              order: selectedOrders[index],
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order History'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            StatusBar(
              selectedIndex: selectedIndex,
              onPressed: (index) {
                setState(() {
                  selectedIndex = index;
                });

                _controller.jumpToPage(index);
              },
            ),
            Expanded(
                child: PageView(
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              controller: _controller,
              children: [
                getOrders('All'),
                getOrders('Pending'),
                getOrders('Processing'),
                getOrders('Delivered'),
                getOrders('Cancelled'),
              ],
            )),
          ],
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

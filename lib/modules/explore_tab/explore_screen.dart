// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery_nepal/modules/explore_tab/explore_tab_controller.dart';
import 'package:grocery_nepal/modules/explore_tab/widgets/search_bar.dart';
import 'package:grocery_nepal/widgets/widgets.dart';
import 'widgets/category_bar.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExploreTabConrtoller());

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokhara, Nepal'),
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? Loading(
                size: 200,
              )
            : controller.isError.isTrue
                ? ErrorPage(
                    errorMessage: controller.errorMessage,
                    onRetry: () {
                      controller.getProducts;
                    },
                  )
                : Column(
                    children: [
                      SearchBar(),
                      Expanded(
                          child: CategoryBar(
                        products: controller.products,
                      )),
                    ],
                  ),
      ),
    );
  }
}

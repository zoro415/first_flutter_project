import 'dart:convert';

import 'package:get/get.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/data/models/order/cart_item.dart';
import 'package:grocery_nepal/data/models/product/product.dart';

class CartLocal {
  static String key = "cartLocal";

  static Future<List<CartItem>> get() async {
    var prefs = Get.find<AppController>().sharedPreferences;
    var valueString = prefs.getString(key);

    try {
      if (valueString == null || valueString == '') {
        return [];
      }
      var data = json.decode(valueString);

      final products = data as List;
      return products.map((product) => CartItem.fromJson(product)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<bool> set(List<CartItem> items) async {
    var data = items.map((product) => product.toJson()).toList();
    var valueString = json.encode(data);

    try {
      var prefs = Get.find<AppController>().sharedPreferences;
      return await prefs.setString(key, valueString);
    } catch (e) {
      print(e);
      return false;
    }
  }
}

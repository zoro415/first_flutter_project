import 'dart:convert';

import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/order/order.dart';
import 'package:grocery_nepal/data/models/order/order_detail.dart';
import 'package:grocery_nepal/data/models/order/order_request.dart';
import 'package:http/http.dart' as http;

import '../../app_controller.dart';

class OrderApi {
  static Future<List<Order>> getOrders(token) async {
    final url = baseUrl + "orders/history/";
    final response = await http.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      final orders = data as List;
      return orders.map((product) => Order.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }

  static Future<OrderDetail> getOrderDetail(int id) async {
    final url = baseUrl + "orders/$id/";
    String? token = Get.find<AppController>().getToken();
    final response = await http.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);

      return OrderDetail.fromJson(data);
    } else {
      throw Exception('Failed to load orders');
    }
  }

  static Future<OrderDetail> confirmOrder(OrderRequest orderRequest) async {
    final url = baseUrl + "orders/cofirm/";
    final request = jsonEncode(orderRequest.toJson());
    String? token = Get.find<AppController>().getToken();
    final response = await http.post(
      Uri.parse(url),
      body: request,
      headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return OrderDetail.fromJson(data);
    } else if (response.statusCode == 401) {
      throw Exception('Invalid Credentials');
    } else {
      throw Exception('Trouble Registering');
    }
  }
}

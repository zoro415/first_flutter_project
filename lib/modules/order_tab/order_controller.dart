import 'package:get/get.dart';
import 'package:grocery_nepal/data/api/order_api.dart';
import 'package:grocery_nepal/data/models/order/order.dart';

class OrderTabConrtoller extends GetxController {
  final isLoading = false.obs;
  final isError = false.obs;

  String errorMessage = "";
  List<Order> orders = [];

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getOrders(String token) async {
    isLoading(true);
    isError(false);
    try {
      orders = await OrderApi.getOrders(token);
      isLoading(false);
    } catch (e) {
      isLoading(false);
      isError(true);
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = "Failed to load data";
      }
      errorMessage = e.toString();
    }
  }
}

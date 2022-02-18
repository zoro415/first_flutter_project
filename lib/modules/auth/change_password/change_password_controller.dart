import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/data/api/auth_api.dart';

import '../../../app_controller.dart';

class ChangePasswordController extends GetxController {
  final isLoading = false.obs;
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> changePassword() async {
    String oldPassword = oldPasswordController.text.trim();
    String newPassword = newPasswordController.text.trim();
    String confrimPassword = confirmPasswordController.text.trim();

    if (oldPassword.isEmpty || newPassword.isEmpty || confrimPassword.isEmpty) {
      Get.rawSnackbar(message: 'All Fields are required');
      return;
    }

    if (newPassword == oldPassword) {
      Get.rawSnackbar(message: "There is nothing to change");
      return;
    }

    if (confrimPassword != newPassword) {
      Get.rawSnackbar(message: "Passwords didnot match");
      return;
    }

    isLoading(true);
    try {
      String email = Get.find<AppController>().userProfile!.email ?? '';
      await AuthApi.login(username: email, password: oldPassword);
      isLoading(false);
    } catch (e) {
      isLoading(false);
      String errorMessage;
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else if (e.toString().contains('Invalid Credentials')) {
        errorMessage = "Old password did not match";
      } else {
        // errorMessage = "Failed to load data";
        errorMessage = e.toString();
      }
      Get.rawSnackbar(message: errorMessage);
      return;
    }
    try {
      await AuthApi.changePassword(password: newPassword);
      Get.back();
      Get.rawSnackbar(message: 'Password Changed Successfully');
    } catch (e) {
      isLoading(false);
      String errorMessage;
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        // errorMessage = "Failed to load data";
        errorMessage = e.toString();
      }
      Get.rawSnackbar(message: errorMessage);
      return;
    }

    isLoading(false);
  }

  @override
  void onClose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikn_sales/services/service.dart';
import 'package:vikn_sales/views/sales_list.dart';

class LoginController extends GetxController {
  final RxBool isLoading = false.obs;

  logintoDb(String user, password) async {
    isLoading(true);

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final response = await ApiServices().loginUser(user, password);

      if (response != null) {
        Map<String, dynamic> map = Map<String, dynamic>.from(response);

        prefs.setString('token', map['data']['access']);
        print(map);

        Get.snackbar(
          'Success',
          'Login successful!',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.to(() => SalesData());
      } else {
        Get.snackbar(
          'Error',
          'Login failed. Please check your credentials.',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (error) {
      Get.snackbar(
        'Error',
        'An error occurred. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }
}

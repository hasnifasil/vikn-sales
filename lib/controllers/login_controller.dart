import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikn_sales/views/sales_list.dart';

class LoginController extends GetxController {
  var url = 'https://api.accounts.vikncodes.com/api/v1/users/login';

  Dio dio = Dio();

  final RxBool isLoading = false.obs;

  void loginUser(String user, password, BuildContext context) async {
    isLoading(true);

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var data = {'username': user, 'password': password, 'is_mobile': 'true'};
      final response = await dio.post(url, data: jsonEncode(data));

      if (response.statusCode == 200) {
        Map<String, dynamic> map = Map<String, dynamic>.from(response.data);

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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SalesData()));
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

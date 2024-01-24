import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikn_sales/models/sales_data_model.dart';

class ApiServices {
  //function to get sales list
  Future getDatas(page) async {
    final apiUrl =
        'https://www.api.viknbooks.com/api/v10/sales/sale-list-page/';

    Dio dio = Dio();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final authHeader = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };

    Map<String, dynamic> payload = {
      "BranchID": 1,
      "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
      "CreatedUserID": 62,
      "PriceRounding": 3,
      "page_no": page,
      "items_per_page": 10,
      "type": "Sales",
      "WarehouseID": 1,
    };
    try {
      final response = await dio.post(
        apiUrl,
        data: jsonEncode(payload),
        options: Options(headers: authHeader),
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        return SalesModel.fromJson(responseData);
      } else {
        print('Error: ${response.statusCode}');
        print('Response: ${response.data}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  //function for login
  loginUser(String user, password) async {
    var url = 'https://api.accounts.vikncodes.com/api/v1/users/login';

    Dio dio = Dio();

    try {
     var data = {'username': user, 'password': password, 'is_mobile': 'true'};
      final response = await dio.post(url, data: jsonEncode(data));

      if (response.statusCode == 200) {
       return response.data;
        
      }
    } catch (e) {}
  }
}

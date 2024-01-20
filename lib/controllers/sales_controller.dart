import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikn_sales/models/sales_data_model.dart';

class ApiController extends GetxController {
  final apiUrl = 'https://www.api.viknbooks.com/api/v10/sales/sale-list-page/';
  var salesModel = SalesModel().obs;
  final RxInt currentPage = 1.obs;
  final RxBool isLoading = false.obs;

  Dio dio = Dio();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final authHeader = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    isLoading(true);

    Map<String, dynamic> payload = {
      "BranchID": 1,
      "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
      "CreatedUserID": 62,
      "PriceRounding": 3,
      "page_no": currentPage.value,
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
        final salesData = SalesModel.fromJson(responseData);

        if (currentPage.value == 1) {
          salesModel.value = salesData;
        } else {
          salesModel.update((val) {
            val!.data!.addAll(salesData.data ?? []);
          });
        }

        if ((salesData.data?.length ?? 0) >= 10) {
          currentPage.value++;
        }

        print('API Response: ${response.data}');
        print('kkkkkkkkkkkkkkkkkkkkkkkkkk');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Network Error: $error');
    } finally {
      isLoading(false);
    }
  }
}

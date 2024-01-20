import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikn_sales/models/sales_data_model.dart';
import 'package:vikn_sales/services/service.dart';

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
   
    final salesData = await ApiServices().getDatas(currentPage.value);
   
    isLoading(true);
    if (currentPage.value == 1) {
      salesModel.value = salesData;
    } else {
      salesModel.update((val) {
        val!.data!.addAll(salesData.data ?? []);
      });
    }

    if (salesData.data?.length >= 10) {
      currentPage.value++;
    }
    isLoading(false);
  }
}

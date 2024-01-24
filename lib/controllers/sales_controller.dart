import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:vikn_sales/models/sales_data_model.dart';
import 'package:vikn_sales/services/service.dart';

class ApiController extends GetxController {
  final apiUrl = 'https://www.api.viknbooks.com/api/v10/sales/sale-list-page/';
  var salesModel = SalesModel().obs;
  final RxInt currentPage = RxInt(1);
  final RxBool isLoading = RxBool(false);

  Dio dio = Dio();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    final salesData = await ApiServices().getDatas(currentPage.value);

    isLoading(true);
    try {
      if (currentPage.value == 1) {
        salesModel.value = salesData;
      } else {
        salesModel.update((val) {
          if (val != null && salesData.data != null) {
            val!.data!.addAll(salesData.data ?? []);
          }
        });
      }

      if (salesData.data?.length >= 10) {
        currentPage.value++;
      }
    } catch (e) {
      print(e);
    }
    isLoading(false);
  }
}

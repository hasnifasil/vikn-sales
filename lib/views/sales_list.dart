import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikn_sales/controllers/sales_controller.dart';

class SalesData extends StatelessWidget {
  final ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Estimate'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.add,
              color: Colors.blue,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
              color: Color.fromARGB(255, 240, 237, 237),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 16,
                    ),
                    suffixIcon: Icon(Icons.search),
                    labelText: 'Search',
                    border: InputBorder.none),
              )),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent &&
                    !apiController.isLoading.value) {
                  print('Fetching data...');
                  apiController.fetchData();
                }
                return false;
              },
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: apiController.salesModel.value.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      var data = apiController.salesModel.value.data![index];
                      final customerName = (data.customerName!.isEmpty)
                          ? 'No name'
                          : data.customerName;
                      return Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '# Invoice No',
                                  style: TextStyle(fontWeight: FontWeight.w200),
                                ),
                                Text(data.status!),
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(customerName!,style: TextStyle(fontWeight: FontWeight.w400),),
                              Row(
                                children: [
                                  Text('SAR ',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12),),
                                 Text(data.grandTotal.toString(),style: TextStyle(fontWeight: FontWeight.w400),),],
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.3,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          if (apiController.isLoading.value) LinearProgressIndicator(),
        ],
      ),
    );
  }
}

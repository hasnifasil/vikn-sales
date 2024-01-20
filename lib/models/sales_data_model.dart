class SalesModel {
  int? statusCode;
  List<Data>? data;
  int? totalCount;

  SalesModel({this.statusCode, this.data, this.totalCount});

  SalesModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['StatusCode'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StatusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total_count'] = this.totalCount;
    return data;
  }
}

class Data {
  int? index;
  String? id;
  String? voucherNo;
  String? date;
  String? ledgerName;
  double? totalGrossAmtRounded;
  double? totalTaxRounded;
  double? grandTotalRounded;
  String? customerName;
  double? totalTax;
  String? status;
  double? grandTotal;
  bool? isBillwised;
  String? billwiseStatus;

  Data(
      {this.index,
      this.id,
      this.voucherNo,
      this.date,
      this.ledgerName,
      this.totalGrossAmtRounded,
      this.totalTaxRounded,
      this.grandTotalRounded,
      this.customerName,
      this.totalTax,
      this.status,
      this.grandTotal,
      this.isBillwised,
      this.billwiseStatus});

  Data.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    id = json['id'];
    voucherNo = json['VoucherNo'];
    date = json['Date'];
    ledgerName = json['LedgerName'];
    totalGrossAmtRounded = json['TotalGrossAmt_rounded'];
    totalTaxRounded = json['TotalTax_rounded'];
    grandTotalRounded = json['GrandTotal_Rounded'];
    customerName = json['CustomerName'];
    totalTax = json['TotalTax'];
    status = json['Status'];
    grandTotal = json['GrandTotal'];
    isBillwised = json['is_billwised'];
    billwiseStatus = json['billwise_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['id'] = this.id;
    data['VoucherNo'] = this.voucherNo;
    data['Date'] = this.date;
    data['LedgerName'] = this.ledgerName;
    data['TotalGrossAmt_rounded'] = this.totalGrossAmtRounded;
    data['TotalTax_rounded'] = this.totalTaxRounded;
    data['GrandTotal_Rounded'] = this.grandTotalRounded;
    data['CustomerName'] = this.customerName;
    data['TotalTax'] = this.totalTax;
    data['Status'] = this.status;
    data['GrandTotal'] = this.grandTotal;
    data['is_billwised'] = this.isBillwised;
    data['billwise_status'] = this.billwiseStatus;
    return data;
  }
}

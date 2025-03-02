class StaticUserDetailModel {
  String? status;
  String? error;
  List<Result>? result;

  StaticUserDetailModel({this.status, this.error, this.result});

  StaticUserDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? customerId;
  String? customerName;
  String? customerCity;
  String? customerMobile;
  String? cityName;
  String? androidStoreLink;
  String? iosStoreLink;

  Result(
      {this.customerId,
        this.customerName,
        this.customerCity,
        this.customerMobile,
        this.cityName,
        this.androidStoreLink,
        this.iosStoreLink});

  Result.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    customerCity = json['customer_city'];
    customerMobile = json['customer_mobile'];
    cityName = json['city_name'];
    androidStoreLink = json['android_store_link'];
    iosStoreLink = json['ios_store_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['customer_city'] = this.customerCity;
    data['customer_mobile'] = this.customerMobile;
    data['city_name'] = this.cityName;
    data['android_store_link'] = this.androidStoreLink;
    data['ios_store_link'] = this.iosStoreLink;
    return data;
  }
}

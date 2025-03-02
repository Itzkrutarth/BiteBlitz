class LoginOtpModel {
  String? status;
  String? error;
  List<Result>? result;

  LoginOtpModel({this.status, this.error, this.result});

  LoginOtpModel.fromJson(Map<String, dynamic> json) {
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
  String? customerMobile;
  String? customerEmail;
  String? customerAddress;
  String? customerPincode;
  String? customerCity;
  String? cityName;
  String? androidStoreLink;
  String? iosStoreLink;

  Result(
      {this.customerId,
        this.customerName,
        this.customerMobile,
        this.customerEmail,
        this.customerAddress,
        this.customerPincode,
        this.customerCity,
        this.cityName,
        this.androidStoreLink,
        this.iosStoreLink});

  Result.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    customerMobile = json['customer_mobile'];
    customerEmail = json['customer_email'];
    customerAddress = json['customer_address'];
    customerPincode = json['customer_pincode'];
    customerCity = json['customer_city'];
    cityName = json['city_name'];
    androidStoreLink = json['android_store_link'];
    iosStoreLink = json['ios_store_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['customer_mobile'] = this.customerMobile;
    data['customer_email'] = this.customerEmail;
    data['customer_address'] = this.customerAddress;
    data['customer_pincode'] = this.customerPincode;
    data['customer_city'] = this.customerCity;
    data['city_name'] = this.cityName;
    data['android_store_link'] = this.androidStoreLink;
    data['ios_store_link'] = this.iosStoreLink;
    return data;
  }
}

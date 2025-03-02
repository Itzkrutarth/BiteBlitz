class ProfileModel {
  String? status;
  String? error;
  List<Result>? result;

  ProfileModel({this.status, this.error, this.result});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? customerGander;
  String? customerDob;
  String? cityName;

  Result(
      {this.customerId,
        this.customerName,
        this.customerMobile,
        this.customerEmail,
        this.customerAddress,
        this.customerPincode,
        this.customerCity,
        this.customerGander,
        this.customerDob,
        this.cityName});

  Result.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    customerMobile = json['customer_mobile'];
    customerEmail = json['customer_email'];
    customerAddress = json['customer_address'];
    customerPincode = json['customer_pincode'];
    customerCity = json['customer_city'];
    customerGander = json['customer_gander'];
    customerDob = json['customer_dob'];
    cityName = json['city_name'];
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
    data['customer_gander'] = this.customerGander;
    data['customer_dob'] = this.customerDob;
    data['city_name'] = this.cityName;
    return data;
  }
}

class CouponModel {
  String? status;
  String? error;
  List<Result>? result;

  CouponModel({this.status, this.error, this.result});

  CouponModel.fromJson(Map<String, dynamic> json) {
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
  String? couponId;
  String? couponCode;
  String? couponTitle;
  String? couponStartDate;
  String? couponEndDate;
  String? couponDetails;
  String? dateMsg;

  Result(
      {this.couponId,
        this.couponCode,
        this.couponTitle,
        this.couponStartDate,
        this.couponEndDate,
        this.couponDetails,
        this.dateMsg});

  Result.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponCode = json['coupon_code'];
    couponTitle = json['coupon_title'];
    couponStartDate = json['coupon_start_date'];
    couponEndDate = json['coupon_end_date'];
    couponDetails = json['coupon_details'];
    dateMsg = json['date_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.couponId;
    data['coupon_code'] = this.couponCode;
    data['coupon_title'] = this.couponTitle;
    data['coupon_start_date'] = this.couponStartDate;
    data['coupon_end_date'] = this.couponEndDate;
    data['coupon_details'] = this.couponDetails;
    data['date_msg'] = this.dateMsg;
    return data;
  }
}
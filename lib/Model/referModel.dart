class ReferModel {
  String? status;
  String? error;
  String? title;
  String? text;
  String? image;
  String? shareText;
  List<Result>? result;

  ReferModel(
      {this.status,
        this.error,
        this.title,
        this.text,
        this.image,
        this.shareText,
        this.result});

  ReferModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    title = json['title'];
    text = json['text'];
    image = json['image'];
    shareText = json['share_text'];
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
    data['title'] = this.title;
    data['text'] = this.text;
    data['image'] = this.image;
    data['share_text'] = this.shareText;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? customerReferralCode;

  Result({this.customerReferralCode});

  Result.fromJson(Map<String, dynamic> json) {
    customerReferralCode = json['customer_referral_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_referral_code'] = this.customerReferralCode;
    return data;
  }
}

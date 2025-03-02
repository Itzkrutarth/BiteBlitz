class NotificationModel {
  String? status;
  String? error;
  List<Result>? result;

  NotificationModel({this.status, this.error, this.result});

  NotificationModel.fromJson(Map<String, dynamic> json) {
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
  String? companyId;
  String? notificationId;
  String? notificationCustomerId;
  Null? notificationProductId;
  String? notificationTitle;
  String? notificationDescription;
  String? notificationImage;
  String? notificationType;
  String? isDeleted;
  String? cDate;
  String? notificationDetail;

  Result(
      {this.companyId,
        this.notificationId,
        this.notificationCustomerId,
        this.notificationProductId,
        this.notificationTitle,
        this.notificationDescription,
        this.notificationImage,
        this.notificationType,
        this.isDeleted,
        this.cDate,
        this.notificationDetail});

  Result.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    notificationId = json['notification_id'];
    notificationCustomerId = json['notification_customer_id'];
    notificationProductId = json['notification_product_id'];
    notificationTitle = json['notification_title'];
    notificationDescription = json['notification_description'];
    notificationImage = json['notification_image'];
    notificationType = json['notification_type'];
    isDeleted = json['is_deleted'];
    cDate = json['c_date'];
    notificationDetail = json['notification_detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_id'] = this.companyId;
    data['notification_id'] = this.notificationId;
    data['notification_customer_id'] = this.notificationCustomerId;
    data['notification_product_id'] = this.notificationProductId;
    data['notification_title'] = this.notificationTitle;
    data['notification_description'] = this.notificationDescription;
    data['notification_image'] = this.notificationImage;
    data['notification_type'] = this.notificationType;
    data['is_deleted'] = this.isDeleted;
    data['c_date'] = this.cDate;
    data['notification_detail'] = this.notificationDetail;
    return data;
  }
}
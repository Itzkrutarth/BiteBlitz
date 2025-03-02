class PointModel {
  String? status;
  String? error;
  String? customerPoint;
  List<Result>? result;

  PointModel({this.status, this.error, this.customerPoint, this.result});

  PointModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    customerPoint = json['customer_point'];
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
    data['customer_point'] = this.customerPoint;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? customerPointId;
  String? customerPoint;
  String? customerPointType;
  String? customerAvailablePoint;
  String? customerPointDetail;
  String? cDate;

  Result(
      {this.customerPointId,
        this.customerPoint,
        this.customerPointType,
        this.customerAvailablePoint,
        this.customerPointDetail,
        this.cDate});

  Result.fromJson(Map<String, dynamic> json) {
    customerPointId = json['customer_point_id'];
    customerPoint = json['customer_point'];
    customerPointType = json['customer_point_type'];
    customerAvailablePoint = json['customer_available_point'];
    customerPointDetail = json['customer_point_detail'];
    cDate = json['c_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_point_id'] = this.customerPointId;
    data['customer_point'] = this.customerPoint;
    data['customer_point_type'] = this.customerPointType;
    data['customer_available_point'] = this.customerAvailablePoint;
    data['customer_point_detail'] = this.customerPointDetail;
    data['c_date'] = this.cDate;
    return data;
  }
}
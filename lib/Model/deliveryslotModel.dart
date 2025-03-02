class DeliverySlotModel {
  String? status;
  String? error;
  List<Result>? result;

  DeliverySlotModel({this.status, this.error, this.result});

  DeliverySlotModel.fromJson(Map<String, dynamic> json) {
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
  String? delievryTimeSlotId;
  String? deliveryTimeSlot;
  String? deliveryTimeSlotPrioriy;

  Result(
      {this.delievryTimeSlotId,
        this.deliveryTimeSlot,
        this.deliveryTimeSlotPrioriy});

  Result.fromJson(Map<String, dynamic> json) {
    delievryTimeSlotId = json['delievry_time_slot_id'];
    deliveryTimeSlot = json['delivery_time_slot'];
    deliveryTimeSlotPrioriy = json['delivery_time_slot_prioriy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delievry_time_slot_id'] = this.delievryTimeSlotId;
    data['delivery_time_slot'] = this.deliveryTimeSlot;
    data['delivery_time_slot_prioriy'] = this.deliveryTimeSlotPrioriy;
    return data;
  }
}

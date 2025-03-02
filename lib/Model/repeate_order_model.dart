class RepeatOrderModel {
  String status;
  String error;
  List<dynamic> result;

  RepeatOrderModel({required this.status, required this.error, required this.result});

  factory RepeatOrderModel.fromJson(Map<String, dynamic> json) {
    return RepeatOrderModel(
      status: json['status'],
      error: json['error'],
      result: List<dynamic>.from(json['result']),
    );
  }
}

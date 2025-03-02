class UpdateProfileModel {
  String status;
  String error;
  List<dynamic> result;

  UpdateProfileModel({
    required this.status,
    required this.error,
    required this.result,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      status: json['status'],
      error: json['error'],
      result: List<dynamic>.from(json['result']),
    );
  }
}
class AddToCartModal {
  String? status;
  String? error;
  List<dynamic>? result;

  AddToCartModal({this.status, this.error, this.result});

  factory AddToCartModal.fromJson(Map<String, dynamic> json) {
    return AddToCartModal(
      status: json['status'],
      error: json['error'],
      result: json['result'] != null ? List<dynamic>.from(json['result']) : null,
    );
  }
}

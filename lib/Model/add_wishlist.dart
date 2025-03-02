class AddWishlistModel {
  String status;
  String error;
  List<dynamic> result;

  AddWishlistModel({
    required this.status,
    required this.error,
    required this.result,
  });

  factory AddWishlistModel.fromJson(Map<String, dynamic> json) {
    return AddWishlistModel(
      status: json['status'],
      error: json['error'],
      result: List<dynamic>.from(json['result']),
    );
  }
}

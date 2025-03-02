

class RemoveWishlistModel {
  String status;
  String error;
  List<dynamic> result;

  RemoveWishlistModel(
      {required this.status, required this.error, required this.result});

  factory RemoveWishlistModel.fromJson(Map<String, dynamic> json) {
    return RemoveWishlistModel(
      status: json['status'] ?? "",
      error: json['error'] ?? "",
      result: json['result'] ?? [],
    );
  }
}

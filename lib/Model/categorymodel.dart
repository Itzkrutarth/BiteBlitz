class CategoryModel {
  String? status;
  String? error;
  List<Result>? result;

  CategoryModel({this.status, this.error, this.result});

  CategoryModel.fromJson(Map<String, dynamic> json) {
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
  String? categoryId;
  String? categoryName;
  String? categoryImage;
  String? categoryBanner;

  Result(
      {this.companyId,
        this.categoryId,
        this.categoryName,
        this.categoryImage,
        this.categoryBanner});

  Result.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
    categoryBanner = json['category_banner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_id'] = this.companyId;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_image'] = this.categoryImage;
    data['category_banner'] = this.categoryBanner;
    return data;
  }
}
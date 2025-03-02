class SubCategoryFruitModel {
  String? status;
  String? error;
  List<Result>? result;

  SubCategoryFruitModel({this.status, this.error, this.result});

  SubCategoryFruitModel.fromJson(Map<String, dynamic> json) {
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
  String? subcategoryId;
  String? subcategoryName;
  String? subcategoryImage;
  String? subcategoryCatId;

  Result(
      {this.companyId,
        this.subcategoryId,
        this.subcategoryName,
        this.subcategoryImage,
        this.subcategoryCatId});

  Result.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    subcategoryId = json['subcategory_id'];
    subcategoryName = json['subcategory_name'];
    subcategoryImage = json['subcategory_image'];
    subcategoryCatId = json['subcategory_cat_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_id'] = this.companyId;
    data['subcategory_id'] = this.subcategoryId;
    data['subcategory_name'] = this.subcategoryName;
    data['subcategory_image'] = this.subcategoryImage;
    data['subcategory_cat_id'] = this.subcategoryCatId;
    return data;
  }
}
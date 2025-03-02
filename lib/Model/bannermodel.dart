class BannerModel {
  String? status;
  String? error;
  List<Result>? result;

  BannerModel({this.status, this.error, this.result});

  BannerModel.fromJson(Map<String, dynamic> json) {
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
  String? offetrId;
  String? createBannerFor;
  String? offerProductIds;
  String? offerTitle;
  String? offerDescription;
  String? offerImage;
  String? offerImageWeb;
  String? offerStartDate;
  String? offerEndDate;
  String? offerIsInBanner;
  String? offerDates;
  String? slugTitle;
  String? seoTitle;
  String? seoKeywords;
  String? seoAuthor;
  String? offerType;
  String? cDate;
  String? isDeleted;

  Result(
      {this.companyId,
        this.offetrId,
        this.createBannerFor,
        this.offerProductIds,
        this.offerTitle,
        this.offerDescription,
        this.offerImage,
        this.offerImageWeb,
        this.offerStartDate,
        this.offerEndDate,
        this.offerIsInBanner,
        this.offerDates,
        this.slugTitle,
        this.seoTitle,
        this.seoKeywords,
        this.seoAuthor,
        this.offerType,
        this.cDate,
        this.isDeleted});

  Result.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    offetrId = json['offetr_id'];
    createBannerFor = json['create_banner_for'];
    offerProductIds = json['offer_product_ids'];
    offerTitle = json['offer_title'];
    offerDescription = json['offer_description'];
    offerImage = json['offer_image'];
    offerImageWeb = json['offer_image_web'];
    offerStartDate = json['offer_start_date'];
    offerEndDate = json['offer_end_date'];
    offerIsInBanner = json['offer_is_in_banner'];
    offerDates = json['offer_dates'];
    slugTitle = json['slug_title'];
    seoTitle = json['seo_title'];
    seoKeywords = json['seo_keywords'];
    seoAuthor = json['seo_author'];
    offerType = json['offer_type'];
    cDate = json['c_date'];
    isDeleted = json['is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_id'] = this.companyId;
    data['offetr_id'] = this.offetrId;
    data['create_banner_for'] = this.createBannerFor;
    data['offer_product_ids'] = this.offerProductIds;
    data['offer_title'] = this.offerTitle;
    data['offer_description'] = this.offerDescription;
    data['offer_image'] = this.offerImage;
    data['offer_image_web'] = this.offerImageWeb;
    data['offer_start_date'] = this.offerStartDate;
    data['offer_end_date'] = this.offerEndDate;
    data['offer_is_in_banner'] = this.offerIsInBanner;
    data['offer_dates'] = this.offerDates;
    data['slug_title'] = this.slugTitle;
    data['seo_title'] = this.seoTitle;
    data['seo_keywords'] = this.seoKeywords;
    data['seo_author'] = this.seoAuthor;
    data['offer_type'] = this.offerType;
    data['c_date'] = this.cDate;
    data['is_deleted'] = this.isDeleted;
    return data;
  }
}
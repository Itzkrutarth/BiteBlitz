class SavingDaysModel {
  String? status;
  String? error;
  List<Result>? result;

  SavingDaysModel({this.status, this.error, this.result});

  SavingDaysModel.fromJson(Map<String, dynamic> json) {
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
  String? offetrId;
  String? offerTitle;
  String? offerProductIds;
  String? createBannerFor;
  List<ArrayProduct>? arrayProduct;

  Result(
      {this.offetrId,
        this.offerTitle,
        this.offerProductIds,
        this.createBannerFor,
        this.arrayProduct});

  Result.fromJson(Map<String, dynamic> json) {
    offetrId = json['offetr_id'];
    offerTitle = json['offer_title'];
    offerProductIds = json['offer_product_ids'];
    createBannerFor = json['create_banner_for'];
    if (json['array_product'] != null) {
      arrayProduct = <ArrayProduct>[];
      json['array_product'].forEach((v) {
        arrayProduct!.add(new ArrayProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offetr_id'] = this.offetrId;
    data['offer_title'] = this.offerTitle;
    data['offer_product_ids'] = this.offerProductIds;
    data['create_banner_for'] = this.createBannerFor;
    if (this.arrayProduct != null) {
      data['array_product'] =
          this.arrayProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ArrayProduct {
  String? productId;
  String? productCatId;
  String? productSubcatId;
  String? productName;
  String? productVariantName;
  String? productImage;
  String? productMrp;
  String? productDiscountAmt;
  String? productWholesalerAmt;
  String? brandName;
  String? productIsActive;
  String? productAverageRating;
  String? productNoOfRating;
  String? offetrId;
  String? productQty;
  String? isInCart;
  String? buttonText;
  String? percentageDiscount;
  String? inWishlist;
  String? wishlistId;

  ArrayProduct(
      {this.productId,
        this.productCatId,
        this.productSubcatId,
        this.productName,
        this.productVariantName,
        this.productImage,
        this.productMrp,
        this.productDiscountAmt,
        this.productWholesalerAmt,
        this.brandName,
        this.productIsActive,
        this.productAverageRating,
        this.productNoOfRating,
        this.offetrId,
        this.productQty,
        this.isInCart,
        this.buttonText,
        this.percentageDiscount,
        this.inWishlist,
        this.wishlistId});

  ArrayProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productCatId = json['product_cat_id'];
    productSubcatId = json['product_subcat_id'];
    productName = json['product_name'];
    productVariantName = json['product_variant_name'];
    productImage = json['product_image'];
    productMrp = json['product_mrp'];
    productDiscountAmt = json['product_discount_amt'];
    productWholesalerAmt = json['product_wholesaler_amt'];
    brandName = json['brand_name'];
    productIsActive = json['product_is_active'];
    productAverageRating = json['product_average_rating'];
    productNoOfRating = json['product_no_of_rating'];
    offetrId = json['offetr_id'];
    productQty = json['product_qty'];
    isInCart = json['is_in_cart'];
    buttonText = json['button_text'];
    percentageDiscount = json['percentage_discount'];
    inWishlist = json['in_wishlist'];
    wishlistId = json['wishlist_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_cat_id'] = this.productCatId;
    data['product_subcat_id'] = this.productSubcatId;
    data['product_name'] = this.productName;
    data['product_variant_name'] = this.productVariantName;
    data['product_image'] = this.productImage;
    data['product_mrp'] = this.productMrp;
    data['product_discount_amt'] = this.productDiscountAmt;
    data['product_wholesaler_amt'] = this.productWholesalerAmt;
    data['brand_name'] = this.brandName;
    data['product_is_active'] = this.productIsActive;
    data['product_average_rating'] = this.productAverageRating;
    data['product_no_of_rating'] = this.productNoOfRating;
    data['offetr_id'] = this.offetrId;
    data['product_qty'] = this.productQty;
    data['is_in_cart'] = this.isInCart;
    data['button_text'] = this.buttonText;
    data['percentage_discount'] = this.percentageDiscount;
    data['in_wishlist'] = this.inWishlist;
    data['wishlist_id'] = this.wishlistId;
    return data;
  }
}

class WishListModel {
  String? status;
  String? noDataFound;
  String? error;
  List<Result>? result;

  WishListModel({this.status, this.noDataFound, this.error, this.result});

  WishListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    noDataFound = json['no_data_found'];
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
    data['no_data_found'] = this.noDataFound;
    data['error'] = this.error;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? wishlistId;
  String? productId;
  String? productCatId;
  String? productIsActive;
  String? productSubcatId;
  String? productName;
  String? productVariantName;
  String? productImage;
  String? productMrp;
  String? productDiscountAmt;
  String? productWholesalerAmt;
  String? brandName;
  String? productAverageRating;
  String? productNoOfRating;
  String? productQty;
  String? isInCart;
  String? buttonText;
  String? percentageDiscount;

  Result(
      {this.wishlistId,
        this.productId,
        this.productCatId,
        this.productIsActive,
        this.productSubcatId,
        this.productName,
        this.productVariantName,
        this.productImage,
        this.productMrp,
        this.productDiscountAmt,
        this.productWholesalerAmt,
        this.brandName,
        this.productAverageRating,
        this.productNoOfRating,
        this.productQty,
        this.isInCart,
        this.buttonText,
        this.percentageDiscount});

  Result.fromJson(Map<String, dynamic> json) {
    wishlistId = json['wishlist_id'];
    productId = json['product_id'];
    productCatId = json['product_cat_id'];
    productIsActive = json['product_is_active'];
    productSubcatId = json['product_subcat_id'];
    productName = json['product_name'];
    productVariantName = json['product_variant_name'];
    productImage = json['product_image'];
    productMrp = json['product_mrp'];
    productDiscountAmt = json['product_discount_amt'];
    productWholesalerAmt = json['product_wholesaler_amt'];
    brandName = json['brand_name'];
    productAverageRating = json['product_average_rating'];
    productNoOfRating = json['product_no_of_rating'];
    productQty = json['product_qty'];
    isInCart = json['is_in_cart'];
    buttonText = json['button_text'];
    percentageDiscount = json['percentage_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wishlist_id'] = this.wishlistId;
    data['product_id'] = this.productId;
    data['product_cat_id'] = this.productCatId;
    data['product_is_active'] = this.productIsActive;
    data['product_subcat_id'] = this.productSubcatId;
    data['product_name'] = this.productName;
    data['product_variant_name'] = this.productVariantName;
    data['product_image'] = this.productImage;
    data['product_mrp'] = this.productMrp;
    data['product_discount_amt'] = this.productDiscountAmt;
    data['product_wholesaler_amt'] = this.productWholesalerAmt;
    data['brand_name'] = this.brandName;
    data['product_average_rating'] = this.productAverageRating;
    data['product_no_of_rating'] = this.productNoOfRating;
    data['product_qty'] = this.productQty;
    data['is_in_cart'] = this.isInCart;
    data['button_text'] = this.buttonText;
    data['percentage_discount'] = this.percentageDiscount;
    return data;
  }
}
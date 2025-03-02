class ProductModel {
  String? status;
  String? error;
  List<Result>? result;

  ProductModel({this.status, this.error, this.result});

  ProductModel.fromJson(Map<String, dynamic> json) {
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
  String? productSubcatId;
  String? productCatId;
  String? productId;
  String? productName;
  String? productDescription;
  String? productReferenceCode;
  String? productVariantName;
  String? productDescriptionLong;
  String? productIsActive;
  String? productImage;
  String? productMultiImage;
  String? productMrp;
  String? productDiscountAmt;
  String? productWholesalerAmt;
  String? subcategoryName;
  String? categoryName;
  String? brandName;
  String? productAverageRating;
  String? productNoOfRating;
  String? rating;
  String? review;
  String? status;
  String? ratingId;
  String? percentageDiscount;
  String? productQty;
  String? isInCart;
  String? buttonText;
  List<ProductVarient>? productVarient;
  List<ProductMultipleImagesArray>? productMultipleImagesArray;
  String? inWishlist;
  String? wishlistId;
  List<Null>? productReview;

  Result(
      {this.productSubcatId,
        this.productCatId,
        this.productId,
        this.productName,
        this.productDescription,
        this.productReferenceCode,
        this.productVariantName,
        this.productDescriptionLong,
        this.productIsActive,
        this.productImage,
        this.productMultiImage,
        this.productMrp,
        this.productDiscountAmt,
        this.productWholesalerAmt,
        this.subcategoryName,
        this.categoryName,
        this.brandName,
        this.productAverageRating,
        this.productNoOfRating,
        this.rating,
        this.review,
        this.status,
        this.ratingId,
        this.percentageDiscount,
        this.productQty,
        this.isInCart,
        this.buttonText,
        this.productVarient,
        this.productMultipleImagesArray,
        this.inWishlist,
        this.wishlistId,
        this.productReview});

  Result.fromJson(Map<String, dynamic> json) {
    productSubcatId = json['product_subcat_id'];
    productCatId = json['product_cat_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    productReferenceCode = json['product_reference_code'];
    productVariantName = json['product_variant_name'];
    productDescriptionLong = json['product_description_long'];
    productIsActive = json['product_is_active'];
    productImage = json['product_image'];
    productMultiImage = json['product_multi_image'];
    productMrp = json['product_mrp'];
    productDiscountAmt = json['product_discount_amt'];
    productWholesalerAmt = json['product_wholesaler_amt'];
    subcategoryName = json['subcategory_name'];
    categoryName = json['category_name'];
    brandName = json['brand_name'];
    productAverageRating = json['product_average_rating'];
    productNoOfRating = json['product_no_of_rating'];
    rating = json['rating'];
    review = json['review'];
    status = json['status'];
    ratingId = json['rating_id'];
    percentageDiscount = json['percentage_discount'];
    productQty = json['product_qty'];
    isInCart = json['is_in_cart'];
    buttonText = json['button_text'];
    if (json['product_varient'] != null) {
      productVarient = <ProductVarient>[];
      json['product_varient'].forEach((v) {
        productVarient!.add(new ProductVarient.fromJson(v));
      });
    }
    if (json['product_multiple_images_array'] != null) {
      productMultipleImagesArray = <ProductMultipleImagesArray>[];
      json['product_multiple_images_array'].forEach((v) {
        productMultipleImagesArray!
            .add(new ProductMultipleImagesArray.fromJson(v));
      });
    }
    inWishlist = json['in_wishlist'];
    wishlistId = json['wishlist_id'];
    /*if (json['product_review'] != null) {
      productReview = <Null>[];
      json['product_review'].forEach((v) {
        productReview!.add(new Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_subcat_id'] = this.productSubcatId;
    data['product_cat_id'] = this.productCatId;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_description'] = this.productDescription;
    data['product_reference_code'] = this.productReferenceCode;
    data['product_variant_name'] = this.productVariantName;
    data['product_description_long'] = this.productDescriptionLong;
    data['product_is_active'] = this.productIsActive;
    data['product_image'] = this.productImage;
    data['product_multi_image'] = this.productMultiImage;
    data['product_mrp'] = this.productMrp;
    data['product_discount_amt'] = this.productDiscountAmt;
    data['product_wholesaler_amt'] = this.productWholesalerAmt;
    data['subcategory_name'] = this.subcategoryName;
    data['category_name'] = this.categoryName;
    data['brand_name'] = this.brandName;
    data['product_average_rating'] = this.productAverageRating;
    data['product_no_of_rating'] = this.productNoOfRating;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['status'] = this.status;
    data['rating_id'] = this.ratingId;
    data['percentage_discount'] = this.percentageDiscount;
    data['product_qty'] = this.productQty;
    data['is_in_cart'] = this.isInCart;
    data['button_text'] = this.buttonText;
    if (this.productVarient != null) {
      data['product_varient'] =
          this.productVarient!.map((v) => v.toJson()).toList();
    }
    if (this.productMultipleImagesArray != null) {
      data['product_multiple_images_array'] =
          this.productMultipleImagesArray!.map((v) => v.toJson()).toList();
    }
    data['in_wishlist'] = this.inWishlist;
    data['wishlist_id'] = this.wishlistId;
   /* if (this.productReview != null) {
      data['product_review'] =
          this.productReview!.map((v) => v?.toJson()).toList();
    }*/
    return data;
  }
}

class ProductVarient {
  String? productId;
  String? productVariantName;
  String? productMrp;
  String? productDiscountAmt;
  String? productWholesalerAmt;
  String? percentageDiscount;

  ProductVarient(
      {this.productId,
        this.productVariantName,
        this.productMrp,
        this.productDiscountAmt,
        this.productWholesalerAmt,
        this.percentageDiscount});

  ProductVarient.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productVariantName = json['product_variant_name'];
    productMrp = json['product_mrp'];
    productDiscountAmt = json['product_discount_amt'];
    productWholesalerAmt = json['product_wholesaler_amt'];
    percentageDiscount = json['percentage_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_variant_name'] = this.productVariantName;
    data['product_mrp'] = this.productMrp;
    data['product_discount_amt'] = this.productDiscountAmt;
    data['product_wholesaler_amt'] = this.productWholesalerAmt;
    data['percentage_discount'] = this.percentageDiscount;
    return data;
  }
}

class ProductMultipleImagesArray {
  String? image;

  ProductMultipleImagesArray({this.image});

  ProductMultipleImagesArray.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}
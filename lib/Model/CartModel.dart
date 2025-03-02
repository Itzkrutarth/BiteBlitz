class CartModel {
  String? status;
  String? error;
  String? onlinePaymentStatus;
  String? codPaymentStatus;
  String? couponDiscount;
  String? couponCodeStatus;
  String? couponCodeId;
  String? pointUsed;
  String? discount;
  String? addOrderCouponDiscount;
  List<Result>? result;
  String? deliveryCharge;
  String? note;
  String? totalMrp;
  String? subTotal;
  int? addOrderPointUsed;
  String? totalAmount;

  CartModel(
      {this.status,
        this.error,
        this.onlinePaymentStatus,
        this.codPaymentStatus,
        this.couponDiscount,
        this.couponCodeStatus,
        this.couponCodeId,
        this.pointUsed,
        this.discount,
        this.addOrderCouponDiscount,
        this.result,
        this.deliveryCharge,
        this.note,
        this.totalMrp,
        this.subTotal,
        this.addOrderPointUsed,
        this.totalAmount});

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    onlinePaymentStatus = json['online_payment_status'];
    codPaymentStatus = json['cod_payment_status'];
    couponDiscount = json['coupon_discount'];
    couponCodeStatus = json['coupon_code_status'];
    couponCodeId = json['coupon_code_id'];
    pointUsed = json['point_used'];
    discount = json['discount'];
    addOrderCouponDiscount = json['add_order_coupon_discount'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    deliveryCharge = json['delivery_charge'];
    note = json['note'];
    totalMrp = json['totalMrp'];
    subTotal = json['sub_total'];
    addOrderPointUsed = json['add_order_point_used'];
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    data['online_payment_status'] = this.onlinePaymentStatus;
    data['cod_payment_status'] = this.codPaymentStatus;
    data['coupon_discount'] = this.couponDiscount;
    data['coupon_code_status'] = this.couponCodeStatus;
    data['coupon_code_id'] = this.couponCodeId;
    data['point_used'] = this.pointUsed;
    data['discount'] = this.discount;
    data['add_order_coupon_discount'] = this.addOrderCouponDiscount;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['delivery_charge'] = this.deliveryCharge;
    data['note'] = this.note;
    data['totalMrp'] = this.totalMrp;
    data['sub_total'] = this.subTotal;
    data['add_order_point_used'] = this.addOrderPointUsed;
    data['totalAmount'] = this.totalAmount;
    return data;
  }
}

class Result {
  String? productWholesalerAmt;
  String? cartProductId;
  String? productName;
  String? productVariantName;
  String? productQuantity;
  String? productCgst;
  String? productSgst;
  String? productIgst;
  String? productMrp;
  String? productDiscountAmt;
  String? productImage;
  String? productCatId;

  Result(
      {this.productWholesalerAmt,
        this.cartProductId,
        this.productName,
        this.productVariantName,
        this.productQuantity,
        this.productCgst,
        this.productSgst,
        this.productIgst,
        this.productMrp,
        this.productDiscountAmt,
        this.productImage,
        this.productCatId});

  Result.fromJson(Map<String, dynamic> json) {
    productWholesalerAmt = json['product_wholesaler_amt'];
    cartProductId = json['cart_product_id'];
    productName = json['product_name'];
    productVariantName = json['product_variant_name'];
    productQuantity = json['product_quantity'];
    productCgst = json['product_cgst'];
    productSgst = json['product_sgst'];
    productIgst = json['product_igst'];
    productMrp = json['product_mrp'];
    productDiscountAmt = json['product_discount_amt'];
    productImage = json['product_image'];
    productCatId = json['product_cat_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_wholesaler_amt'] = this.productWholesalerAmt;
    data['cart_product_id'] = this.cartProductId;
    data['product_name'] = this.productName;
    data['product_variant_name'] = this.productVariantName;
    data['product_quantity'] = this.productQuantity;
    data['product_cgst'] = this.productCgst;
    data['product_sgst'] = this.productSgst;
    data['product_igst'] = this.productIgst;
    data['product_mrp'] = this.productMrp;
    data['product_discount_amt'] = this.productDiscountAmt;
    data['product_image'] = this.productImage;
    data['product_cat_id'] = this.productCatId;
    return data;
  }
}
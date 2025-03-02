class OrderDetailModel {
  String status;
  String error;
  List<OrderDetailResult> result;
  List<GeneralInfo> generalInfo;

  OrderDetailModel({
    required this.status,
    required this.error,
    required this.result,
    required this.generalInfo,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailModel(
      status: json['status'],
      error: json['error'],
      result: List<OrderDetailResult>.from(
          json['result'].map((result) => OrderDetailResult.fromJson(result))),
      generalInfo: List<GeneralInfo>.from(
          json['general_info'].map((info) => GeneralInfo.fromJson(info))),
    );
  }
}

class OrderDetailResult {
  String invoiceDate;
  String detailProductName;
  String detailProductVariantName;
  String detailProductId;
  String detailMrp;
  String detailTotalAmount;
  String detailTotalPayable;
  String detailQuantity;
  String productImage;
  String productAverageRating;
  String productNoOfRating;
  String ratingId;
  String rating;
  String review;
  String status;

  OrderDetailResult({
    required this.invoiceDate,
    required this.detailProductName,
    required this.detailProductVariantName,
    required this.detailProductId,
    required this.detailMrp,
    required this.detailTotalAmount,
    required this.detailTotalPayable,
    required this.detailQuantity,
    required this.productImage,
    required this.productAverageRating,
    required this.productNoOfRating,
    required this.ratingId,
    required this.rating,
    required this.review,
    required this.status,
  });

  factory OrderDetailResult.fromJson(Map<String, dynamic> json) {
    return OrderDetailResult(
      invoiceDate: json['invoice_date'],
      detailProductName: json['detail_product_name'],
      detailProductVariantName: json['detail_product_variant_name'],
      detailProductId: json['detail_product_id'],
      detailMrp: json['detail_mrp'],
      detailTotalAmount: json['detail_total_amount'],
      detailTotalPayable: json['detail_total_payable'],
      detailQuantity: json['detail_quantity'],
      productImage: json['product_image'],
      productAverageRating: json['product_average_rating'],
      productNoOfRating: json['product_no_of_rating'],
      ratingId: json['rating_id'],
      rating: json['rating'],
      review: json['review'],
      status: json['status'],
    );
  }
}

class GeneralInfo {
  String invoicePrefix;
  String invoiceNum;
  String invoiceTotalAmount;
  String invoiceDeliveryCharges;
  String invoiceAddress;
  String invoiceMobile;
  String invoiceStatus;
  String customerName;
  dynamic invoiceDeliveryDate;
  String invoiceCouponCodeDiscount;
  String invoiceDiscount;
  String orderId;
  String totalAmount;
  String mrp;
  String discount;
  String pointDiscount;
  String deliveryCharges;
  String netAmount;

  GeneralInfo({
    required this.invoicePrefix,
    required this.invoiceNum,
    required this.invoiceTotalAmount,
    required this.invoiceDeliveryCharges,
    required this.invoiceAddress,
    required this.invoiceMobile,
    required this.invoiceStatus,
    required this.customerName,
    required this.invoiceDeliveryDate,
    required this.invoiceCouponCodeDiscount,
    required this.invoiceDiscount,
    required this.orderId,
    required this.totalAmount,
    required this.mrp,
    required this.discount,
    required this.pointDiscount,
    required this.deliveryCharges,
    required this.netAmount,
  });

  factory GeneralInfo.fromJson(Map<String, dynamic> json) {
    return GeneralInfo(
      invoicePrefix: json['invoice_prefix'],
      invoiceNum: json['invoice_num'],
      invoiceTotalAmount: json['invoice_total_amount'],
      invoiceDeliveryCharges: json['invoice_delivery_charges'],
      invoiceAddress: json['invoice_address'],
      invoiceMobile: json['invoice_mobile'],
      invoiceStatus: json['invoice_status'],
      customerName: json['customer_name'],
      invoiceDeliveryDate: json['invoice_delivery_date'],
      invoiceCouponCodeDiscount: json['invoice_coupon_code_discount'],
      invoiceDiscount: json['invoice_discount'],
      orderId: json['order_id'],
      totalAmount: json['total_amount'],
      mrp: json['mrp'],
      discount: json['discount'],
      pointDiscount: json['point_discount'],
      deliveryCharges: json['delivery_charges'],
      netAmount: json['net_amount'],
    );
  }
}
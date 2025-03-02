class OrderModel {
  String? status;
  String? error;
  List<Result>? result;

  OrderModel({this.status, this.error, this.result});

  OrderModel.fromJson(Map<String, dynamic> json) {
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
  String? invoiceId;
  String? invoicePrefix;
  String? invoiceNum;
  String? invoiceDate;
  String? invoiceTime;
  String? invoiceFinancialYear;
  String? invoiceCustomerId;
  String? invoiceMobile;
  String? invoiceName;
  String? invoiceEmailId;
  String? invoiceCity;
  String? invoiceAddress;
  String? invoiceGstNum;
  String? invoiceTotalAmount;
  String? invoiceCgst;
  String? invoiceSgst;
  String? invoiceIgst;
  String? invoicePayable;
  String? invoiceRemainingAmount;
  String? invoiceReceivedAmount;
  String? invoicePincode;
  String? invoiceDeliveryCharges;
  String? invoiceDiscount;
  String? invoiceCouponCodeDiscount;
  String? invoiceCouponId;
  String? invoicePayingAmount;
  String? invoiceChangeReturn;
  String? invoicePaymentMode;
  Null? invoicePaymentTxn;
  String? invoiceGeneratedBy;
  Null? invoiceUpdatedBy;
  Null? invoiceUpdatedDate;
  String? invoiceFrom;
  Null? invoiceDeliveryDate;
  String? invoiceSpecialInstruction;
  Null? invoiceDeliveryBoyId;
  String? invoiceDeliveryTimeSlotId;
  String? invoiceIsHold;
  String? invoiceStatus;
  String? invoiceRazorpayOrderId;
  String? invoiceRazorpayStatus;
  Null? invoiceRazorpayPaymentId;
  String? invoiceRazorpaySignature;
  String? invoiceHdfcPayble;
  String? isDeleted;
  String? cDate;
  String? orderId;
  String? orderTotal;
  String? bottomText;
  String? totalItem;

  Result(
      {this.companyId,
        this.invoiceId,
        this.invoicePrefix,
        this.invoiceNum,
        this.invoiceDate,
        this.invoiceTime,
        this.invoiceFinancialYear,
        this.invoiceCustomerId,
        this.invoiceMobile,
        this.invoiceName,
        this.invoiceEmailId,
        this.invoiceCity,
        this.invoiceAddress,
        this.invoiceGstNum,
        this.invoiceTotalAmount,
        this.invoiceCgst,
        this.invoiceSgst,
        this.invoiceIgst,
        this.invoicePayable,
        this.invoiceRemainingAmount,
        this.invoiceReceivedAmount,
        this.invoicePincode,
        this.invoiceDeliveryCharges,
        this.invoiceDiscount,
        this.invoiceCouponCodeDiscount,
        this.invoiceCouponId,
        this.invoicePayingAmount,
        this.invoiceChangeReturn,
        this.invoicePaymentMode,
        this.invoicePaymentTxn,
        this.invoiceGeneratedBy,
        this.invoiceUpdatedBy,
        this.invoiceUpdatedDate,
        this.invoiceFrom,
        this.invoiceDeliveryDate,
        this.invoiceSpecialInstruction,
        this.invoiceDeliveryBoyId,
        this.invoiceDeliveryTimeSlotId,
        this.invoiceIsHold,
        this.invoiceStatus,
        this.invoiceRazorpayOrderId,
        this.invoiceRazorpayStatus,
        this.invoiceRazorpayPaymentId,
        this.invoiceRazorpaySignature,
        this.invoiceHdfcPayble,
        this.isDeleted,
        this.cDate,
        this.orderId,
        this.orderTotal,
        this.bottomText,
        this.totalItem});

  Result.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    invoiceId = json['invoice_id'];
    invoicePrefix = json['invoice_prefix'];
    invoiceNum = json['invoice_num'];
    invoiceDate = json['invoice_date'];
    invoiceTime = json['invoice_time'];
    invoiceFinancialYear = json['invoice_financial_year'];
    invoiceCustomerId = json['invoice_customer_id'];
    invoiceMobile = json['invoice_mobile'];
    invoiceName = json['invoice_name'];
    invoiceEmailId = json['invoice_email_id'];
    invoiceCity = json['invoice_city'];
    invoiceAddress = json['invoice_address'];
    invoiceGstNum = json['invoice_gst_num'];
    invoiceTotalAmount = json['invoice_total_amount'];
    invoiceCgst = json['invoice_cgst'];
    invoiceSgst = json['invoice_sgst'];
    invoiceIgst = json['invoice_igst'];
    invoicePayable = json['invoice_payable'];
    invoiceRemainingAmount = json['invoice_remaining_amount'];
    invoiceReceivedAmount = json['invoice_received_amount'];
    invoicePincode = json['invoice_pincode'];
    invoiceDeliveryCharges = json['invoice_delivery_charges'];
    invoiceDiscount = json['invoice_discount'];
    invoiceCouponCodeDiscount = json['invoice_coupon_code_discount'];
    invoiceCouponId = json['invoice_coupon_id'];
    invoicePayingAmount = json['invoice_paying_amount'];
    invoiceChangeReturn = json['invoice_change_return'];
    invoicePaymentMode = json['invoice_payment_mode'];
    invoicePaymentTxn = json['invoice_payment_txn'];
    invoiceGeneratedBy = json['invoice_generated_by'];
    invoiceUpdatedBy = json['invoice_updated_by'];
    invoiceUpdatedDate = json['invoice_updated_date'];
    invoiceFrom = json['invoice_from'];
    invoiceDeliveryDate = json['invoice_delivery_date'];
    invoiceSpecialInstruction = json['invoice_special_instruction'];
    invoiceDeliveryBoyId = json['invoice_delivery_boy_id'];
    invoiceDeliveryTimeSlotId = json['invoice_delivery_time_slot_id'];
    invoiceIsHold = json['invoice_is_hold'];
    invoiceStatus = json['invoice_status'];
    invoiceRazorpayOrderId = json['invoice_razorpayOrderId'];
    invoiceRazorpayStatus = json['invoice_razorpay_status'];
    invoiceRazorpayPaymentId = json['invoice_razorpay_payment_id'];
    invoiceRazorpaySignature = json['invoice_razorpay_signature'];
    invoiceHdfcPayble = json['invoice_hdfc_payble'];
    isDeleted = json['is_deleted'];
    cDate = json['c_date'];
    orderId = json['order_id'];
    orderTotal = json['order_total'];
    bottomText = json['bottom_text'];
    totalItem = json['total_item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_id'] = this.companyId;
    data['invoice_id'] = this.invoiceId;
    data['invoice_prefix'] = this.invoicePrefix;
    data['invoice_num'] = this.invoiceNum;
    data['invoice_date'] = this.invoiceDate;
    data['invoice_time'] = this.invoiceTime;
    data['invoice_financial_year'] = this.invoiceFinancialYear;
    data['invoice_customer_id'] = this.invoiceCustomerId;
    data['invoice_mobile'] = this.invoiceMobile;
    data['invoice_name'] = this.invoiceName;
    data['invoice_email_id'] = this.invoiceEmailId;
    data['invoice_city'] = this.invoiceCity;
    data['invoice_address'] = this.invoiceAddress;
    data['invoice_gst_num'] = this.invoiceGstNum;
    data['invoice_total_amount'] = this.invoiceTotalAmount;
    data['invoice_cgst'] = this.invoiceCgst;
    data['invoice_sgst'] = this.invoiceSgst;
    data['invoice_igst'] = this.invoiceIgst;
    data['invoice_payable'] = this.invoicePayable;
    data['invoice_remaining_amount'] = this.invoiceRemainingAmount;
    data['invoice_received_amount'] = this.invoiceReceivedAmount;
    data['invoice_pincode'] = this.invoicePincode;
    data['invoice_delivery_charges'] = this.invoiceDeliveryCharges;
    data['invoice_discount'] = this.invoiceDiscount;
    data['invoice_coupon_code_discount'] = this.invoiceCouponCodeDiscount;
    data['invoice_coupon_id'] = this.invoiceCouponId;
    data['invoice_paying_amount'] = this.invoicePayingAmount;
    data['invoice_change_return'] = this.invoiceChangeReturn;
    data['invoice_payment_mode'] = this.invoicePaymentMode;
    data['invoice_payment_txn'] = this.invoicePaymentTxn;
    data['invoice_generated_by'] = this.invoiceGeneratedBy;
    data['invoice_updated_by'] = this.invoiceUpdatedBy;
    data['invoice_updated_date'] = this.invoiceUpdatedDate;
    data['invoice_from'] = this.invoiceFrom;
    data['invoice_delivery_date'] = this.invoiceDeliveryDate;
    data['invoice_special_instruction'] = this.invoiceSpecialInstruction;
    data['invoice_delivery_boy_id'] = this.invoiceDeliveryBoyId;
    data['invoice_delivery_time_slot_id'] = this.invoiceDeliveryTimeSlotId;
    data['invoice_is_hold'] = this.invoiceIsHold;
    data['invoice_status'] = this.invoiceStatus;
    data['invoice_razorpayOrderId'] = this.invoiceRazorpayOrderId;
    data['invoice_razorpay_status'] = this.invoiceRazorpayStatus;
    data['invoice_razorpay_payment_id'] = this.invoiceRazorpayPaymentId;
    data['invoice_razorpay_signature'] = this.invoiceRazorpaySignature;
    data['invoice_hdfc_payble'] = this.invoiceHdfcPayble;
    data['is_deleted'] = this.isDeleted;
    data['c_date'] = this.cDate;
    data['order_id'] = this.orderId;
    data['order_total'] = this.orderTotal;
    data['bottom_text'] = this.bottomText;
    data['total_item'] = this.totalItem;
    return data;
  }
}

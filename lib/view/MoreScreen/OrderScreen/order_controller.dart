import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/CartModel.dart';
import '../../../Model/orderModel.dart';
import 'package:http/http.dart' as http;

import '../../../Model/repeate_order_model.dart';
import '../../CartScreen/cart_controller.dart';

class OrderCon extends GetxController{
  RepeatOrderModel? repeatOrderModel;
  bool loading=false;
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getUserData();
    getOrderList();
  }

  late String customerId;
  late String customerName;
  late String customerNumber;

  getUserData() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    customerId= preferences.getString('customerId')!;
    customerName=preferences.getString('customerName')!;
    customerNumber=preferences.getString('customerNo')!;

  }

  OrderModel? orderModel;
  getOrderList() async {
    loading=true;
    print("getSavingDays");
    final Map<String, String> formData = {
      'company_id': '2',
      'customer_id':customerId
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/order_list.php"),
      body: formData,
    );
    if (res.statusCode == 200) {
      orderModel=OrderModel.fromJson(json.decode(res.body));
      print("getSavingDays=if");
      print("getSavingDays=if${orderModel?.result}");


      loading =false;
      update();



    }else{
      print("getSavingDays");
    }

  }

  CartModel? cartModel;
  getCart() async {
    loading=true;
    update();
    print("getCart");
    final Map<String, String> formData = {
      'company_id': '2',
      'customer_id': customerId,
      'coupon_code': ''
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/my_cart.php"),
      body: formData,
    );
    if (res.statusCode == 200) {
      cartModel= CartModel.fromJson(json.decode(res.body));
      print("getcart=if");
      print("getcart=if${cartModel?.result}");
      //
      loading =false;

      update();


    }else{
      print("getCart");
    }

  }

  getRepeatOrder(String inv_id) async {
    loading=true;
    print("getSavingDays");
    final Map<String, String> formData = {
      'company_id': '2',
      'customer_id':customerId,
      'invoice_id':inv_id
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/repeat_order.php"),
      body: formData,
    );
    if (res.statusCode == 200) {

      Get.delete<CartCon>();
      print(res.body);
      repeatOrderModel=RepeatOrderModel.fromJson(json.decode(res.body));
      print("getSavingDays=if");
      print("getSavingDays=if${orderModel?.result}");


      loading =false;
      update();



    }else{
      print("getSavingDays");
    }

  }
}


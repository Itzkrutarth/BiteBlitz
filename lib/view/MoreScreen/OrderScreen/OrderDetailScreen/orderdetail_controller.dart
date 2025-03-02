import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Model/CartModel.dart';
import '../../../../Model/orderDetailModel.dart';
import '../../../../Model/orderModel.dart';

class OrderDetailCon extends GetxController{
  bool loading=false;
  int productQuntity=0;

  String inv_id;
  OrderDetailCon(this.inv_id);
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
   // getOrderList();
    await getUserData();
    getOrderDetail(inv_id);

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
      print(res.body);
      cartModel= CartModel.fromJson(json.decode(res.body));
      print("getcart=if");
      print("getcart=if${cartModel?.result}");
      //
      update();
      loading =false;


    }else{
      print("getCart");
    }

  }


  OrderDetailModel? orderDetailModel;
  getOrderDetail(String abc) async {
    loading=true;
    print("getCart");
    final Map<String, String> formData = {
      'company_id': '2',
      'customer_id': customerId,
      'invoice_id':abc
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/order_detail.php"),
      body: formData,
    );
    if (res.statusCode == 200) {
      print(res.body);
      orderDetailModel= OrderDetailModel.fromJson(json.decode(res.body));

      //
      update();
      loading =false;


    }else{
      print("getCart");
    }

  }
}
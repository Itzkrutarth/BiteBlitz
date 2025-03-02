import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/couponmodel.dart';
import '../../Model/orderModel.dart';
import '../../utility/debounce.dart';
import './/Model/CartModel.dart';
import './/Model/add_to_cart_modal.dart';



import './/more/change_password.dart';
import './/colors.dart';
import 'package:http/http.dart' as http;


class CartCon extends GetxController with WidgetsBindingObserver{
  final debounce = Debouncer(milliseconds: 10);

  dynamic argumentDataCart=Get.arguments;

  int productQuntity = 0;
  bool loading=false;



  @override
  void onInit() async{
    loading=true;
    WidgetsBinding.instance.addObserver(this);
    super.onInit();

    await getUserData();
    loading=false;
    getCart();

  }
  @override
  void onClose() {

    WidgetsBinding.instance.removeObserver(this);
    // TODO: implement onClose
    super.onClose();
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


  CartModel? cartModel;
  getCart() async {
    loading=true;
    print("getCart");
    final Map<String, String> formData = {
      'company_id': '2',
      'customer_id': customerId,
      'coupon_code':''
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/my_cart.php"),
      body: formData,
    );
    if (res.statusCode == 200) {
      print(res.body);
     // print("6666666666666666666666666666666666666666666666666666666666666666666666666666666666666");
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


  CouponModel? couponModel;
  getCouponModel() async{
    loading=true;
    update();
    final Map <String,String> formData={
      'company_id':'2',
      'customer_id':customerId
    };

    final res=await http.post(
        Uri.parse("https://foodykart.com/api/coupon_code_list.php"),
        body: formData
    );
    if(res.statusCode==200){
      couponModel=CouponModel.fromJson(json.decode(res.body));
      print("🥹🥹🥹🥹🥹🥹🥹🥹🥹🥹");

      loading=false;
      update();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    debugPrint('HomeView : didChangeAppLifecycleState : $state');
    if (state == AppLifecycleState.resumed) {
      // pullToRefresh();
    }
  }

  // Future<void> pullToRefresh() async {
  //   debounce.run(() {
  //     getCart();
  //   });
  // }



  AddToCartModal? addToCartModal;
  addToCart(String qty,String productId) async {


    // loading=true;
    print("getSubCategorylist");
    final Map<String, String> formData = {
      'company_id': '2',
      'customer_id':customerId,
      'qty':qty,
      'product_id':productId
    };
    print(formData);
    final res = await http.post(
      Uri.parse("https://foodykart.com/api/add_cart.php"),
      body: formData,
    );
    print(formData);
    if (res.statusCode == 200) {
      addToCartModal= AddToCartModal.fromJson(json.decode(res.body));
      print("getSubCategorylist=if");
      print("getSubCategorylist=if${addToCartModal?.result}");
      getCart();
      update();
    }else{
      print("getSubCategorylist");
    }

  }  //++ button

}
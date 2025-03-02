import 'dart:convert';

import 'package:biteblitz/more/change_password.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../Model/LoginWoutOTPModel.dart';
import '../../Model/pointModel.dart';
import './/Model/CartModel.dart';

import './/welcome.dart';
import './/more/refer_earn.dart';

import './/more/change_password.dart';
import './/colors.dart';
import './/more/privacy_policy.dart';
import './/more/contact_us.dart';
import 'package:http/http.dart' as http;

class MoreController extends GetxController{

  TextEditingController show=TextEditingController();
  bool loading=false;
  bool isnotdone=false;


  setString(String id,String name,String number) async {

    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setString('customerId', id);
    preferences.setString('customerName', name);
    preferences.setString('customerNo', number);
  }

  removeUser() async {

    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.remove('customerId');
    preferences.remove('customerName');
    preferences.remove('customerNo');

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
       loading =false;
      update();



    }else{
      print("getCart");
    }

  }


  PointModel? pointModel;
  getPointModel() async{
    loading=true;
    final Map <String,String> formData={
      'company_id':'2',
      'customer_id':customerId
    };

    final res=await http.post(
        Uri.parse("https://foodykart.com/api/my_points.php"),
        body: formData
    );
    if(res.statusCode==200){
      pointModel=PointModel.fromJson(json.decode(res.body));
      print("🥹🥹🥹🥹🥹🥹🥹🥹🥹🥹");

      update();
      loading=false;
    }
  }


  @override
  void onInit() async{
    isnotdone=true;
    super.onInit();
    await getUserData();

    getCart();
    getPointModel();
    isnotdone=false;
  }

}

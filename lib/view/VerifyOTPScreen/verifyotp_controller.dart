import 'dart:convert';

import 'package:biteblitz/Widgets/customnavbar.dart';
import 'package:biteblitz/view/HomeScreen/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/LoginOtpModel.dart';
import 'package:http/http.dart' as http;


class verifyOtpCon extends GetxController{
 // bool loading=false;
  var otpcon=TextEditingController();
  dynamic argumentData=Get.arguments;



@override
  void onInit()async {
    // TODO: implement onInit
    super.onInit();
    await getUserData();
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

LoginOtpModel? loginOtpModel;
getVerifyOtp() async{
  // loading=true;
  print("getCategory");
  final Map<String, String> formData = {
  'customer_mobile':customerNumber,
 'company_id':'2',
  'customer_otp':otpcon.text.trim(),
  'customer_android_token':"",
  'customer_ios_token':""
  };

  final res = await http.post(
    Uri.parse("https://foodykart.com/api/verify_login_otp.php"),
    body: formData,
  );
  print(formData);
  print("====================================${argumentData[0]}===============================");
  print(res.body);
  if (res.statusCode == 200) {
    loginOtpModel= LoginOtpModel.fromJson(json.decode(res.body));
    print("getCategory=if");

    if(loginOtpModel?.status=="1"){
      print("===============RIGHT OTP================");
      Get.to(()=>CustomBottomNavigationBar(0));

    }else{
      print("===============WRONG OTP================");
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text(
            loginOtpModel?.error??"mmmmm")),
      );
      otpcon.text="";
      update();

    }


    // loading =false;
    update();



  }else{
    print("getCategory");

  }

}

}
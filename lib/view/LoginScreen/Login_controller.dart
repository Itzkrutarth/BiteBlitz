import 'dart:convert';

import 'package:biteblitz/Model/LoginWoutOTPModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/LoginModel.dart';
import 'package:http/http.dart' as http;

import '../../Model/LoginOtpModel.dart';
import '../../Widgets/customnavbar.dart';
import '../VerifyOTPScreen/verifyotp_view.dart';

class LoginCon extends GetxController{

  var cust_mob = TextEditingController();
  bool loading=false;
  dynamic argumentData=Get.arguments;
  bool istap=false;

  @override
  void onInit() {
    // TODO: implement onInit

      super.onInit();
     // getUserDetailStatic();
  }
setString(String id,String name,String number) async {

  SharedPreferences preferences=await SharedPreferences.getInstance();
  preferences.setString('customerId', id);
  preferences.setString('customerName', name);
  preferences.setString('customerNo', number);
}

  LoginOtpModel? loginOtpModel;
  getLoginOTP() async{
    print('login called-----------------------[');

    final Map<String, String> formData = {
      'customer_mobile':cust_mob.text.trim(),
      'company_id':'2',
      'customer_password':'',
      'customer_android_token':'',
      'customer_ios_token':''
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/login.php"),
      body: formData,
    );
    print(formData);
    print(res.body);
    if (res.statusCode == 200) {
      loginOtpModel= LoginOtpModel.fromJson(json.decode(res.body));
      if(loginOtpModel?.status== '1'){

       // setString(loginOtpModel?.result?[0].customerId ?? '',loginOtpModel?.result?[0].customerName ?? '',loginOtpModel?.result?[0].customerMobile ?? '');

        Get.to(()=>CustomBottomNavigationBar(0));
       // Get.to(()=> MyVerifyOTP(),arguments: [cust_mob.text.trim()]);
      }


      update();



    }else{
    }

  }

  StaticUserDetailModel? staticUserDetailModel;
  getUserDetailStatic() async{


    final Map<String, String> formData = {
      'customer_mobile':cust_mob.text.trim(),
      'company_id':'2',
      'customer_android_token':'',
      'customer_ios_token':''
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/login_with_otp.php"),
      body: formData,
    );

    if (res.statusCode == 200) {
      staticUserDetailModel= StaticUserDetailModel.fromJson(json.decode(res.body));
        print("----------+++++++++staticUserDetailModel?.result?[0].customerName----------+++++++++");
        if (staticUserDetailModel?.status=="1") {
          setString(staticUserDetailModel?.result?[0].customerId??"", staticUserDetailModel?.result?[0].customerName??"",staticUserDetailModel?.result?[0].customerMobile??"");
            print("${staticUserDetailModel?.result?[0].customerName}---------------------------------------");
                Get.to(()=>CustomBottomNavigationBar(0));
        }
        else{
          setString("11111","New User!!!","1234567890");
          Get.to(()=>CustomBottomNavigationBar(0));

        }





      update();



    }else{
      print("--------------------wrong api--------------------");
    }

  }

}
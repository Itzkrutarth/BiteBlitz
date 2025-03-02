import 'dart:convert';

import 'package:biteblitz/more/change_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:share_plus/share_plus.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



import '../../../Model/referModel.dart';


import './/more/change_password.dart';
import './/colors.dart';

class ReferCon extends GetxController{

  bool loading=false;

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
   await getUserData();
    getReferModel();

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

  ReferModel? referModel;
  getReferModel() async{
    loading=true;
    final Map <String,String> formData={
      'company_id':'2',
      'customer_id':customerId
    };

    final res=await http.post(
        Uri.parse("https://foodykart.com/api/refer_earn.php"),
        body: formData
    );
    if(res.statusCode==200){
      referModel=ReferModel.fromJson(json.decode(res.body));
      print("🥹🥹🥹🥹🥹🥹🥹🥹🥹🥹");

      update();
      loading=false;
    }
  }


}
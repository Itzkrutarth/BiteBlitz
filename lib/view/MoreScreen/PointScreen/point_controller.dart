import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/pointModel.dart';
import './/colors.dart';
import './/view/MoreScreen/more_view.dart';
import 'package:http/http.dart' as http;

class PointCon extends GetxController{

  bool loading=false;

  @override
  void onInit()async {
    // TODO: implement onInit
    super.onInit();
    await getUserData();
    getPointModel();

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




}
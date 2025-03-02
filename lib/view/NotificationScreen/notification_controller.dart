import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/blogModel.dart';
import '../../Model/notificationModel.dart';



class NotificationCon extends GetxController {
  bool loading=false;

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getUserData();
    getNotification();

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

  NotificationModel? notificationModel;
  getNotification() async {
     loading=true;
    print("getSavingDays");
    final Map<String, String> formData = {
      'company_id': '2',
      'customer_id':customerId
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/notification_list.php"),
      body: formData,
    );
    if (res.statusCode == 200) {
      notificationModel=NotificationModel.fromJson(json.decode(res.body));
      print("getSavingDays=if");
      print("getSavingDays=if${notificationModel?.result}");


      loading =false;
      update();



    }else{
      print("getSavingDays");
    }

  }


}
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';



import '../../Model/productmodel.dart';
import './/Model/add_to_cart_modal.dart';
import './/Model/subcategoryfruit.dart';
import './/Model/subcategorygrid.dart';
import './/Model/subcategorylist.dart';
import 'package:http/http.dart' as http;


import './/Model/subcategorymodel.dart';
import './/colors.dart';

class ZoomCon extends GetxController {

  dynamic argumentData=Get.arguments;


  PageController pageController = PageController();
  int currentPage = 0;
  int largeindex = 0;
  bool loading=false;


  String zoom_id;
  ZoomCon(this.zoom_id);



  @override
  void onInit() async{
    super.onInit();
    await getUserData();
    getProduct(zoom_id);
    pageController.addListener(() {

        currentPage = pageController.page!.round();
        update();

    });
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

  void updateMainImage(int index) {

      print('Updating main image to index: $index');
      currentPage = index;
      pageController.jumpToPage(currentPage);
      update();

  }


  ProductModel? productModel;
  getProduct(id) async {
    loading=true;
    print("getProduct");
    final Map<String, String> formData = {
      'company_id': '2',
      'customer_id':customerId,
      'product_id':id
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/product_details.php"),
      body: formData,
    );
    print(res.body);
    print('name-------------------${productModel?.result?[0].productName ?? 'not'}');
    if (res.statusCode == 200) {
      productModel=ProductModel.fromJson(json.decode(res.body));
      print("getProduct=if");
      print("getProduct=if${productModel?.result}");

      loading =false;
      update();


    }else{
      print("getProduct");
    }

  }
}
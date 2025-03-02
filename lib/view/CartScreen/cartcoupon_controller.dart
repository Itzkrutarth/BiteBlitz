import 'dart:convert';

import 'package:biteblitz/Widgets/customnavbar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/CartModel.dart';
import '../../Model/couponmodel.dart';
import 'package:http/http.dart' as http;

import 'cart_view.dart';
class CartCouponCon extends GetxController{
  bool loading=false;



  @override
  void onInit()async {
    print("Start");
    super.onInit();
    await getUserData();
    getCart();
    getCouponModel();

  }
  dynamic argumentData=Get.arguments;

  late String customerId;
  late String customerName;
  late String customerNumber;

  getUserData() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    customerId= preferences.getString('customerId')!;
    customerName=preferences.getString('customerName')!;
    customerNumber=preferences.getString('customerNo')!;

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


      loading=false;
      update();
    }
    else{
      print("2222222222222222222222222222222222222222222222222222222222");
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
      'coupon_code': argumentData[0]
    };
print(formData);

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/my_cart.php"),
      body: formData,
    );
    print(res.body);
    if (res.statusCode == 200) {
      print(res.body);
      cartModel= CartModel.fromJson(json.decode(res.body));


      //

      loading =false;
      update();


    }else{
    }

  }
}
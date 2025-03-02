import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/add_wishlist.dart';
import '../../Model/remove_wishlist.dart';
import './/Model/CartModel.dart';
import './/Model/add_to_cart_modal.dart';
import './/Model/productmodel.dart';
import './/Model/savingdaysmodel.dart';
import './/colors.dart';

class DetailController extends GetxController{

  //dynamic argumentData=Get.arguments;


  String? tempid;

  bool loading=false;
  int productQuntity=0;
  int is_rd_selected=0;
  String PRODUCT_ID="";

  PageController pageController = PageController();
  double currentPage=0;

  String product_id;
  DetailController(this.product_id);

  @override
  void onInit() async{
    super.onInit();
    await getUserData();
   // tempid=argumentData.id;
    PRODUCT_ID=product_id;
    is_rd_selected=int.parse(product_id);
    getCart();

    getProduct(product_id);
    //getProduct(PRODUCT_ID);
    pageController.addListener(() {
      currentPage = pageController.page!;
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


  ProductModel? productModel;
  getProduct(String product_id) async {
    loading=true;
    print("getProduct");
    final Map<String, String> formData = {
      'company_id': '2',
      'customer_id':customerId,
      'product_id':product_id
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

  AddWishlistModel? addWishlistModel;
  getaddwishlist(String wish_id) async {

    loading=true;
    print("getBanner");
    final Map<String, String> formData = {
      'company_id': '2',
      'customer_id':customerId,
      'product_id':wish_id,
    };
    print(formData);
    final res = await http.post(
      Uri.parse("https://foodykart.com/api/wishlist_add.php"),
      body: formData,
    );

    print(res.body);
    if (res.statusCode == 200) {
      addWishlistModel= AddWishlistModel.fromJson(json.decode(res.body));
      getProduct(product_id);

      print("getBanner=if");
      //print("getBanner=if${profileModel?.result}");
      loading =false;

      update();



    }else{
      print("getBanner");
    }

  }

  RemoveWishlistModel? removeWishlistModel;
  getremovewishlist(String wishrem_id) async {

    loading=true;
    print("getBanner");
    final Map<String, String> formData = {
      'company_id': '2',
      'customer_id':customerId,
      'wishlist_id':wishrem_id,
    };
    print(formData);
    final res = await http.post(
      Uri.parse("https://foodykart.com/api/wishlist_remove.php"),
      body: formData,
    );

    print(res.body);
    if (res.statusCode == 200) {
      removeWishlistModel= RemoveWishlistModel.fromJson(json.decode(res.body));
      getProduct(product_id);

      print("getBanner=if");
      //print("getBanner=if${profileModel?.result}");
      loading =false;

      update();



    }else{
      print("getBanner");
    }

  }


  CartModel? cartModel;
  getCart() async {


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
      // loading =false;
      update();


    }else{
      print("getCart");
    }

  }


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
    if (res.statusCode == 200) {
      addToCartModal= AddToCartModal.fromJson(json.decode(res.body));
      print("getSubCategorylist=if");
      print("getSubCategorylist=if${addToCartModal?.result}");
      getProduct(productId);
      update();

    }else{
      print("getSubCategorylist");
    }

  }

}
import 'dart:convert';

import 'package:biteblitz/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/SavingDaysModelProductList.dart';
import '../../Model/add_wishlist.dart';
import '../../Model/remove_wishlist.dart';
import './/Model/add_to_cart_modal.dart';
import './/Model/savingdaysmodel.dart';
import 'package:http/http.dart' as http;

class SavingdaysController extends GetxController {

  bool isWishlistSelected=false;
  bool loading=false;
  String selectedFilter = "";
  int productQuntity=0;

  var offers_id;
   SavingdaysController(this.offers_id);



  @override
  void onInit() async{
    // TODO: implement initState
    super.onInit();
   await getUserData();
    getSavingDaysProductList(offers_id,"");
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


  SavingDaysModelProductList? savingDaysModelProductList;
  getSavingDaysProductList(offers_id,String filter_id) async {
    loading=true;
    print("getSavingDays9999${offers_id}");
    final Map<String, String> formData = {
      'company_id': '2',
      'customer_id':customerId,
      'offetr_id':offers_id,
      'filter_by':filter_id

    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/banner_product_list.php"),
      body: formData,
    );
    if (res.statusCode == 200) {
      savingDaysModelProductList=SavingDaysModelProductList.fromJson(json.decode(res.body));
      print("getSavingDays=if");
      print("getSavingDays=if${savingDaysModelProductList?.result}");


     update();
      loading=false;

      print('loading-----------------------------------[$loading');

    }else{
      print("getSavingDays");
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
      getSavingDays();
      print("getSubCategorylist=if");
      print("getSubCategorylist=if${addToCartModal?.result}");
     // getSavingDaysProductList(offers_id);
      update();


    }else{
      print("getSubCategorylist");
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
      getSavingDaysProductList(offers_id, "");

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
      getSavingDaysProductList(offers_id,"");

      print("getBanner=if");
      //print("getBanner=if${profileModel?.result}");
      loading =false;

      update();



    }else{
      print("getBanner");
    }

  }

  SavingDaysModel? savingDaysModel;
  getSavingDays() async {
    loading=true;
    print("getSavingDays");
    final Map<String, String> formData = {
      'company_id': '2',
      'customer_id':customerId,

    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/offer_product.php"),
      body: formData,
    );
    if (res.statusCode == 200) {
      savingDaysModel=SavingDaysModel.fromJson(json.decode(res.body));
      print("getSavingDays=if");
      print("getSavingDays=if${savingDaysModel?.result}");
      print("getSavingDays=?????????${savingDaysModel?.result}");


      loading =false;
      update();



    }else{
      print("getSavingDays");
    }

  }




}
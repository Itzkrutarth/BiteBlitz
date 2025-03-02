import 'dart:convert';

import 'package:biteblitz/Model/SearchModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/add_wishlist.dart';
import './/Model/add_to_cart_modal.dart';
import './/Model/subcategorymodel.dart';



import './/more/change_password.dart';
import './/colors.dart';
import 'package:http/http.dart' as http;


class SearchCon extends GetxController{

//TextEditingController searchProduct=TextEditingController();
  var searchProduct = TextEditingController();
  int productQuntity=0;


  @override
  void onInit() async{
    super.onInit();
   await getUserData();

    /*getSearchModel();*/
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

   SearchModel? searchModel;
  getSearchModel(String text) async {
    // loading=true;
    print("getSearchModel");
    final Map<String, String> formData = {
      'company_id': '2',
      'customer_id':customerId,
      'search_text': text
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/search.php"),
      body: formData,
    );
    if (res.statusCode == 200) {
      searchModel= SearchModel.fromJson(json.decode(res.body));
      print("getSearchModel=if");
      print("getSearchModel=if${SearchModel()?.result}");

      update();


    }else{
      print("getSearchModel");
    }

  }

  //
  // AddWishlistModel? addWishlistModel;
  // getaddwishlist(String wish_id) async {
  //
  //
  //   print("getBanner");
  //   final Map<String, String> formData = {
  //     'company_id': '2',

  //     'product_id':wish_id,
  //   };
  //   print(formData);
  //   final res = await http.post(
  //     Uri.parse("https://foodykart.com/api/wishlist_add.php"),
  //     body: formData,
  //   );
  //
  //   print(res.body);
  //   if (res.statusCode == 200) {
  //     addWishlistModel= AddWishlistModel.fromJson(json.decode(res.body));
  //     getSearchModel(searchProduct.text);
  //
  //     print("getBanner=if");
  //     //print("getBanner=if${profileModel?.result}");
  //
  //     update();
  //
  //
  //
  //   }else{
  //     print("getBanner");
  //   }
  //
  // }



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
      update();
    }else{
      print("getSubCategorylist");
    }

  }

}

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';




import '../../Model/add_wishlist.dart';
import '../../Model/categorymodel.dart';
import '../../Model/remove_wishlist.dart';
import './/Model/add_to_cart_modal.dart';
import './/Model/subcategoryfruit.dart';
import './/Model/subcategorygrid.dart';
import './/Model/subcategorylist.dart';
import 'package:http/http.dart' as http;


import './/Model/subcategorymodel.dart';
import './/colors.dart';




class AppleCon extends GetxController {

 dynamic argumentData=Get.arguments;





  bool isTapped = false;
  bool isWishlistSelected = false;
  bool loading = false;


  double originalValue = 100.0;
  double newValue = 75.0;


  String? color;



  int productQuntity = 0;
  String wish = "";

  var size = "";

   var subcat_id;

 AppleCon (this.subcat_id);
  @override

  void onInit() async {
    await getUserData();
      getSubCategoryFruit(subcat_id);
  }

 String selectedFilter = "";
  var subcat_id_for_filter="";

  // CategoryModel? categoryModel;
  // getCategory() async {
  //   // loading=true;
  //   print("getCategory");
  //   final Map<String, String> formData = {
  //     'company_id': '2',
  //   };
  //
  //   final res = await http.post(
  //     Uri.parse("https://foodykart.com/api/category_list.php"),
  //     body: formData,
  //   );
  //   if (res.statusCode == 200) {
  //     categoryModel= CategoryModel.fromJson(json.decode(res.body));
  //     print("getCategory=if");
  //     print("getCategory=if${categoryModel?.result}");
  //
  //     // loading =false;
  //     update();
  //
  //   }else{
  //     print("getCategory");
  //   }
  //
  // }


  // SubCategoryListModel? subCategoryListModel;
  // getSubCategoryList() async {
  //   print("getSubCategorylist");
  //   final Map<String, String> formData = {
  //     'company_id': '2',
  //   };
  //
  //   final res = await http.post(
  //     Uri.parse("https://foodykart.com/api/subcategory_is_in_home.php"),
  //     body: formData,
  //   );
  //   if (res.statusCode == 200) {
  //     subCategoryListModel =
  //         SubCategoryListModel.fromJson(json.decode(res.body));
  //     print("getSubCategorylist=if");
  //     print("getSubCategorylist=if${subCategoryListModel?.result}");
  //
  //     update();
  //
  //   } else {
  //     print("getSubCategorylist");
  //   }
  // }

 late String customerId;
 late String customerName;
 late String customerNumber;

 getUserData() async {
   SharedPreferences preferences=await SharedPreferences.getInstance();
   customerId= preferences.getString('customerId')!;
   customerName=preferences.getString('customerName')!;
   customerNumber=preferences.getString('customerNo')!;

 }


 AddToCartModal? addToCartModal;
  addToCart(String qty, String productId) async {
    // loading=true;
    print("getSubCategorylist");
    final Map<String, String> formData = {
      'company_id': '2',
      'customer_id': customerId,
      'qty': qty,
      'product_id': productId
    };
    print(formData);
    final res = await http.post(
      Uri.parse("https://foodykart.com/api/add_cart.php"),
      body: formData,
    );
    if (res.statusCode == 200) {
      addToCartModal = AddToCartModal.fromJson(json.decode(res.body));
     // getSubCategoryGrid(argumentData.grid_id,"");
      print("getSubCategorylist=if");
      print("getSubCategorylist=if${addToCartModal?.result}");
      update();
    } else {
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
     getSubCategoryGrid(subCategoryFruitModel?.result?[0].subcategoryId ?? '',subCategoryFruitModel?.result?[0].subcategoryCatId ?? '',"");

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
     getSubCategoryGrid(subCategoryFruitModel?.result?[0].subcategoryId ?? '',subCategoryFruitModel?.result?[0].subcategoryCatId ?? '',"");

     print("getBanner=if");
     //print("getBanner=if${profileModel?.result}");
     loading =false;

     update();



   }else{
     print("getBanner");
   }

 }

  // SubCategoryModel? subcategoryModel;
  // getSubCategory() async {
  //   // loading=true;
  //   print("getSubCategory");
  //   final Map<String, String> formData = {
  //     'company_id': '2',
  //   };
  //
  //   final res = await http.post(
  //     Uri.parse("https://foodykart.com/api/subcategory_is_in_home.php"),
  //     body: formData,
  //   );
  //   if (res.statusCode == 200) {
  //     subcategoryModel = SubCategoryModel.fromJson(json.decode(res.body));
  //     print("getSubCategory=if");
  //     print("getSubCategory=if${subcategoryModel?.result}");
  //     // loading =false;
  //     update();
  //
  //   } else {
  //     print("getSubCategory");
  //   }
  // }

  SubCategoryFruitModel? subCategoryFruitModel;
  getSubCategoryFruit(String Id) async {
    // loading=true;
    print("getSubCategory");
    final Map<String, String> formData = {
      'company_id': '2',
      'subcategory_cat_id':Id,//id
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/subcategory_list.php"),
      body: formData,
    );
    print(formData);
    print(res.body);
    if (res.statusCode == 200) {
      subCategoryFruitModel =
          SubCategoryFruitModel.fromJson(json.decode(res.body));
      print("getSubCategory=if");
      print("getSubCategory=if${subCategoryFruitModel?.result}");

      getSubCategoryGrid(subCategoryFruitModel?.result?[0].subcategoryId ?? '',subCategoryFruitModel?.result?[0].subcategoryCatId ?? '',"");
      color = subCategoryFruitModel?.result?[0].subcategoryId ?? '';
      // loading =false;
      update();


    } else {
      print("getSubCategory");
    }
  }

  SubCategoryGridModel? subCategoryGridModel;
  getSubCategoryGrid(String id,String catid,String filter_id) async {
    print("${id}>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    print("${catid}--------------------------------------------------");
    loading=true;
    print("getSubCategorygrid");
    final Map<String, String> formData = {
      'company_id': '2',
      'sub_category_id': id,
      'customer_id': customerId,
      'category_id':catid,
      'filter_by':filter_id,
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/product_list.php"),
      body: formData,
    );
    print(res.body);
    if (res.statusCode == 200) {
      subCategoryGridModel =
          SubCategoryGridModel.fromJson(json.decode(res.body));
      print("getSubCategorygrid=if");
      print("getSubCategorygrid=if${subCategoryGridModel?.result}");
      Future.delayed(const Duration(seconds: 1), () {
         loading =false;
        update();



      });
    } else {
      print("getSubCategorygrid");
    }
  }
}
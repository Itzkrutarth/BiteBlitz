import 'dart:convert';
import 'dart:ffi';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/CartModel.dart';
import '../../Model/HomeOfferModel.dart';
import '../../Model/add_to_cart_modal.dart';
import '../../Model/add_wishlist.dart';
import '../../Model/bannermodel.dart';
import '../../Model/categorymodel.dart';
import '../../Model/productmodel.dart';
import '../../Model/profilemodel.dart';
import '../../Model/remove_wishlist.dart';
import '../../Model/savingdaysmodel.dart';
import '../../Model/subcategoryfruit.dart';
import '../../Model/subcategorygrid.dart';
import '../../Model/subcategorymodel.dart';
import 'package:http/http.dart' as http;

import '../../notificationservice/local_notification_service.dart';

class HomeController extends GetxController{
  var _myformkey = GlobalKey<FormState>();
  bool loading = false;
  int _currentIndex = 0;



  String tempp="";



  List data = [];
  List banner=[];
  List subcat=[];

  int productQuntity=0;


  HomeController(offer_id,offer_title);



 late String customerId;
  late String customerName="";
  late String customerNumber;

  getUserData() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    customerId= preferences.getString('customerId')!;
    customerName=preferences.getString('customerName')!;
    customerNumber=preferences.getString('customerNo')!;

  }



  @override
  void onInit() async {
    loading=true;
    super.onInit();




  await  getUserData();

    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method
    FirebaseMessaging.instance.getInitialMessage().then((message){
      print("FirebaseMessaging.instance.getInitialMessage");
      if(message!= null){
      }});

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
          (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);

        }
      },
    );


    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );

    loading=false;
    getBanner();
    getProfile();
    getCategory();
    getSubCategory();
    getHomeOffer();
    getSavingDays();

  }


  BannerModel? bannerModel;
  getBanner() async {

    loading=true;
    print("getBanner");
    final Map<String, String> formData = {
      'company_id': '2',
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/banner.php"),
      body: formData,
    );
    if (res.statusCode == 200) {
      bannerModel= BannerModel.fromJson(json.decode(res.body));
      print("getBanner=if");
      print("getBanner=if${bannerModel?.result}");
      // loading =false;

      update();



    }else{
      print("getBanner");
    }

  }

  ProfileModel? profileModel;
  getProfile() async {

   // loading=true;
    print("getBanner");
    final Map<String, String> formData = {
      'company_id': '2',
      'customer_mobile':customerNumber
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/my_profile.php"),
      body: formData,
    );
    if (res.statusCode == 200) {
      profileModel= ProfileModel.fromJson(json.decode(res.body));

      print("getBanner=if");
      print("getBanner=if${profileModel?.result}");
      //loading =false;

      update();



    }else{
      print("getBanner");
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
      getSavingDays();

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
      getSavingDays();

      print("getBanner=if");
      //print("getBanner=if${profileModel?.result}");
      loading =false;

      update();



    }else{
      print("getBanner");
    }

  }



  CategoryModel? categoryModel;
  getCategory() async{
    // loading=true;
    print("getCategory");
    final Map<String, String> formData = {
      'company_id': '2',
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/category_list.php"),
      body: formData,
    );
    if (res.statusCode == 200) {
      categoryModel= CategoryModel.fromJson(json.decode(res.body));
      print("getCategory=if");
      print("getCategory=if${categoryModel?.result}");

      // loading =false;
      update();



    }else{
      print("getCategory");
    }

  }

  SubCategoryModel? subcategoryModel;
  getSubCategory() async {


    // loading=true;
    print("getSubCategory");
    final Map<String, String> formData = {
      'company_id': '2',
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/subcategory_is_in_home.php"),
      body: formData,
    );
    if (res.statusCode == 200) {
      subcategoryModel= SubCategoryModel.fromJson(json.decode(res.body));
      print("getSubCategory=if");
      print("getSubCategory=if${subcategoryModel?.result}");
      // loading =false;
      update();


    }else{
      print("getSubCategory");
    }

  }

  HomeOffer? homeOfferModel;
  getHomeOffer() async {
    // loading=true;
    print("getHomeOffer");
    final Map<String, String> formData = {
      'company_id': '2',
      'customer_id':customerId,
      'offetr_id':'28'
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/offer_product.php"),
      body: formData,
    );
    if (res.statusCode == 200) {
      homeOfferModel= HomeOffer.fromJson(json.decode(res.body));
      print("getHomeOffer=if");
      print("getHomeOffer=if${homeOfferModel?.result}");

      // loading =false;
      update();



    }else{
      print("getHomeOffer");
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

// SubCategoryFruitModel? subCategoryFruitModel;
  // getSubCategoryFruit() async {
  //
  //
  //   // loading=true;
  //   print("getSubCategory");
  //   final Map<String, String> formData = {
  //     'company_id': '2',
  //     'sub'
  //   };
  //
  //   final res = await http.post(
  //     Uri.parse("https://foodykart.com/api/subcategory_list.php"),
  //     body: formData,
  //   );
  //   if (res.statusCode == 200) {
  //     subCategoryFruitModel= SubCategoryFruitModel.fromJson(json.decode(res.body));
  //     print("getSubCategory=if");
  //     print("getSubCategory=if${subCategoryFruitModel?.result}");
  //     // loading =false;
  //     setState(() {
  //
  //     });
  //
  //   }else{
  //     print("getSubCategory");
  //   }
  //
  // }

  SubCategoryGridModel? subCategoryGridModel;
  getSubCategoryGrid(String id) async {
    //loading=true;
    print("getSubCategorygrid");
    final Map<String, String> formData = {
      'company_id': '2',
      'sub_category_id': id,
      'customer_id': customerId,
      'category_id':'',
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
        // loading =false;
        update();
        // int productQuantity= int.parse(subCategoryGridModel?.result?[index].productQty??"");


      });
    } else {
      print("getSubCategorygrid");
    }
  }

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

      getSubCategoryGrid(subCategoryFruitModel?.result?[0].subcategoryId ?? '',);
      //color = subCategoryFruitModel?.result?[0].subcategoryId ?? '';
      // loading =false;
      update();


    } else {
      print("getSubCategory");
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
     // getSavingDays();
      update();

    }else{
      print("getSubCategorylist");
    }

  }
}
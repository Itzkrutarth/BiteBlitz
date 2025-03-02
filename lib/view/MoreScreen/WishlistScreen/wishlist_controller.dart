import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/add_to_cart_modal.dart';
import '../../../Model/remove_wishlist.dart';
import '../../../Model/wishlistModel.dart';
import 'package:http/http.dart' as http;
class WishlistCon extends GetxController{

  bool loading=false;
  int productQuntity=0;
  @override
  void onInit()async {
    // TODO: implement onInit
    super.onInit();
    await getUserData();
    getWishListModel();

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

  WishListModel? wishListModel;
  getWishListModel() async{
    loading=true;
    final Map <String,String> formData={
      'company_id':'2',
      'customer_id':customerId
    };

    final res=await http.post(
        Uri.parse("https://foodykart.com/api/wishlist.php"),
        body: formData
    );
    if(res.statusCode==200){
      wishListModel=WishListModel.fromJson(json.decode(res.body));
      print("🥹🥹🥹🥹🥹🥹🥹🥹🥹🥹");

      update();
      loading=false;
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

      getWishListModel();


      print("getBanner=if");
      //print("getBanner=if${profileModel?.result}");
      loading =false;

      update();



    }else{
      print("getBanner");
    }

  }

}



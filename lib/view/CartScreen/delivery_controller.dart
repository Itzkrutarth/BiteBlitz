import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/CartModel.dart';
import '../../Model/citymodel.dart';
import '../../Model/deliveryslotModel.dart';
import '../../Model/profilemodel.dart';
import 'package:http/http.dart' as http;


class DeliveryController extends GetxController{







  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getUserData();
    getCity();
    getProfile();
    getCart();
    getDeliverySlot();
  }

  List<DeliveryController> filteredCities = [];

  String? slotval;
  TextEditingController slotCon = TextEditingController();
  TextEditingController searchCity = TextEditingController();
  TextEditingController pslot = TextEditingController();
  TextEditingController pname = TextEditingController();
  TextEditingController pemail = TextEditingController();
  TextEditingController paddress = TextEditingController();
  TextEditingController ppin = TextEditingController();
  TextEditingController pdob = TextEditingController();
  TextEditingController pcity = TextEditingController();
  var pgen = TextEditingController();

  var selectedGender;
  var selectedPaymentMode;
  List<CityData> dataList=[];
  RxBool isLoading=false.obs;
  List SearchListResult=[];
  bool loading=false;
  TextEditingController citySearchCon = TextEditingController();
  String? cityId;



  CityModel? cityModel;
  getCity() async {

    //loading=true;
    print("getBanner");
    final Map<String, String> formData = {
      'company_id': '2',
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/city_list.php"),
      body: formData,
    );
    if (res.statusCode == 200) {
      cityModel= CityModel.fromJson(json.decode(res.body));
      print("getBanner=if");
      dataList.assignAll(cityModel?.result as List<CityData>);
      // print("getBanner=if${CityModel?.result}");
      // loading =false;

      update();



    }else{
      print("getBanner");
    }

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


  DeliverySlotModel? deliverySlotModel;
  getDeliverySlot() async {

    //loading=true;
    final Map<String, String> formData = {
      'company_id': '2',
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/delivery_time.php"),
      body: formData,
    );
    if (res.statusCode == 200) {
      deliverySlotModel= DeliverySlotModel.fromJson(json.decode(res.body));
      print("getBanner=if");
      // print("getBanner=if${CityModel?.result}");
      // loading =false;

      update();



    }else{
      print("getBanner");
    }

  }

  filterCity(String query){

    isLoading.value=true;
    SearchListResult= dataList.where((city) =>
        (city.cityName ?? '').toLowerCase().contains(query.toLowerCase())
    ).toSet().toList();


    isLoading.value=false;
    update();
  }

  ProfileModel? profileModel;
  getProfile() async {

    loading=true;
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
      pname.text=profileModel?.result?[0].customerName??"";
      pemail.text=profileModel?.result?[0].customerEmail ??"";
      pdob.text=profileModel?.result?[0].customerDob ??"";
      paddress.text=profileModel?.result?[0].customerAddress ??"";
      ppin.text=profileModel?.result?[0].customerPincode ??"";
      pcity.text=profileModel?.result?[0].cityName ??"";
      selectedGender=profileModel?.result?[0].customerGander??"";
      print("getBanner=if");
      print("getBanner=if${profileModel?.result}");
      loading =false;

      update();



    }else{
      print("getBanner");
    }

  }

  CartModel? cartModel;
  getCart() async {
    loading=true;
    print("getCart");
    final Map<String, String> formData = {
      'company_id': '2',
      'customer_id': customerId,
      'coupon_code':''
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/my_cart.php"),
      body: formData,
    );
    if (res.statusCode == 200) {
      print(res.body);
      // print("6666666666666666666666666666666666666666666666666666666666666666666666666666666666666");
      cartModel= CartModel.fromJson(json.decode(res.body));
      print("getcart=if");
      print("getcart=if${cartModel?.result}");
      //
      update();
      loading =false;


    }else{
      print("getCart");
    }

  }


  String? cityval;

  DateTime dateTime = DateTime.now();

  showDatePickerFun() {

    showDatePicker(context: Get.context!,
      firstDate: DateTime(1900),
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
    ).
    then((value){
      dateTime=value!;
      update();

    }
    );
  }


}
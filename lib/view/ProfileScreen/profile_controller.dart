import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:biteblitz/Model/updateProfileModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';



import '../../Model/bannermodel.dart';
import '../../Model/citymodel.dart';
import '../../Model/profilemodel.dart';
import './/welcome.dart';

import './/more/change_password.dart';
import './/colors.dart';
import 'package:http/http.dart' as http;

class ProfileCon extends GetxController{
  var select_date="";
RxBool isLoading=false.obs;

  List<CityData> dataList=[];
  List SearchListResult=[];
  @override
  void onInit() async{
 isLoading=true.obs;

    // TODO: implement onInit
    super.onInit();
    await getUserData();
    getProfile();
    getCity();
 isLoading=false.obs;




  }

  TextEditingController citySearchCon = TextEditingController();


  TextEditingController pname = TextEditingController();
  TextEditingController pemail = TextEditingController();
  TextEditingController paddress = TextEditingController();
  TextEditingController ppin = TextEditingController();
  TextEditingController pdob = TextEditingController();
  TextEditingController pcity = TextEditingController();
  List<String> cities=[];

String? cityId;


  ImagePicker picker= ImagePicker();
  XFile? imagepath;

  Future<void> _pickImage(ImageSource source)async{
    XFile? selected = await ImagePicker().pickImage(source: source);

    imagepath=selected;
    update();

  }
  var selectedGender;

  late String customerId;
  late String customerName;
  late String customerNumber;


  getUserData() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    customerId= preferences.getString('customerId')!;
    customerName=preferences.getString('customerName')!;
    customerNumber=preferences.getString('customerNo')!;

    print("Number is ${customerNumber}");

  }



  CityModel? cityModel;
  getCity() async {
    isLoading.value=true;
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

      isLoading.value=false;
      cityModel= CityModel.fromJson(json.decode(res.body));
      dataList.assignAll(cityModel?.result as List<CityData>);

      //print(json.decode(res.body));
      cityId=cityModel?.result?[0].cityId ?? '';



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

    isLoading=true.obs;
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
      if(profileModel?.result?[0].customerGander == 'Male'){

        selectedGender='1';
      } else{

        selectedGender='2';
      }
      print('selected gender-----------------------------$selectedGender');
      print("getBanner=if");
      print("getBanner=if${profileModel?.result}");
      isLoading=false.obs;

      update();



    }else{
      print("getBanner");
    }

  }


  UpdateProfileModel? updateProfileModel;
  getUpdateProfile() async {
   /* select_date =DateFormat('yyyy-MM-dd').format(dateTime);
    pdob.text=select_date;*/
    isLoading=true.obs;
    print("getBanner");
    final Map<String, String> formData = {
    'customer_mobile':customerNumber,
    'customer_name':pname.text.trim(),
    'customer_email':pemail.text.trim(),
    'customer_address':paddress.text.trim(),
    'customer_pincode':ppin.text.trim(),
    'customer_city':cityId ?? '',
    'customer_dob':pdob.text.trim(),
    'customer_gander':selectedGender,
    'company_id':'2',
    'customer_id':customerId
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/update_profile.php"),
      body: formData,
    );
    print(formData);

    if (res.statusCode == 200) {
      print(res.body);
      updateProfileModel= UpdateProfileModel.fromJson(json.decode(res.body));

      print("getBanner=if");
      print("getBanner=if${profileModel?.result}");
      isLoading=false.obs;


      update();



    }else{

      print("getBanner");
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
     /* select_date=dateTime as String;*/
      select_date =DateFormat('yyyy-MM-dd').format(dateTime);
      pdob.text=select_date;
      print(pdob.text);
      update();

    }
    );
  }

}


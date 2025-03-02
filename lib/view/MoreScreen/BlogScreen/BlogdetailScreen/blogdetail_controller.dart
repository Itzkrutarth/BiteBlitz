import 'package:get/get.dart';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

import '../../../../Model/blogdetailModel.dart';
import './/Model/blogModel.dart';
import './/colors.dart';
import 'blogdetail_controller.dart';

class BlogDetailCon extends GetxController{


 bool loading=false;


  String id;
  BlogDetailCon(this.id);


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBlogDetail(id);


  }

  BlogDetailModel? blogDetailModel;
  getBlogDetail(String blogid) async {

    loading=true;
    print("getBanner");
    final Map<String, String> formData = {
      'company_id': '2',
      'blog_id':blogid
    };

    final res = await http.post(
      Uri.parse("https://foodykart.com/api/blog_detail.php"),
      body: formData,
    );
    if (res.statusCode == 200) {
      print("[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]");
      blogDetailModel= BlogDetailModel.fromJson(json.decode(res.body));
      print("getBanner=if");

      loading =false;

      update();



    }else{
      print("getBanner");
    }

  }


  BlogModel? blogModel;
  getBlogModel() async{
    loading=true;
    final Map <String,String> formData={
      'company_id':'2'
    };

    final res=await http.post(
        Uri.parse("https://foodykart.com/api/blog_list.php"),
        body: formData
    );
    if(res.statusCode==200){
      blogModel=BlogModel.fromJson(json.decode(res.body));

      update();
      loading=false;
    }
  }
}


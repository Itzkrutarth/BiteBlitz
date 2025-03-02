import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

import '../../../Model/blogModel.dart';



class BlogCon extends GetxController {
  bool loading=false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBlogModel();
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
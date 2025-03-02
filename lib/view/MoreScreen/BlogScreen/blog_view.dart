import 'dart:convert';
import 'dart:ui';

import 'package:biteblitz/view/MoreScreen/BlogScreen/BlogdetailScreen/blogdetail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

import '../../../Model/blogModel.dart';
import '../../../colors.dart';
import 'blog_controller.dart';

class MyBlog extends StatelessWidget {
  const  MyBlog({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));

    return GetBuilder(
      init: BlogCon(),
      builder: (BlogCon controller) {
        return Scaffold(
          body:controller.loading==true?Center(child: SpinKitHourGlass(color: primaryColor,size: 50)):
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/7,
                width: double.infinity,
                color: primaryColor,
                child: Stack(
                    children:[
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMore()));
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 85, bottom: 14,right: 80),
                            child: Icon(Icons.arrow_back,size: 25,color: Colors.white,)
                        ),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child:
                        Padding(
                          padding: const EdgeInsets.only(left: 0, top: 80, bottom: 14),
                          child: Text("Blog List",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
                        ),
                      ),]
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 8,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index){
                      return GestureDetector(
                        onTap: (){
                          Get.to(()=>MyBlogDetail(id: controller.blogModel?.result?[index].blogId??"",));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height/3,
                          margin: const EdgeInsets.fromLTRB(10,5,10,5),
                          child: Column(
                            children: [
                              Container(

                                  height: MediaQuery.of(context).size.height/4,
                                  width: double.infinity,
                                  child: Image.network(controller.blogModel?.result?[index].blogImage??"",fit: BoxFit.fitWidth,)),
                              Container(
                                color: Colors.grey.shade200,
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height/12,
                                padding: EdgeInsets.only(left: 10),
                                //height: MediaQuery.of(context).size.height/,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(controller.blogModel?.result?[index].blogTitle??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                    Text(controller.blogModel?.result?[index].blogDate??"",style: TextStyle(color: Colors.grey)),

                                  ],
                                ),
                              ),
                              //SizedBox(height: 5,)


                            ],
                          ),
                        ),
                      );



                    }),
              )
            ],


          ),





        );
      }
    );
  }
}

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

import './/Model/blogModel.dart';
import './/colors.dart';
import 'blogdetail_controller.dart';

class MyBlogDetail extends StatelessWidget {
  final String id;
  const  MyBlogDetail({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));

    return GetBuilder(
        init: BlogDetailCon(id),
        builder: (BlogDetailCon controller) {
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
                            child: Text("Blog Detail",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
                          ),
                        ),]
                  ),
                ),
               Container(
                 child: Column(
                   children: [
                     Container(

                         height: MediaQuery.of(context).size.height/4,
                         width: double.infinity,
                         child: Image.network(controller.blogDetailModel?.result?[0].blogImage??"",fit: BoxFit.fitWidth,)





                     ),

                     Padding(
                       padding: const EdgeInsets.only(top: 15.0,left: 10),
                       child: Align(
                         alignment: Alignment.centerLeft,
                         child: Text(controller.blogDetailModel?.result?[0].blogTitle??"",
                           style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                       ),
                     ),
                     Padding(padding: EdgeInsets.all(10),
                     child: Text(controller.blogDetailModel?.result?[0].blogDescription??"",style: TextStyle(fontSize: 18,),))
                   ],
                 ),
               )
              ],


            ),





          );
        }
    );
  }
}

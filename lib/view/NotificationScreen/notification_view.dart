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
import 'notification_controller.dart';

class MyNoti extends StatelessWidget {

  const MyNoti({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));


    return GetBuilder(
        init: NotificationCon(),
          builder: (NotificationCon controller) {
            return Scaffold(
              body: controller.loading == true ? Center(
                  child: SpinKitHourGlass(color: primaryColor, size: 50)) :
              Column(
                children: [
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 7,
                    width: double.infinity,
                    color: primaryColor,
                    child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                              //Navigator.pop(context);
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMore()));
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 85, bottom: 14, right: 80),
                                child: Icon(
                                  Icons.arrow_back, size: 25, color: Colors
                                    .white,)
                            ),
                          ),

                          Align(
                            alignment: Alignment.center,
                            child:
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, top: 80, bottom: 14),
                              child: Text("Notification List", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.white),),
                            ),
                          ),
                        ]
                    ),
                  ),
                  Expanded(
                    child: Container(

                      height: MediaQuery.of(context).size.height,

                      padding: EdgeInsets.all(10),

                      decoration: BoxDecoration(color: Colors.grey.shade300),
                      child: ListView.builder(
                     scrollDirection: Axis.vertical,
                     padding: EdgeInsets.zero,
                     itemCount: controller.notificationModel?.result?.length,
                     itemBuilder:(BuildContext context,int index){
                       return Container(
                          margin: EdgeInsets.only(bottom: 5),
                     padding: EdgeInsets.all(10),
                     decoration: BoxDecoration( color: Colors.white,
                         borderRadius: BorderRadius.all(Radius.circular(15))),
                     // height: MediaQuery.of(context).size.height/6,
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(bottom: 8.0),
                               child: Text(controller.notificationModel?.result?[index].notificationTitle??"",style: TextStyle(fontWeight: FontWeight.bold),),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(bottom: 8.0),
                               child: Text(controller.notificationModel?.result?[index].notificationDescription??""),
                             ),
                             Align(
                                 alignment: Alignment.bottomRight,
                                 child: Text(controller.notificationModel?.result?[index].cDate??"")),

                           ],
                         ),
                       );
                        
                      }),
                    ),
                  )
                  
                  

                ],


              ),


            );
          }
      );
  }
}



import 'package:biteblitz/view/MoreScreen/PointScreen/point_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import './/colors.dart';
import './/view/MoreScreen/more_view.dart';
import 'package:http/http.dart' as http;

class MyPoint extends StatelessWidget {
  const MyPoint({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));
    return  GetBuilder(
        init: PointCon(),
        builder: (PointCon controller) {
          return Scaffold(
            body:controller.loading==true?Center(child: SpinKitHourGlass(color: primaryColor,size: 50)):
            SafeArea(
              child: 
              Column(
                children:[
                  Column(
                  children: [
                    Container(

                      height: MediaQuery.of(context).size.height/14.5,
                      decoration: BoxDecoration( color: primaryColor),
                      width: double.infinity,
                     
                      child: Stack(
                          children:[
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMore()));
                              },
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 14,right: 80),
                                  child: Icon(Icons.arrow_back,size: 25,color: Colors.white,)
                              ),
                            ),
                
                            Align(
                              alignment: Alignment.center,
                              child:
                              Padding(
                                padding: const EdgeInsets.only(left: 0, top: 15, bottom: 14),
                                child: Text("My Points",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
                              ),
                            ),]
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      //color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Available Points",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                          Text(controller.pointModel?.customerPoint??"",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 16),),],
                      ),
                    ),
                  ],
                ),
                  Expanded(
                    child: Container(

                      decoration: BoxDecoration(color: Colors.grey.shade200),
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      child: ListView.builder(itemCount: controller.pointModel!.result!.length,scrollDirection: Axis.vertical,itemBuilder: (context , int index){
                        return Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height/9,
                              width: double.infinity,
                              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width/7,
                                      child: Icon(controller.pointModel?.result?[index].customerPointType=="1"?Icons.arrow_upward:Icons.arrow_downward,size: 35,
                                          color:controller.pointModel?.result?[index].customerPointType=="1"? Colors.green.shade800:Colors.red )),
                                  Container(
                                    width: MediaQuery.of(context).size.width/1.6,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          // color: Colors.brown,
                                         // padding: EdgeInsets.all(5),

                                          child: Text(controller.pointModel?.result?[index].customerPointDetail??"",maxLines: 2,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                                        ),
                                        Text(controller.pointModel?.result?[index].cDate??"",style: TextStyle(color: Colors.grey),),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width/6,
                                      alignment: Alignment.centerRight,
                                      padding: EdgeInsets.only(right: 10),
                                      //color: Colors.blue,
                                      child: Text(controller.pointModel?.result?[index].customerPointType=="1"?"+${controller.pointModel?.result?[index].customerAvailablePoint??""}":"-${controller.pointModel?.result?[index].customerAvailablePoint??""}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,

                                            color:controller.pointModel?.result?[index].customerPointType=="1"? Colors.green.shade800:Colors.red),),),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,)
                          ],
                        );
                      }),
                    ),
                  )
                ]
              ),
            ),
          );
        }
    );
  }
}
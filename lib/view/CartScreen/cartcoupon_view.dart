import 'package:biteblitz/Widgets/customnavbar.dart';
import 'package:biteblitz/view/CartScreen/cart_view.dart';
import 'package:biteblitz/view/CartScreen/cartcoupon_controller.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';


import '../../colors.dart';

class MyCartCoupon extends StatelessWidget {
  const MyCartCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));

    return GetBuilder(
        init: CartCouponCon(),
        builder: (CartCouponCon controller) {
          return Scaffold(
            body:
            Container(
              color: Colors.grey.shade200,
              child: Column(
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
                             Get.back();// Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMore()));
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 85, bottom: 14, right: 80),
                                child: Icon(
                                  Icons.arrow_back, size: 25, color: Colors.white,)
                            ),
                          ),

                          Align(
                            alignment: Alignment.center,
                            child:
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, top: 80, bottom: 14),
                              child: Text("Offer", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.white),),
                            ),
                          ),
                        ]
                    ),
                  ),


                  Container(
                      color: Colors.white,
                    padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                    child: Container(

                     // width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black),color: Colors.white),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Container(
                          width:MediaQuery.of(context).size.width*7/10,
                            child: TextField(decoration: InputDecoration(hintText: "\t\tEnter Coupon Code"),)),
                        Container(
                          width:MediaQuery.of(context).size.width*2/10,
                          decoration: BoxDecoration(color: primaryColor),
                          child: TextButton(onPressed:(){} ,child: Text("APPLY",style: TextStyle(color: Colors.white),),),),
                      ],)
                    ),
                  ),


                  Container(
                    color: Colors.grey.shade200,
                    margin: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.white,),
                      //height: 500,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(controller.couponModel?.result?[0].couponTitle??"",
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    color: primaryColor,
                                    height: 35,
                                    child: TextButton(onPressed: () {},
                                        child: Text(controller.couponModel?.result?[0].couponCode??"",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),))),
                                Container(
                                   // color: Colors.grey,
                                    height: 50,
                                    child: TextButton(onPressed: () {
                                      // Copy text to clipboard when button is pressed
                                      FlutterClipboard.copy(controller.couponModel?.result?[0].couponCode??"").then((
                                          value) {
                                        // Show a snackbar to indicate that text has been copied
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text(
                                              'Text copied to clipboard')),
                                        );
                                      });
                                    },
                                        child: Icon(Icons.copy,size:25,color: primaryColor,)
                                    )
                                )
                              ],
                            ),
                            Align(alignment: Alignment.centerRight,
                                child: Container(
                                  decoration: BoxDecoration(color: primaryColor),
                                    child: TextButton(onPressed: (){
                                      print("------------------------------------------${controller.couponModel?.result?[0].couponCode??""}");

                                      Get.offAll(()=>CustomBottomNavigationBar(2),arguments: [controller.couponModel?.result?[0].couponCode]);
                                      showDialog(context: context, builder: (BuildContext context){
                                        return AlertDialog(contentPadding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                                          title: Center(child: Text("Hurrahh!!!",style: TextStyle(color: Colors.black),)),
                                          content: Container(
                                           // color: Colors.red,
                                            height: MediaQuery.of(context).size.height/4,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  width:MediaQuery.of(context).size.width/1.5,
                                                  //  color: Colors.red,
                                                    padding: EdgeInsets.only(top: 50),
                                                    child: Text("Coupon Code applied successfully!!!",textAlign: TextAlign.center,maxLines: 2,style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),)),
                                                GestureDetector(
                                                  onTap: (){
                                                    Get.back();
                                                  },
                                                  child: Container(
                                                      decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.black,width: 2))),
                                                      padding: EdgeInsets.only(top: 15,bottom: 15),
                                                      child:  Center(child: Text("YAY!",style: TextStyle(fontSize: 16),)),),
                                                )
                                              ],
                                            ),
                                          ),


                                        )
                                        ;
                                      });


                                      controller.update();
                                     // controller.getCart(controller.couponModel?.result?[0].couponCode??"");


                                    }, child: Text("Apply Coupon",style: TextStyle(color: Colors.white),))))
                          ],


                        ),
                      ),
                    ),
                  ),

                ],


              ),
            ),


          );
        }
    );
  }
}

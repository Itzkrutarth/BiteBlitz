import 'dart:convert';

import 'package:biteblitz/view/MoreScreen/WishlistScreen/wishlist_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../Model/wishlistModel.dart';
import 'package:http/http.dart' as http;

import '../../../colors.dart';
import '../../ProductdetailScreen/productdetail_view.dart';





class MyWishlist extends StatelessWidget {
  const MyWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));
    return GetBuilder(
        init: WishlistCon(),
        builder: (WishlistCon controller) {
          return Scaffold(
            body:controller.loading==true?Center(child: SpinKitHourGlass(color: primaryColor,size: 50)):
            SafeArea(
              child:
                Column(
                    children:[
                      Container(

                       // height: MediaQuery.of(context).size.height/14.5,
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
                                  child: Text("Wishlist",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
                                ),
                              ),]
                        ),
                      ),
                      Expanded(
                        child: Container(
                         height: MediaQuery.of(context).size.height,
                          color: Colors.grey.shade200,
                          padding: EdgeInsets.only(top: 10,bottom: 10,left: 12,right: 12),
                          child: GridView.builder(scrollDirection: Axis.vertical, gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                              childAspectRatio: 65/ 100,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15),
                              itemCount: controller.wishListModel?.result?.length,
                              itemBuilder: (BuildContext context, int index) {

                                return Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          Get.to(()=>MyDetail(id:controller.wishListModel?.result?[index].productId??"0"));
                                        },
                                        child: Container(
                                          //height: MediaQuery.of(context).size.height/1.5,
                                          decoration: BoxDecoration(
                                              color: Colors.white, borderRadius: BorderRadius
                                              .circular(12)),
                                          padding: EdgeInsets.all(5),
                                          child:
                                          Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              height: 100,
                                              //  color: Colors.red,
                                              child:
                                              Image.network(controller.wishListModel?.result?[index].productImage??"",
                                                width: MediaQuery.of(context).size.width,),

                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 5,right: 5),
                                              height: 130,
                                              //color: Colors.blue,
                                              child:  Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text( controller.wishListModel?.result?[index].productName??"",maxLines: 2,overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: primaryColor,
                                                        fontWeight: FontWeight.bold),),
                                                  Text( controller.wishListModel?.result?[index].productVariantName??"", style: TextStyle(
                                                    color: Colors.grey,),),
                                                  Text("No review added yet",
                                                    style: TextStyle(fontSize: 12,
                                                      color: Colors.grey,),),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 8.0),
                                                    child: Row(
                                                      children: [
                                                        Text( controller.wishListModel?.result?[index].productDiscountAmt??"",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight
                                                                  .bold,
                                                              color: Colors.black,)),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .only(left: 8.0),
                                                          child: Text( controller.wishListModel?.result?[index].productMrp??"",
                                                              style: TextStyle(
                                                                  color: Colors.grey,
                                                                  decoration: TextDecoration
                                                                      .lineThrough,
                                                                  decorationColor: Colors
                                                                      .grey)),
                                                        )
                                                      ],
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Container(
                                              //color: Colors.red,
                                              // padding: const EdgeInsets.only(
                                              //     left: 8, right: 20),
                                              height: 35,
                                              width: MediaQuery.of(context).size.width/2,
                                              child: controller.wishListModel?.result?[index].productQty !='0'
                                                  ?
                                              Container(
                                                width: 140,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  color: secondaryColor,
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    IconButton(

                                                      onPressed: () {
                                                        controller.productQuntity=int.parse(controller.wishListModel?.result?[index].productQty?? '0');

                                                        if(controller.productQuntity > 0){
                                                          controller.productQuntity--;
                                                          controller.wishListModel?.result?[index].productQty=controller.productQuntity.toString();
                                                          controller.addToCart(controller.productQuntity.toString(),controller.wishListModel?.result?[index].productId ?? '');

                                                        }
                                                        controller.update();


                                                      },
                                                      icon: Container(
                                                        decoration: const BoxDecoration(
                                                          color: primaryColor,
                                                          shape: BoxShape.circle,
                                                        ),
                                                        child: const Icon(
                                                          Icons.remove,
                                                          color: Colors.white,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      controller.wishListModel?.result?[index].productQty??"" ,
                                                      style: const TextStyle(fontSize: 14.0, color: Colors.white),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {

                                                        controller.productQuntity=int.parse(controller.wishListModel?.result?[index].productQty??"");
                                                        // print('productQuntity-----------------------------$controller.productQuntity');
                                                        controller.productQuntity++;
                                                        controller.wishListModel?.result?[index].productQty=controller.productQuntity.toString();
                                                        //print("${controller.productQuntity}77777777777777777777777777777777777777777777777777");
                                                        controller.addToCart(controller.productQuntity.toString(), controller.wishListModel?.result?[index].productId??"");


                                                        // print('producquthjh--------------------------------------------------${controller.productQuntity}');
                                                      },
                                                      icon: Container(
                                                        decoration: const BoxDecoration(
                                                          color: primaryColor,
                                                          shape: BoxShape.circle,
                                                        ),
                                                        child: const Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                                  :  ElevatedButton(
                                                onPressed: () {
                                                  if (controller.wishListModel?.result?[index].buttonText=="Add To Cart") {
                                                    controller.productQuntity++;
                                                    controller.wishListModel?.result?[index].productQty=controller.productQuntity.toString();
                                                    controller.addToCart(controller.productQuntity.toString(),controller.wishListModel?.result?[index].productId??"");
                                                  }
                                                },
                                                style:controller.wishListModel?.result?[index].buttonText=="Add To Cart"? ElevatedButton.styleFrom(backgroundColor: primaryColor):ElevatedButton.styleFrom(backgroundColor: Colors.red.shade500),
                                                child: Text(controller.wishListModel?.result?[index].buttonText??"",style: TextStyle(color: Colors.white),),
                                              ),

                                            ),
                                          ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        child: IconButton(onPressed:(){

                                          controller.getremovewishlist(controller.wishListModel?.result?[index].wishlistId??"");
                                          controller.update();

                                        } ,icon: Icon(Icons.cancel_outlined,size: 30,),),
                                      ),
                                      Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.green.shade800,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(12),
                                                    bottomRight: Radius.circular(12))),
                                            height: 30,
                                            width: 65,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5, left: 3),
                                              child: Text( controller.wishListModel?.result?[index].percentageDiscount??"",
                                                style: TextStyle(color: Colors.white),),
                                            ),
                                          ))
                                    ]
                                );
                              }),
                        ),
                      ),

                    ]
                ),

            ),
          );
        }
    );
  }
}


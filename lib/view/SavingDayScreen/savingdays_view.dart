import 'dart:convert';

import 'package:biteblitz/colors.dart';
import 'package:biteblitz/view/SavingDayScreen/savingdays_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../Widgets/customnavbar.dart';
import '../HomeScreen/home_view.dart';
import '../ProductdetailScreen/productdetail_view.dart';
import './/Model/add_to_cart_modal.dart';
import './/Model/savingdaysmodel.dart';
import 'package:http/http.dart' as http;

class MySavings extends StatelessWidget {
  final String offer_id;
  final String offer_title;

  const MySavings({required this.offer_id, super.key, required this.offer_title});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SavingdaysController(offer_id),
      builder: (SavingdaysController controller) {
        return Scaffold(

            body: controller.loading==true?const Center(child: SpinKitHourGlass(
              color:primaryColor,
              size: 50.0,
            )):SafeArea(
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      color: primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.only(top:5,bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: IconButton(onPressed: (){
                                Get.offAll(CustomBottomNavigationBar(0));

                              }, icon: Icon(Icons.arrow_back,size: 25,color: Colors.white,)),
                            ),
                            Text(offer_title??"not found",style: TextStyle(color: Colors.white,fontSize: 22),),

                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(context: context, builder: (BuildContext context) {

                                    return StatefulBuilder(builder:(context ,StateSetter setState){
                                      return   SimpleDialog(
                                          contentPadding: EdgeInsets.zero,
                                          children :[
                                            Column(
                                              children: [
                                                ListTile(leading: Icon(
                                                  Icons.thumb_up_off_alt_outlined,
                                                  color: Colors.black, size: 25,),
                                                    trailing: Radio(value: "",
                                                        groupValue: controller.selectedFilter,
                                                        onChanged: (value) {
                                                          setState((){
                                                            controller.selectedFilter = value!;
                                                          });


                                                        }),
                                                    title: Text("Recommended", style: TextStyle(
                                                        fontSize: 18, color: Colors.black),)),


                                                ListTile(leading: Icon(
                                                  Icons.fiber_new_rounded, color: Colors.black,
                                                  size: 25,),
                                                    trailing: Radio(value: "new_products",
                                                        groupValue: controller.selectedFilter,
                                                        onChanged: (value) {
                                                          setState((){
                                                            controller.selectedFilter = value!;
                                                          });
                                                        }),
                                                    title: Text("New Arrivals", style: TextStyle(
                                                        fontSize: 18, color: Colors.black),)),
                                                ListTile(leading: Icon(
                                                  Icons.arrow_upward_sharp, color: Colors.black,
                                                  size: 25,),
                                                    trailing: Radio(value: "price_high_to_low",
                                                        groupValue: controller.selectedFilter,
                                                        onChanged: (value) {
                                                          setState((){
                                                            controller.selectedFilter = value!;
                                                          });
                                                        }),
                                                    title: Text("Price (High To Low)",
                                                      style: TextStyle(
                                                          fontSize: 18, color: Colors.black),)),
                                                ListTile(leading: Icon(
                                                  Icons.arrow_downward_sharp, color: Colors.black,
                                                  size: 25,),
                                                    trailing: Radio(value: "price_low_to_high",
                                                        groupValue: controller.selectedFilter,
                                                        onChanged: (value) {
                                                          setState((){
                                                            controller.selectedFilter = value!;
                                                          });
                                                        }),
                                                    title: Text("Price (Low To High)",
                                                      style: TextStyle(
                                                          fontSize: 18, color: Colors.black),)),
                                                ListTile(leading: Icon(
                                                  Icons.sort_outlined, color: Colors.black,
                                                  size: 25,),
                                                    trailing: Radio(value: "a_to_z",
                                                        groupValue: controller.selectedFilter,
                                                        onChanged: (value) {
                                                          setState((){
                                                            controller.selectedFilter = value!;
                                                          });
                                                        }),
                                                    title: Text("Name (A To Z)", style: TextStyle(
                                                        fontSize: 18, color: Colors.black),)),
                                                ListTile(leading: Icon(
                                                  Icons.sort_outlined, color: Colors.black,
                                                  size: 25,),
                                                    trailing: Radio(value: "z_to_a",
                                                        groupValue: controller.selectedFilter,
                                                        onChanged: (value) {

                                                          setState((){
                                                            controller.selectedFilter = value!;
                                                          });

                                                        }),
                                                    title: Text("Name (Z To A)", style: TextStyle(
                                                        fontSize: 18, color: Colors.black),)),
                                                ListTile(leading: Icon(
                                                  Icons.discount_outlined, color: Colors.black,
                                                  size: 25,),
                                                    trailing: Radio(value: "discount_high_to_low",
                                                        groupValue: controller.selectedFilter,
                                                        onChanged: (value) {

                                                          setState((){
                                                            controller.selectedFilter = value!;
                                                          });
                                                        }),
                                                    title: Text("Discount (High To Low)",
                                                      style: TextStyle(
                                                          fontSize: 18, color: Colors.black),)),
                                                ListTile(leading: Icon(
                                                  Icons.discount_outlined, color: Colors.black,
                                                  size: 25,),
                                                    trailing: Radio(value: "discount_low_to_high",
                                                        groupValue: controller.selectedFilter,
                                                        onChanged: (value) {

                                                          setState((){
                                                            controller.selectedFilter = value!;
                                                          });

                                                        }),
                                                    title: Text("Discount (Low To High)",
                                                      style: TextStyle(
                                                          fontSize: 18, color: Colors.black),)),
                                                //TextButton(onPressed:(){} ,style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red)),child: Text("Apply"),)
                                                GestureDetector(
                                                  onTap: () {
                                                 //   Navigator.pop(context);
                                                    controller.getSavingDaysProductList(offer_id,controller.selectedFilter);
                                                    controller.update();
                                                    Get.back();
                                                  },
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          color: primaryColor,
                                                          borderRadius: BorderRadius.only(
                                                              bottomRight: Radius.circular(20),
                                                              bottomLeft: Radius.circular(20))),
                                                      child: ListTile(title: Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text("Apply", style: TextStyle(
                                                              color: Colors.white),)
                                                        ],))),
                                                )
                                              ],
                                            ),
                                          ]);
                                    });


                                  }
                                  ); },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.15,
                                  color: primaryColor,
                                  child: Container(
                                      child: Icon(Icons.filter_alt_sharp, size: 30,color: Colors.white,)),),
                              ),
                            )

                          ],

                        ),
                      )
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.grey.shade200,
                        padding: EdgeInsets.only(top: 10,bottom: 10,left: 12,right: 12),
                        child: GridView.builder(padding: EdgeInsets.only(bottom: 100), gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                            childAspectRatio: 65/ 100,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15),
                            itemCount: controller.savingDaysModelProductList?.result?.length,
                            itemBuilder: (BuildContext context, int index) {

                              return Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        Get.to(()=>MyDetail(id:controller.savingDaysModelProductList?.result?[index].productId??"0"));
                                      },
                                      child: Container(
                                        //height: MediaQuery.of(context).size.height/1.5,
                                        decoration: BoxDecoration(
                                            color: Colors.white, borderRadius: BorderRadius
                                            .circular(12)),
                                        padding: EdgeInsets.all(5),
                                        child: Stack(
                                          children: [Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: 100,
                                                //  color: Colors.red,
                                                child:
                                                Image.network(controller.savingDaysModelProductList?.result?[index].productImage??"",
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
                                                    Text( controller.savingDaysModelProductList?.result?[index].productName??"",maxLines: 2,overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: primaryColor,
                                                          fontWeight: FontWeight.bold),),
                                                    Text( controller.savingDaysModelProductList?.result?[index].productVariantName??"", style: TextStyle(
                                                      color: Colors.grey,),),
                                                    Text("No review added yet",
                                                      style: TextStyle(fontSize: 12,
                                                        color: Colors.grey,),),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          top: 8.0),
                                                      child: Row(
                                                        children: [
                                                          Text( controller.savingDaysModelProductList?.result?[index].productDiscountAmt??"",
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight
                                                                    .bold,
                                                                color: Colors.black,)),
                                                          Padding(
                                                            padding: const EdgeInsets
                                                                .only(left: 8.0),
                                                            child: Text( controller.savingDaysModelProductList?.result?[index].productMrp??"",
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
                                                child: controller.savingDaysModelProductList?.result?[index].productQty !='0'
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
                                                          controller.productQuntity=int.parse(controller.savingDaysModelProductList?.result?[index].productQty?? '0');

                                                          if(controller.productQuntity > 0){
                                                            controller.productQuntity--;
                                                            controller.savingDaysModelProductList?.result?[index].productQty=controller.productQuntity.toString();
                                                            controller.addToCart(controller.productQuntity.toString(), controller.savingDaysModelProductList?.result?[index].productId ?? '');

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
                                                        controller.savingDaysModelProductList?.result?[index].productQty??"" ,
                                                        style: const TextStyle(fontSize: 14.0, color: Colors.white),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {

                                                          controller.productQuntity=int.parse(controller.savingDaysModelProductList?.result?[index].productQty??"");
                                                          // print('productQuntity-----------------------------$controller.productQuntity');
                                                          controller.productQuntity++;
                                                          controller.savingDaysModelProductList?.result?[index].productQty=controller.productQuntity.toString();
                                                          //print("${controller.productQuntity}77777777777777777777777777777777777777777777777777");
                                                          controller.addToCart(controller.productQuntity.toString(), controller.savingDaysModelProductList?.result?[index].productId??"");


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
                                                    if (controller.savingDaysModelProductList?.result?[index].buttonText=="Add To Cart") {
                                                      controller.productQuntity++;
                                                      controller.savingDaysModelProductList?.result?[index].productQty=controller.productQuntity.toString();
                                                      controller.addToCart(controller.productQuntity.toString(), controller.savingDaysModelProductList?.result?[index].productId??"");
                                                    }
                                                  },
                                                  style:controller.savingDaysModelProductList?.result?[index].buttonText=="Add To Cart"? ElevatedButton.styleFrom(backgroundColor: primaryColor):ElevatedButton.styleFrom(backgroundColor: Colors.red.shade500),
                                                  child: Text(controller.savingDaysModelProductList?.result?[index].buttonText??"",style: TextStyle(color: Colors.white),),
                                                ),

                                              ),
                                            ],
                                          )
                                            ,
                                            Align(
                                              alignment: Alignment.topRight,
                                              child:controller.savingDaysModelProductList?.result?[index].inWishlist=="true"?
                                              IconButton(onPressed: (){
                                                controller.getremovewishlist(controller.savingDaysModelProductList?.result?[index].wishlistId??" ");
                                              }, icon:
                                              Icon(Icons.favorite,color: Colors.red,size: 25,))
                                                  :
                                              IconButton(onPressed: (){
                                                controller.getaddwishlist(controller.savingDaysModelProductList?.result?[index].productId??" ");
                                              }, icon:
                                              Icon(Icons.favorite_border_outlined,size: 25,)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    controller.savingDaysModelProductList?.result?[index].percentageDiscount!=""?
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
                                            child: Text( controller.savingDaysModelProductList?.result?[index].percentageDiscount??"",
                                              style: TextStyle(color: Colors.white),),
                                          ),
                                        )):SizedBox()
                                  ]
                              );
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            )


        );
      }
    );
  }
}

import 'dart:convert';


import 'package:biteblitz/Model/CartModel.dart';
import 'package:biteblitz/Model/HomeOfferModel.dart';
import 'package:biteblitz/Model/bannermodel.dart';
import 'package:biteblitz/Model/savingdaysmodel.dart';

import 'package:biteblitz/view/HomeScreen/Home_controller.dart';
import 'package:biteblitz/view/NotificationScreen/notification_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Widgets/customnavbar.dart';
import '../../colors.dart';
import '../AppleScreen/apple_view.dart';
import '../CartScreen/cart_view.dart';

import '../MoreScreen/more_view.dart';
import '../ProductdetailScreen/productdetail_view.dart';
import '../ProfileScreen/profile_view.dart';
import '../SavingDayScreen/savingdays_view.dart';
import '../SearchScreen/serach_view.dart';
import 'dart:convert';


import 'package:biteblitz/Model/CartModel.dart';
import 'package:biteblitz/Model/HomeOfferModel.dart';
import 'package:biteblitz/Model/bannermodel.dart';
import 'package:biteblitz/Model/savingdaysmodel.dart';

import 'package:biteblitz/view/HomeScreen/Home_controller.dart';
import 'package:biteblitz/view/NotificationScreen/notification_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../colors.dart';
import '../AppleScreen/apple_view.dart';
import '../CartScreen/cart_view.dart';

import '../MoreScreen/more_view.dart';
import '../ProductdetailScreen/productdetail_view.dart';
import '../ProfileScreen/profile_view.dart';
import '../SavingDayScreen/savingdays_view.dart';
import '../SearchScreen/serach_view.dart';

class MyHome extends StatelessWidget {


final String offer_id;
final String offer_title;




   const MyHome({Key? key, required this.offer_id, required this.offer_title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));
    return SafeArea(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GetBuilder(
          init: HomeController(offer_id,offer_title),
          builder: (HomeController controller) {
            return RefreshIndicator(
              onRefresh:() {
                return controller.getSavingDays();
              },
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: controller.loading==true?const Center(child: SpinKitHourGlass(color: primaryColor,size: 50,)):SafeArea(
                  child: Container(
                    color: Colors.grey.shade200,
                    child: Column(
                      children: [
                        Container(
                          color: primaryColor,
                          height: MediaQuery.of(context).size.height/8,
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10,left: 5,right: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18.0),
                                      child: Text(
                                        "Hi, ${controller.customerName}👋",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),//hi srushti
                                    GestureDetector(
                                      onTap: (){Get.to(()=>MyNoti());},
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right: 18),
                                        child: Icon(Icons.notifications_sharp,color:Colors.white,size: 30),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 20,right: 20),
                                  height: MediaQuery.of(context).size.height/20,
                                  decoration: BoxDecoration(color:secondaryColor,borderRadius: BorderRadius.circular(50)),
                                  child: TextField(onTap: (){
                                    //Get.to(()=>MySearch());
                                    Get.offAll(CustomBottomNavigationBar(1));
                                  },
                                    readOnly: true,decoration: InputDecoration(prefixIcon: Icon(Icons.search),hintText: "Search For Products",border: InputBorder.none,),),
      
                                ),
                              ],
                            ),
                          ),
                        ),//name+bell
      
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height/5.8,
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(35)),
                                  ),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.categoryModel?.result?.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              Get.to(()=>MyApple(
                                                id:controller.categoryModel?.result?[index].categoryId??"",
                                                grid_id:controller.categoryModel?.result?[index].categoryId??"",
                                                name: controller.categoryModel?.result?[index].categoryName??"0",));//name kadhi didhu 6e
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(left: 5,right: 5),
                                              width: MediaQuery.of(context).size.width/5,
                                              child: Column(
                                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Container(
                                                    //color: Colors.red,
                                                    height: 75,
                                                    margin: const EdgeInsets.only(left: 5,right: 5),
                                                    child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(12),
                                                        child: Image.network(controller.categoryModel?.result?[index].categoryImage??"assets/api_dummy.png")),
      
                                                  ),
                                                  SizedBox(height: 10),
                                                  Container(
                                                    //color: Colors.red,
                                                      child: Text(controller.categoryModel?.result?[index].categoryName??"",
                                                        textAlign: TextAlign.center,
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.white),)
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ), //fruit
      
                                Container(
                                  height: 150,
                                  // width: 200,
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: CarouselSlider.builder(
                                    itemCount:controller.bannerModel!.result!.length,//temporary solution
                                    itemBuilder: (context, int index, int realIndex) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              switch(index){
                                                case 0:
                                                  Get.to(()=>MySavings(offer_id:controller.savingDaysModel?.result?[index].offerProductIds ?? "", offer_title:  controller.savingDaysModel?.result?[index].offerTitle ?? "",));
                                                case 1:
                                                  Get.to(()=>MySavings(offer_id:controller.savingDaysModel?.result?[index].offerProductIds ?? "", offer_title:  controller.savingDaysModel?.result?[index].offerTitle ?? "",));
                                                case 2:
                                                  Get.to(()=>MySavings(offer_id: controller.savingDaysModel?.result?[index].offerProductIds ?? "", offer_title:  controller.savingDaysModel?.result?[index].offerTitle ?? "",));
                                              }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(12.0),
                                                  child:Image.network(controller.bannerModel?.result?[index].offerImage??"assets/api_dummy.png",width: MediaQuery.of(context).size.width/1.35,fit: BoxFit.fill,)
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    }, options: CarouselOptions(height: 150,
                                    aspectRatio: 16 / 9,
                                    viewportFraction: 0.8,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 3),
                                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    //CenterPage: true,
                                    scrollDirection: Axis.horizontal,),
                                  ),
                                ),
                                //big_home
                                Container(
                                  height: 80,
                                  margin: EdgeInsets.only(top: 8),
                                  padding: EdgeInsets.only(left: 7, right: 10),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.subcategoryModel?.result?.length,
                                    itemBuilder: (context, int index) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.to(()=>MyApple(
                                                    id:controller.subcategoryModel?.result?[index].subcategoryCatId??"",
                                                    grid_id:controller.subcategoryModel?.result?[index].subcategoryCatId??"",
                                                    name: controller.subcategoryModel?.result?[index].subcategoryName??""));
      
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(12.0),
                                                child: Image.network(controller.subcategoryModel?.result?[index].subcategoryImage??"assets/api_dummy.png"),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),//subcategory
      
                                ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: controller.savingDaysModel?.result?.length,
                                    itemBuilder: (context, int index){
                                      return Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left:15 ,right:10 ,top:15 ,bottom: 5),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(controller.savingDaysModel?.result?[index].offerTitle ?? "",
                                                        style:
                                                        TextStyle(fontWeight: FontWeight.bold)),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.to(()=>MySavings(offer_id: controller.savingDaysModel?.result?[index].offetrId?? "",offer_title: controller.savingDaysModel?.result?[index].offerTitle ?? "",),preventDuplicates:false );
      
                                                      },
                                                      child: Text("View all",
                                                          style: TextStyle(fontWeight: FontWeight.bold)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ), //text line
      
      
                                            Container(
                                              //color: Colors.green,
                                              height: MediaQuery.of(context).size.height/3,
                                              padding: const EdgeInsets.only(left: 10, right: 10),
                                              child: ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount:8,
                                                itemBuilder: (context, int arrayindex) {
                                                  return Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Stack(children: [
                                                        Container(
                                                          // height: MediaQuery.of(context).size.height/3.5,
                                                          width: MediaQuery.of(context).size.width/2.5,
                                                          decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(12)),
                                                          // padding: EdgeInsets.only(left: 5,right: 5,top: 25),
                                                          child: Stack(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: (){
                                                                  print("-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+${controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].productId??"0"}");
                                                                  Get.to(()=>MyDetail(id:controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].productId??"1"));
      
                                                                },
                                                                child: Container(
                                                                  // color: Colors.red,
                                                                    child: Column(
                                                                      children: [
                                                                        Container(
                                                                          // color: Colors.blue,
                                                                            height: MediaQuery.of(context).size.height/7,
                                                                            child: Image.network(controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].productImage??'',width: MediaQuery.of(context).size.width/4,)),
                                                                        Container(
                                                                          height: 110,
                                                                          padding: EdgeInsets.only(left: 5,right: 5),
                                                                          child: Column(
                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].productName??'Not Found',maxLines: 2,overflow: TextOverflow.ellipsis,style: const TextStyle(color: primaryColor,fontWeight: FontWeight.bold),),
                                                                              Text(controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].productVariantName??'Not Found',style: TextStyle(color: Colors.grey,),),
                                                                              Text("No review added yet",style: TextStyle(fontSize: 12,color: Colors.grey,),),
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(top: 8.0),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].productDiscountAmt??'YYYYY',style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Colors.black,)),
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.only(left: 8.0),
                                                                                      child: Text(controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].productMrp??'XXXXX',style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough,decorationColor:Colors.grey)),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
      
      
                                                                            ],
                                                                          ),
                                                                        ),
      
                                                                      ],
                                                                    )),
                                                              ),
      
      
                                                              Container(
                                                                padding: const EdgeInsets.only(bottom: 10.0),
                                                                child: Align(
                                                                  alignment: Alignment.bottomCenter,
                                                                  child: Container(
                                                                    // color: Colors.red,
                                                                    // padding: const EdgeInsets.only(
                                                                    //     left: 8, right: 20),
                                                                    height: 35,
                                                                    width: MediaQuery.of(context).size.width/2.8,
                                                                    child: controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].productQty != "0"
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
                                                                              controller.productQuntity=int.parse(controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].productQty?? '0');
      
                                                                              if(controller.productQuntity > 0){
                                                                                controller.productQuntity--;
                                                                                controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].productQty=controller.productQuntity.toString();
                                                                                controller.addToCart(controller.productQuntity.toString(), controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].productId ?? '');
      
                                                                              }
                                                                              controller.update();
                                                                              // if (productQuantity > 0) {
                                                                              //   productQuantity--;
                                                                              // }
                                                                              // if (productQuantity == 0) {
                                                                              //   // If quantity becomes 0, reset to "Add to Cart"
                                                                              //   productQuantity = 0;
                                                                              // }
      
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
                                                                            controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].productQty??"" ,
                                                                            style: const TextStyle(fontSize: 14.0, color: Colors.white),
                                                                          ),
                                                                          IconButton(
                                                                            onPressed: () {
      
                                                                              controller.productQuntity=int.parse(controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].productQty??"");
                                                                             // print('productQuntity-----------------------------$controller.productQuntity');
                                                                              controller.productQuntity++;
                                                                              controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].productQty=controller.productQuntity.toString();
                                                                              //print("${controller.productQuntity}77777777777777777777777777777777777777777777777777");
                                                                              controller.addToCart(controller.productQuntity.toString(), controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].productId??"");
      
      
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
                                                                        if (controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].buttonText=="Add To Cart") {
                                                                          controller.productQuntity++;
                                                                          controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].productQty=controller.productQuntity.toString();
                                                                          controller.addToCart(controller.productQuntity.toString(), controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].productId??"");
                                                                        }
                                                                      },
                                                                      style:controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].buttonText=="Add To Cart"? ElevatedButton.styleFrom(backgroundColor: primaryColor):ElevatedButton.styleFrom(backgroundColor: Colors.red.shade500),
                                                                      child: Text(controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].buttonText??"",style: TextStyle(color: Colors.white),),
                                                                    ),
      
                                                                  ),
                                                                ),
                                                              ),
      
      
      
                                                              Align(
                                                                alignment: Alignment.topRight,
                                                                child:controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].inWishlist=="true"?
                                                                IconButton(onPressed: (){
                                                                  controller.getremovewishlist(controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].wishlistId??" ");
                                                                }, icon:
                                                                Icon(Icons.favorite,color: Colors.red,size: 25,))
                                                                  :
                                                                IconButton(onPressed: (){
                                                              controller.getaddwishlist(controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].productId??" ");
                                                              }, icon:
                                                              Icon(Icons.favorite_border_outlined,size: 25,)),
                                                                          ),
      
                                                            ],
                                                          ),
                                                        ),
                                                        controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].percentageDiscount!=""?
                                                        Positioned(
                                                            left: 0,
                                                            top: 0,
                                                            child: Container(
                                                              decoration: BoxDecoration(color:Colors.green.shade800,borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomRight: Radius.circular(12))),
                                                              height: 30,
                                                              width: 65,
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(top: 5,left: 3),
                                                                child: Text(controller.savingDaysModel?.result?[index].arrayProduct?[arrayindex].percentageDiscount??'0% OFF',style: TextStyle(color: Colors.white),),
                                                              ),
                                                            )):SizedBox()
      
                                                      ]),
                                                      const SizedBox(width: 7),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
      
      
      
                                            SizedBox(height:15),
      
                                          ],
                                        ),
                                      );
                                    }
                                ),
      
      
                              ],
                            ),
                          ),
                        ),
      
      
      
      
      
      
      
                      ],
                    ),
      
                  ),
                ),
      
      
              ),
            );
          },
        ),
      ),
    );
  }
}





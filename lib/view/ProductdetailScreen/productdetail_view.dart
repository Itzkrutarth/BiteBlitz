import 'dart:convert';


import 'package:biteblitz/Widgets/customnavbar.dart';
import 'package:biteblitz/view/HomeScreen/home_view.dart';
import 'package:biteblitz/view/ProductdetailScreen/productdetail_controller.dart';
import 'package:biteblitz/view/ProductdetailScreen/zoom_view.dart';

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:http/http.dart' as http;

import '../CartScreen/cart_view.dart';
import './/Model/CartModel.dart';
import './/Model/add_to_cart_modal.dart';
import './/Model/productmodel.dart';
import './/Model/savingdaysmodel.dart';
import './/colors.dart';


class MyDetail extends StatelessWidget {
  final String id;

  const MyDetail({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DetailController(id),
      builder: (DetailController controller) {
        return Scaffold(
          body:
          controller.loading==true?const Center(child: SpinKitHourGlass(color: primaryColor,size: 50,)):
          Column(
              children:[
                Container(
                  width: double.infinity,
                  color: primaryColor,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        GestureDetector(
                          onTap: (){
                          //  Navigator.pop(context);
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMore()));
                            //controller.update();
                            Get.to(()=>CustomBottomNavigationBar(0));

                          },
                          child: Padding(
                              padding: const EdgeInsets.only(left:20,top: 80, bottom: 14),
                              child: Icon(Icons.arrow_back,size: 25,color: Colors.white,)
                          ),
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width/1.5,
                          padding: const EdgeInsets.only(left: 20, top: 80, bottom: 14),
                          child: Text(controller.productModel?.result?[0].productName??"not found",textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                        ),

                        Container(
                          padding: EdgeInsets.only(right: 10,top: 60),
                          child: GestureDetector(
                            onTap: (){
                              // Navigator.pop(context);
                              Get.offAll(CustomBottomNavigationBar(2));

                            },
                            child: Stack(
                                children:[
                                  Container(
                                    //margin: EdgeInsets.only(right: 20,top: 50),
                                      height: 50,
                                      width: 50,
                                      //color: Colors.red,

                                      child:Icon(Icons.shopping_cart,size: 27,color: Colors.white,)
                                  ),
                                  Positioned(
                                    right: 0,top: 0,
                                    child: Container(
                                      decoration: BoxDecoration(color: Colors.black,shape: BoxShape.circle)
                                      ,height: 20,width: 20,
                                      child: Text(controller.cartModel!.result!.length.toString(),style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),),


                                  ),
                                ]
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              //color: Colors.red,
                              padding: EdgeInsets.all(10),
                              height: 220,
                              // width:double.infinity,
                              child: Stack(
                                  children: [
                                    GestureDetector(
                                      onTap:()
                                        {
                                        Get.to(()=>MyZoom(zoom_id:controller.productModel?.result?[0].productId??"0"));
                                        },
                                      child: PageView.builder(
                                          scrollDirection: Axis.horizontal,
                                          controller: controller.pageController,
                                          itemCount: controller.productModel?.result?[0].productMultipleImagesArray?.length,
                                          itemBuilder:(context, index){
                                            return Image.network(controller.productModel?.result?[0].productMultipleImagesArray?[index].image??"medam");
                                          }
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.topRight,
                                        child:controller.productModel?.result?[0].inWishlist=="true"?
                                        IconButton(onPressed: (){
                                          controller.getremovewishlist(controller.productModel?.result?[0].wishlistId??" ");
                                        }, icon:
                                        Icon(Icons.favorite,color: Colors.red,size: 25,))
                                            :
                                        IconButton(onPressed: (){
                                          controller.getaddwishlist(controller.productModel?.result?[0].productId??" ");
                                        }, icon:
                                        Icon(Icons.favorite_border_outlined,size: 25,)),
                                    )

                                  ]
                              ),
                            ),//photoview
                            DotsIndicator(dotsCount: controller.productModel!.result![0].productMultipleImagesArray!.length,
                                position: controller.currentPage.toDouble(),
                                decorator: DotsDecorator(activeColor: primaryColor,activeSize:Size(10,10)))
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(height: 2,color: Colors.grey.shade200),
                              Padding(
                                padding: const EdgeInsets.only(top:12,left: 20,bottom: 25),
                                child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.productModel?.result?[0].productName??"not found",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                                    Text(controller.productModel?.result?[0].brandName??"not found",style: TextStyle(color: Colors.grey.shade600),),
                                  ],
                                ),
                              ),
                              Container(height: 2,color: Colors.grey.shade200),
                            ],
                          )
                          ,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20,left: 20,bottom: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Special Price",style: TextStyle(fontSize: 16,color: primaryColor,fontWeight: FontWeight.bold),)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(controller.productModel?.result?[0].productMrp??"not found",style: TextStyle(decoration: TextDecoration.lineThrough,decorationColor: Colors.grey,color: Colors.grey),),
                                  SizedBox(width: 10,),
                                  Text(controller.productModel?.result?[0].productDiscountAmt??"not found",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                                  controller.productModel?.result?[0].percentageDiscount!=""?
                                  Container(
                                    margin: EdgeInsets.only(left: 10,right: 10),
                                    padding: EdgeInsets.all(8),
                                    color: primaryColor,
                                    child: Text(controller.productModel?.result?[0].percentageDiscount??"not found",style: TextStyle(color: Colors.white,fontSize:16 ),),
                                  )
                                      :
                                  SizedBox(width: 20,),
                                  Container(
                                      width: MediaQuery.of(context).size.width/4,
                                      child: Text(controller.productModel?.result?[0].productVariantName??"not found",style: TextStyle(color: Colors.grey,fontSize:16 ),))

                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Select Varient",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
                                ],
                              ),
                              Container(
                                // height: MediaQuery.of(context).size.height/6,
                                //color: Colors.red,
                                margin: EdgeInsets.only(right: 15),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  // physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: controller.productModel?.result?[0].productVarient?.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.only(top: 5,bottom:5),
                                      child: Container(

                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(border: Border.all(color: primaryColor, width: 2)),

                                        child: RadioListTile(
                                          activeColor: primaryColor,
                                          value: int.parse(controller.productModel?.result?[0].productVarient?[index].productId ?? "0"),
                                          groupValue:controller.is_rd_selected,
                                          onChanged: (value){
                                            controller.is_rd_selected=value!;
                                            controller.getProduct(controller.productModel?.result?[0].productVarient?[index].productId ?? "0");
                                            controller.update();

                                            // controller.PRODUCT_ID=controller.productModel?.result?[0].productVarient?[index].productId ?? "";
                                            // controller.getProduct(controller.PRODUCT_ID);
                                            //   print(controller.PRODUCT_ID);

                                          },

                                          title: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    controller.productModel?.result?[0].productVarient?[index].productDiscountAmt ?? "???",
                                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                                  ),
                                                  controller.productModel?.result?[0].productVarient?[index].productMrp!=""?
                                                  Text(
                                                    controller.productModel?.result?[0].productVarient?[index].productMrp ?? "???",
                                                    style: TextStyle(
                                                      color: Colors.grey.shade600,
                                                      decoration: TextDecoration.lineThrough,
                                                      fontSize: 14,
                                                    ),
                                                  )
                                                      :
                                                  SizedBox()
                                                ],
                                              ),
                                              controller.productModel?.result?[0].productVarient?[index].percentageDiscount!=""?
                                              Container(
                                                margin: EdgeInsets.only(left: 10, right: 10),
                                                padding: EdgeInsets.all(6),
                                                color: primaryColor,
                                                child: Text(
                                                  controller.productModel?.result?[0].productVarient?[index].percentageDiscount ?? "not found",
                                                  style: TextStyle(color: Colors.white, fontSize: 14),
                                                ),
                                              )
                                              :
                                              SizedBox(width: 20,),
                                              Container(
                                                //color: Colors.blue,
                                                width: MediaQuery.of(context).size.width/5,
                                                child: Text(
                                                  controller.productModel?.result?[0].productVarient?[index].productVariantName ?? "not found",
                                                  style: TextStyle(color: Colors.grey, fontSize: 16),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )



                            ],
                          ),
                        ),
                        Container(color: Colors.grey.shade200,height: 2,),
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:7,left: 20),
                                child: Row(
                                  mainAxisAlignment:MainAxisAlignment.start,
                                  children: [
                                    Text("Description",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20,bottom: 7),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width/1.1,
                                        child: Text(controller.productModel?.result?[0].productDescription??"not found")),
                                  ],
                                ),
                              ),
                              Container(height: 2,color: Colors.grey.shade200),
                            ],
                          )
                          ,
                        ),
                        GestureDetector(
                          onTap: (){
                            showModalBottomSheet(context: context, builder: (BuildContext context){
                              return Container(
                                width: double.infinity,
                                height: 420,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:15.0,bottom: 8,left: 10,right: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Product Information",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                          GestureDetector(
                                              onTap: (){
                                                //Navigator.pop(context);
                                              },
                                              child: Icon(Icons.close,size: 25,))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(controller.productModel?.result?[0].productDescription??"not found"),
                                    )
                                  ],
                                ),
                              );
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top:7,left: 20,bottom: 7),
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text("More Information",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),
                                ),
                                Icon(Icons.info,color: primaryColor,)
                              ],
                            ),
                          ),
                        ),
                        Container(color: Colors.grey.shade200,height: 2,),
                        Padding(
                          padding: const EdgeInsets.only(top:7,left: 20,bottom: 7),
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.start,
                            children: [
                              Text("No Review added yet",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),

                            ],
                          ),
                        ),
                        Container(color: Colors.grey.shade200,height: 2,),
                      ],
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 20),
                    //decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
                    height: 65,
                    color: primaryColor,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top:10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Price",style: TextStyle(color: Colors.white),),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(controller.productModel?.result?[0].productMrp??"not found",style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough,decorationColor: Colors.white),),
                                  SizedBox(width: 10,),
                                  Text(controller.productModel?.result?[0].productDiscountAmt??"not found",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 8, right: 20),
                          height: 35,
                          child: controller.productModel?.result?[0].isInCart == 'Yes'
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

                                    controller.productQuntity=int.parse(controller.productModel?.result?[0].productQty??'0');

                                      if(controller.productQuntity > 0){
                                        controller.productQuntity--;

                                        controller.addToCart(controller.productQuntity.toString(), controller.productModel?.result?[0].productId??"");

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
                                  controller.productModel?.result?[0].productQty??"",
                                  style: const TextStyle(fontSize: 14.0, color: Colors.white),
                                ),
                                IconButton(
                                  onPressed: () {


                                    controller.productQuntity=int.parse(controller.productModel?.result?[0].productQty??"");

                                    controller.productQuntity++;

                                    controller.addToCart(controller.productQuntity.toString(), controller.productModel?.result?[0].productId??"");

                                    controller.update();

                                    //print('producquthjh--------------------------------------------------${controller.productQuntity}');
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
                              :
                          ElevatedButton(
                            onPressed: () {
                              if (controller.productModel?.result?[0].buttonText=="Add To Cart") {
                                controller.productQuntity++;
                                controller.addToCart(controller.productQuntity.toString(),controller.productModel?.result?[0].productId??"");
                              }
                            },
                            style: controller.productModel?.result?[0].buttonText=="Add To Cart"? ElevatedButton.styleFrom(backgroundColor: Colors.white):ElevatedButton.styleFrom(backgroundColor: Colors.red.shade500),
                            child: Text(controller.productModel?.result?[0].buttonText??"",style: controller.productModel?.result?[0].buttonText=="Add To Cart"?TextStyle(color: primaryColor):TextStyle(color: Colors.white)
                            ),
                          ),

                        ),
                      ],
                    )
                ),


              ]
          ),
        );
      }
    );;
  }
}


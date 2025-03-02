import 'dart:convert';


import 'package:biteblitz/view/AppleScreen/apple_controller.dart';
import 'package:biteblitz/view/CartScreen/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';



import '../../Widgets/customnavbar.dart';
import '../ProductdetailScreen/productdetail_view.dart';
import './/Model/add_to_cart_modal.dart';
import './/Model/subcategoryfruit.dart';
import './/Model/subcategorygrid.dart';
import './/Model/subcategorylist.dart';
import 'package:http/http.dart' as http;


import './/Model/subcategorymodel.dart';
import './/colors.dart';

class MyApple extends StatelessWidget {


  final String id;
  final String grid_id;
  final String name;

  const MyApple({super.key,required this.id,required this.grid_id, required this.name});//name commented

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AppleCon(id),
      builder: (AppleCon controller) {
      return Scaffold(
        body: controller.loading==true?const Center(child: SpinKitHourGlass(color: primaryColor,size: 50,)):
        Column(
          children: [
            Container(
              width: double.infinity,
              color: primaryColor,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                       // Navigator.pop(context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMore()));
                      },
                      child: const Padding(
                          padding: EdgeInsets.only(
                              left: 20, top: 80, bottom: 14),
                          child: Icon(
                            Icons.arrow_back, size: 25, color: Colors.white,)
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0, top: 80, bottom: 14),
                      child: Text(name, style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),),
                    ),

                    GestureDetector(
                      onTap: () {
                       // Get.to(()=>MyCart());
                        Get.offAll(CustomBottomNavigationBar(2));
                        //Navigator.pop(context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMore()));
                      },
                      child: const Padding(
                          padding: EdgeInsets.only(
                            right: 20, top: 80, bottom: 14,),
                          child: Icon(
                            Icons.shopping_cart, size: 25, color: Colors.white,)
                      ),
                    ),
                  ]
              ),
            ),
            Container(
              color: primaryColor,
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, 'login');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 40,
                      padding: const EdgeInsets.only(left: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(color: secondaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Row(
                        children: [
                          Icon(Icons.search, size: 25, color: Colors.white,)
                          ,
                          Text("  Search For Products", style: TextStyle(
                              color: Colors.white, fontSize: 15)),
                        ],
                      )
                  ),
                ),
              ),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    height: 60,
                    padding: const EdgeInsets.only(left: 5),
                    width: MediaQuery.of(context).size.width * 0.85,
                    color: Colors.white,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.subCategoryFruitModel?.result?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              TextButton(onPressed: () {

                               // controller.getSubCategoryFruit(controller.subCategoryFruitModel?.result?[index].subcategoryCatId ?? '2');
                               // controller.getSubCategoryGrid(controller.subCategoryFruitModel?.result?[index].subcategoryId ?? '2');
                              controller.getSubCategoryGrid(controller.subCategoryFruitModel?.result?[index].subcategoryId ?? "",controller.subCategoryFruitModel?.result?[index].subcategoryCatId ?? "",controller.selectedFilter);
                              controller.subcat_id_for_filter=controller.subCategoryFruitModel?.result?[index].subcategoryId ?? "";
                                controller.color= controller.subCategoryFruitModel?.result?[index].subcategoryId ?? '2';
                                print("${id}==========================================================================================");
                                print("${controller.subCategoryFruitModel?.result?[index].subcategoryCatId ?? ""}==========================================================================================");

                                controller.update();
                              },
                                  child: Container(
                                    //color: Colors.green,
                                    margin:  EdgeInsets.only(left: 5,right: 5),
                                    child: Text(controller.subCategoryFruitModel?.result?[index].subcategoryName??"not", style:  TextStyle(
                                      color:  controller.color ==  controller.subCategoryFruitModel?.result?[index].subcategoryId ? primaryColor:Colors.grey,
                                      fontSize:  controller.size ==  controller.subCategoryFruitModel?.result?[index].subcategoryId ?20:16,
                                    ),),
                                  ))
                            ],
                          );
                        }
                    )
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(context: context, builder: (BuildContext context) {

                      return StatefulBuilder(builder:(context ,StateSetter setState){
                        return   SimpleDialog(
                            contentPadding: EdgeInsets.zero,
                            children :[
                              Column(
                                children: [
                                  ListTile(leading: const Icon(
                                    Icons.thumb_up_off_alt_outlined,
                                    color: Colors.black, size: 25,),
                                      trailing: Radio(value:"",
                                          activeColor: primaryColor,
                                          groupValue:  controller.selectedFilter,
                                          onChanged: (value) {
                                            setState((){
                                              controller.selectedFilter = value!;
                                            });

                                          }),
                                      title: const Text("Recommended", style: TextStyle(
                                          fontSize: 18, color: Colors.black),)),


                                  ListTile(leading: const Icon(
                                    Icons.fiber_new_rounded, color: Colors.black,
                                    size: 25,),
                                      trailing: Radio(value: "new_products",
                                          groupValue:  controller.selectedFilter,
                                          activeColor: primaryColor,
                                          onChanged: (value) {

                                            setState((){
                                              controller.selectedFilter = value!;
                                            });


                                          }),
                                      title: const Text("New Arrivals", style: TextStyle(
                                          fontSize: 18, color: Colors.black),)),
                                  ListTile(leading: const Icon(
                                    Icons.arrow_upward_sharp, color: Colors.black,
                                    size: 25,),
                                      trailing: Radio(value: "price_high_to_low",
                                          groupValue:  controller.selectedFilter,
                                          activeColor: primaryColor,
                                          onChanged: (value) {

                                            setState((){
                                              controller.selectedFilter = value!;
                                            });



                                          }),
                                      title: const Text("Price (High To Low)",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),)),
                                  ListTile(leading: const Icon(
                                    Icons.arrow_downward_sharp, color: Colors.black,
                                    size: 25,),
                                      trailing: Radio(value: "price_low_to_high",
                                          groupValue:  controller.selectedFilter,
                                          activeColor: primaryColor,
                                          onChanged: (value) {

                                            setState((){
                                              controller.selectedFilter = value!;
                                            });


                                          }),
                                      title: const Text("Price (Low To High)",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),)),
                                  ListTile(leading: const Icon(
                                    Icons.sort_outlined, color: Colors.black,
                                    size: 25,),
                                      trailing: Radio(value: "a_to_z",
                                          groupValue:  controller.selectedFilter,
                                          activeColor: primaryColor,
                                          onChanged: (value) {

                                            setState((){
                                              controller.selectedFilter = value!;
                                            });

                                          }),
                                      title: const Text("Name (A To Z)", style: TextStyle(
                                          fontSize: 18, color: Colors.black),)),
                                  ListTile(leading: const Icon(
                                    Icons.sort_outlined, color: Colors.black,
                                    size: 25,),
                                      trailing: Radio(value:"z_to_a",
                                          groupValue:  controller.selectedFilter,
                                          activeColor: primaryColor,
                                          onChanged: (value) {

                                            setState((){
                                              controller.selectedFilter = value!;
                                            });


                                          }),
                                      title: const Text("Name (Z To A)", style: TextStyle(
                                          fontSize: 18, color: Colors.black),)),
                                  ListTile(leading: const Icon(
                                    Icons.discount_outlined, color: Colors.black,
                                    size: 25,),
                                      trailing: Radio(value: "discount_high_to_low",
                                          groupValue:  controller.selectedFilter,
                                          activeColor: primaryColor,
                                          onChanged: (value) {

                                            setState((){
                                              controller.selectedFilter = value!;
                                            });

                                          }),
                                      title: const Text("Discount (High To Low)",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),)),
                                  ListTile(leading: const Icon(
                                    Icons.discount_outlined, color: Colors.black,
                                    size: 25,),
                                      trailing: Radio(value: "discount_low_to_high",
                                          groupValue: controller.selectedFilter,
                                          activeColor: primaryColor,
                                          onChanged: (value) {

                                            setState((){
                                              controller.selectedFilter = value!;
                                            });

                                          }),
                                      title: const Text("Discount (Low To High)",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),)),
                                  //TextButton(onPressed:(){} ,style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red)),child: Text("Apply"),)

                                  GestureDetector(
                                    onTap: () {
                                     // Navigator.pop(context);
                                      controller.getSubCategoryGrid(controller.subcat_id_for_filter,controller.subCategoryFruitModel?.result?[0].subcategoryCatId ?? '',controller.selectedFilter);
                                      controller.update();
                                      Get.back();
                                    },
                                    child: Container(
                                        decoration: const BoxDecoration(
                                            color: primaryColor,
                                            borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(20),
                                                bottomLeft: Radius.circular(20))),
                                        child: const ListTile(title: Row(
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
                  child: Container(height: 60,
                    width: MediaQuery.of(context).size.width * 0.15,
                    color: Colors.white,
                    child: Container(
                        decoration: BoxDecoration(border: Border(left: BorderSide(
                            color: Colors.grey.shade200, width: 2))),
                        child: const Icon(Icons.filter_alt_sharp, size: 30,)),),
                )//FILTER
              ],
            ),

            //list horiz


            Expanded(
              child: Container(
                color: Colors.grey.shade200,
                //decoration: BoxDecoration(),
                padding: const EdgeInsets.all(15),
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(padding: const EdgeInsets.only(bottom: 100), gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    childAspectRatio: 65/ 100,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                    itemCount:  controller.subCategoryGridModel?.result?.length,
                    itemBuilder: (BuildContext context, int index) {

                      return Stack(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.to(()=>MyDetail(id: controller.subCategoryGridModel?.result?[index].productId??""));
                              },
                              child: Container(
                                //height: MediaQuery.of(context).size.height/1.5,
                                decoration: BoxDecoration(
                                    color: Colors.white, borderRadius: BorderRadius
                                    .circular(12)),
                                padding: const EdgeInsets.all(5),
                                child: Stack(
                                  children: [Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 100,
                                        //  color: Colors.red,
                                        child:
                                        Image.network( controller.subCategoryGridModel?.result?[index].productImage??"",
                                          width: MediaQuery.of(context).size.width,),

                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 5,right: 5),
                                        height: 130,
                                        //color: Colors.blue,
                                        child:  Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(  controller.subCategoryGridModel?.result?[index].productName??"",maxLines: 2,overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.bold),),
                                            Text(  controller.subCategoryGridModel?.result?[index].productVariantName??"", style: const TextStyle(
                                              color: Colors.grey,),),
                                            const Text("No review added yet",
                                              style: TextStyle(fontSize: 12,
                                                color: Colors.grey,),),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Row(
                                                children: [
                                                  Text(  controller.subCategoryGridModel?.result?[index].productDiscountAmt??"",
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        color: Colors.black,)),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .only(left: 8.0),
                                                    child: Text(  controller.subCategoryGridModel?.result?[index].productMrp??"",
                                                        style: const TextStyle(
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
                                        width: MediaQuery.of(context).size.width/2.5,
                                        child:  controller.subCategoryGridModel?.result?[index].productQty != '0'
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
                                                  controller.productQuntity=int.parse(controller.subCategoryGridModel?.result?[index].productQty?? '0');

                                                  if(controller.productQuntity > 0){
                                                    controller.productQuntity--;
                                                    controller.subCategoryGridModel?.result?[index].productQty=controller.productQuntity.toString();
                                                    controller.addToCart(controller.productQuntity.toString(), controller.subCategoryGridModel?.result?[index].productId?? '0');

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
                                                controller.subCategoryGridModel?.result?[index].productQty?? '0',
                                                style: const TextStyle(fontSize: 14.0, color: Colors.white),
                                              ),
                                              IconButton(
                                                onPressed: () {

                                                  controller.productQuntity=int.parse(controller.subCategoryGridModel?.result?[index].productQty?? '0');
                                                  // print('productQuntity-----------------------------$controller.productQuntity');
                                                  controller.productQuntity++;
                                                  controller.subCategoryGridModel?.result?[index].productQty=controller.productQuntity.toString();
                                                  //print("${controller.productQuntity}77777777777777777777777777777777777777777777777777");
                                                  controller.addToCart(controller.productQuntity.toString(),controller.subCategoryGridModel?.result?[index].productId?? '0');


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
                                            if (controller.subCategoryGridModel?.result?[index].buttonText=="Add To Cart") {
                                              controller.productQuntity++;
                                              controller.subCategoryGridModel?.result?[index].productQty=controller.productQuntity.toString();
                                              controller.addToCart(controller.productQuntity.toString(), controller.subCategoryGridModel?.result?[index].productId?? '0');
                                            }
                                          },
                                          style:controller.subCategoryGridModel?.result?[index].buttonText=="Add To Cart"? ElevatedButton.styleFrom(backgroundColor: primaryColor):ElevatedButton.styleFrom(backgroundColor: Colors.red.shade500),
                                          child: Text(controller.subCategoryGridModel?.result?[index].buttonText?? "",style: TextStyle(color: Colors.white),),
                                        ),

                                      ),
                                    ],
                                  )
                                    ,
                                    Align(
                                      alignment: Alignment.topRight,
                                      child:controller.subCategoryGridModel?.result?[index].inWishlist=="true"?
                                      IconButton(onPressed: (){
                                        controller.getremovewishlist(controller.subCategoryGridModel?.result?[index].wishlistId??" ");
                                      }, icon:
                                      Icon(Icons.favorite,color: Colors.red,size: 25,))
                                          :
                                      IconButton(onPressed: (){
                                        controller.getaddwishlist(controller.subCategoryGridModel?.result?[index].productId??" ");
                                      }, icon:
                                      Icon(Icons.favorite_border_outlined,size: 25,)),
                                    ),


                                  ],
                                ),
                              ),
                            ),
                            controller.subCategoryGridModel?.result?[index].percentageDiscount!=""?
                            Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green.shade800,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12))),
                                  height: 30,
                                  width: 65,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, left: 3),
                                    child: Text(  controller.subCategoryGridModel?.result?[index].percentageDiscount??"",
                                      style: const TextStyle(color: Colors.white),),
                                  ),
                                )):SizedBox()
                          ]
                      );
                    }),
              ),
            )

          ],
        ),
      );
  },
    );
  }
}

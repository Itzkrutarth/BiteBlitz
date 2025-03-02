


import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../CartScreen/cart_view.dart';
import '../HomeScreen/home_view.dart';
import '../MoreScreen/more_view.dart';
import '../ProductdetailScreen/productdetail_view.dart';
import '../ProfileScreen/profile_view.dart';
import './/colors.dart';
import 'search_controller.dart';

class MySearch extends StatelessWidget {
   MySearch({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SearchCon(),
      builder: (SearchCon controller) {
        return Scaffold(
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(color: primaryColor,),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height/5,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height/16),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text("Search",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:7.0,left: 20,right: 20),
                        child: Container(
                          height: MediaQuery.of(context).size.height/17,
                          decoration: BoxDecoration(color:secondaryColor,borderRadius: BorderRadius.circular(50)),

                          child:  ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Icon(Icons.search),
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TextField(onChanged: (v){

                                controller.getSearchModel(controller.searchProduct.text);
                              },controller: controller.searchProduct,decoration: InputDecoration(hintText: "Search For Products",border: InputBorder.none),),
                            ),
                          ),

                        ),
                      )
                    ],
                  ),
                ),
                controller.searchProduct.text.isEmpty?
                SizedBox()
                    :  Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    child: GridView.builder(padding: const EdgeInsets.only(bottom: 100), gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                        childAspectRatio: 65/ 100,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15),
                        itemCount:controller.searchModel?.result?.length,
                        itemBuilder: (BuildContext context, int index) {

                          return Stack(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Get.to(()=>MyDetail(id:controller.searchModel?.result?[index].productId??""));

                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/1.5,
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
                                            Image.network(controller.searchModel?.result?[index].productImage??"",
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
                                                Text(controller.searchModel?.result?[index].productName??"",maxLines: 2,overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: primaryColor,
                                                      fontWeight: FontWeight.bold),),
                                                Text(controller.searchModel?.result?[index].productVariantName??"", style: const TextStyle(
                                                  color: Colors.grey,),),
                                                const Text("No review added yet",
                                                  style: TextStyle(fontSize: 12,
                                                    color: Colors.grey,),),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 8.0),
                                                  child: Row(
                                                    children: [
                                                      Text("₹${controller.searchModel?.result?[index].productDiscountAmt??""}",
                                                          style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight
                                                                .bold,
                                                            color: Colors.black,)),
                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .only(left: 8.0),
                                                        child: Text(controller.searchModel?.result?[index].productMrp??"",
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
                                            child: controller.searchModel?.result?[index].productQty != "0"
                                                ? Container(
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

                                                      controller.productQuntity=int.parse(controller.searchModel?.result?[index].productQty?? '0');

                                                      if(controller.productQuntity > 0){
                                                        controller.productQuntity--;
                                                        controller.searchModel?.result?[index].productQty=controller.productQuntity.toString();
                                                        controller.addToCart(controller.productQuntity.toString(), controller.searchModel?.result?[index].productId ?? '');

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
                                                    controller.searchModel?.result?[index].productQty ?? 'gggh'  ,
                                                    style: const TextStyle(fontSize: 14.0, color: Colors.white),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      controller.productQuntity=int.parse(controller.searchModel?.result?[index].productQty??"");
                                                      // print('productQuntity-----------------------------$controller.productQuntity');
                                                      controller.productQuntity++;
                                                      controller.searchModel?.result?[index].productQty=controller.productQuntity.toString();
                                                      //print("${controller.productQuntity}77777777777777777777777777777777777777777777777777");
                                                      controller.addToCart(controller.productQuntity.toString(), controller.searchModel?.result?[index].productId??"");
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
                                                if (controller.searchModel?.result?[index].buttonText=="Add To Cart") {
                                                  controller.productQuntity++;
                                                  controller.searchModel?.result?[index].productQty=controller.productQuntity.toString();
                                                  controller.addToCart(controller.productQuntity.toString(), controller.searchModel?.result?[index].productId??"");
                                                }
                                              },
                                              style:controller.searchModel?.result?[index].buttonText=="Add To Cart"? ElevatedButton.styleFrom(backgroundColor: primaryColor):ElevatedButton.styleFrom(backgroundColor: Colors.red.shade500),
                                              child: Text(controller.searchModel?.result?[index].buttonText??"",style: TextStyle(color: Colors.white),),
                                            ),

                                          ),










                                        ],
                                      )
                                        ,
                                        // Align(
                                        //   alignment: Alignment.topRight,
                                        //   child: controller.searchModel?.result?[index].inWishlist=="true"?
                                        //   IconButton(onPressed: (){
                                        //     // controller.getremovewishlist(??" ");
                                        //   }, icon: const Icon(Icons.favorite,color: Colors.red,size: 30,))
                                        //       :
                                        //   IconButton(onPressed: (){
                                        //     //controller.getaddwishlist(controller.searchModel?.result?[index].productId??" ");
                                        //   }, icon: const Icon(Icons.favorite_border_outlined,size: 30,)
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                 controller.searchModel?.result?[index].percentageDiscount!=""?
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
                                        child: Text(controller.searchModel?.result?[index].percentageDiscount??"",
                                          style: const TextStyle(color: Colors.white),),
                                      ),
                                    ))
                                    :SizedBox()
                              ]
                          );
                        }),
                  ),
                ),
                //data goes here
              ],
            ),
          ),
          //search + seaarch product + data



        );
      },

    );
  }
}



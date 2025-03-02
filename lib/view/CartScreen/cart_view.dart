
import 'package:biteblitz/view/CartScreen/cart_controller.dart';
import 'package:biteblitz/view/CartScreen/delivery_view.dart';
import 'package:biteblitz/view/SearchScreen/serach_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../colors.dart';

import '../HomeScreen/home_view.dart';
import '../MoreScreen/more_view.dart';
import '../ProductdetailScreen/productdetail_view.dart';
import '../ProfileScreen/profile_view.dart';
import 'cartcoupon_view.dart';

class MyCart extends GetView<CartCon> {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {


    return

      GetBuilder(
        init: CartCon(),
          didUpdateWidget: (oldWidget, state) {
            debugPrint('HomeView__ didUpdateWidget');
          },
          didChangeDependencies: (state) {
            debugPrint('HomeView__ didChangeDependencies');
           // controller.pullToRefresh();
          },
        builder: (CartCon controller){
       return controller.loading==true?const Center(child: SpinKitHourGlass(color: primaryColor,size: 50,)):
       RefreshIndicator(

         onRefresh: () {
           return controller.getCart();
         },
         child: Scaffold(resizeToAvoidBottomInset: false,
           body:
           SafeArea(
             child: Container(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                     height: MediaQuery.of(context).size.height/14.5,
                     width: double.infinity,
                     decoration: const BoxDecoration(color: primaryColor),
                     child: const Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("My Cart",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold)),
                       ],
                     ),
                   ),//search
                   controller.cartModel!.result!.isNotEmpty?
                   Expanded(
                     child: Container(
                       padding: const EdgeInsets.all(10),
                       decoration: BoxDecoration(color: Colors.grey.shade200),
                       child: SingleChildScrollView(
                         physics: const AlwaysScrollableScrollPhysics(),
                         scrollDirection: Axis.vertical,
                         child:Column(
                           children: [
                             Container(
                                 color: Colors.white,
                                 child:ListView.separated(
                                   physics: const NeverScrollableScrollPhysics(),
                                   shrinkWrap: true,
                                   itemCount:controller.cartModel?.result?.length ?? 0,
                                   separatorBuilder: (BuildContext context, int index) {
                                     return Divider(
                                       height:0,
                                       color: Colors.grey.shade200,
                                     );
                                   },
                                   itemBuilder: (context, int index) {
                                     return GestureDetector(
                                       onTap: (){
                                         Get.to(()=>MyDetail(id:controller.cartModel?.result?[index].cartProductId??""));

                                       },
                                       child: Container(
                                         // color: Colors.red,
                                         child:
                                         ListTile(
                                           // Your existing ListTile content
                                           //contentPadding: EdgeInsets.symmetric(horizontal: 5),
                                           leading: Image.network(controller.cartModel?.result?[index].productImage??"", fit: BoxFit.fitHeight),
                                           title: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text(
                                                 controller.cartModel?.result?[index].productName??"",
                                                 style: const TextStyle(
                                                   color: primaryColor,
                                                   fontWeight: FontWeight.bold,
                                                 ),
                                               ),
                                               Row(
                                                 children: [
                                                   Text(
                                                     controller.cartModel?.result?[index].productDiscountAmt??"",
                                                     style: const TextStyle(
                                                       fontSize: 16,
                                                       fontWeight: FontWeight.bold,
                                                       color: Colors.black,
                                                     ),
                                                   ),
                                                   Padding(
                                                     padding: const EdgeInsets.only(left: 8.0),
                                                     child: Text(
                                                       controller.cartModel?.result?[index].productMrp??"",
                                                       style: const TextStyle(
                                                         color: Colors.grey,
                                                         decoration: TextDecoration.lineThrough,
                                                         decorationColor: Colors.grey,
                                                       ),
                                                     ),
                                                   )
                                                 ],
                                               ),
                                               Text(
                                                 controller.cartModel?.result?[index].productVariantName??"",
                                                 style: const TextStyle(
                                                   color: Colors.grey,
                                                 ),
                                               ),
                                               Container(
                                                 //color: Colors.red,
                                                 // padding: const EdgeInsets.only(
                                                 //     left: 8, right: 20),
                                                   height: 35,
                                                   width: MediaQuery.of(context).size.width/3.8,
                                                   child:
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

                                                               controller.productQuntity=int.parse(controller.cartModel?.result?[index].productQuantity ?? '0');
                                                               if(controller.productQuntity > 0){
                                                                 controller.productQuntity--;
                                                                 controller.addToCart(controller.productQuntity.toString(), controller.cartModel?.result?[index].cartProductId ?? '');
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
                                                           controller.cartModel?.result?[index].productQuantity?? 'gggh'  ,
                                                           style: const TextStyle(fontSize: 14.0, color: Colors.white),
                                                         ),
                                                         IconButton(
                                                           onPressed: () {


                                                             controller.productQuntity=int.parse(controller.cartModel?.result?[index].productQuantity ?? '0');

                                                               print('product-----------------------------$controller.productQuntity');
                                                               controller.productQuntity++;

                                                               print('productQuntity-----------------------------$controller.productQuntity');


                                                               controller.addToCart(controller.productQuntity.toString(), controller.cartModel?.result?[index].cartProductId ?? '');
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
                                               ),
                                             ],
                                           ),
                                           trailing: IconButton(
                                             onPressed: () {

                                                 int productQuntity=int.parse(controller.cartModel?.result?[index].productQuantity??"");
                                                 productQuntity=0;
                                                 print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                                                 print(productQuntity);
                                                 controller.addToCart(productQuntity.toString(), controller.cartModel?.result?[index].cartProductId ?? '');
                                                 controller.update();
                                             },
                                             icon: const Icon(Icons.delete, color: primaryColor),
                                           ),
                                         ),
                                       ),
                                     );
                                   },
                                 )
                             ),
                             const SizedBox(height: 7),
                             GestureDetector(
                               onTap: (){
                                 print("click done!!!!!!!");
                                 Get.to(()=> MyCartCoupon());
                               },
                               child: controller.cartModel?.couponCodeStatus !="1"?
                               Container(
                                 color: Colors.white,
                                 child: const ListTile(
                                   leading: Icon(Icons.price_change_rounded,color: Colors.black),
                                   title: Text("Apply Coupon",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                   trailing: Icon(Icons.arrow_right_sharp),


                                 ),
                               )
                                   :
                               Container(
                                 color: Colors.white,
                                 child: ListTile(
                                   leading: const Icon(Icons.price_change_rounded,color: Colors.black),
                                   title: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [
                                       const Text("Remove Coupon Code",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                       Text(controller.cartModel?.error??"",style: TextStyle(color: Colors.green.shade700,fontSize: 14),),
                                     ],
                                   ),
                                   trailing: IconButton(icon:const Icon(Icons.cancel_outlined),onPressed:
                                   (){
                                  //  controller.argumentData[0]="";
                                    controller.getCart();
                                    // Get.to(()=>MyCart(),arguments: [""]);
                                   }
                                     ,color: Colors.red,),

                                 ),
                               )
                             ),
                             const SizedBox(height: 7),
                             Container(
                                 color: Colors.white,
                                 padding: const EdgeInsets.all(10),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         const Text("MRP Total",style: TextStyle(fontSize: 16,color: Colors.grey)),
                                         Text(controller.cartModel?.totalMrp??"",style: const TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.bold)),
                                       ],
                                     ),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         const Text("Discount",style: TextStyle(fontSize: 16,color: Colors.grey)),
                                         Text(controller.cartModel?.discount??"",style: const TextStyle(fontSize: 16,color: Colors.green,fontWeight: FontWeight.bold)),

                                       ],
                                     ),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         const Text("NET Amount",style: TextStyle(fontSize: 16,color: Colors.grey)),
                                         Text(controller.cartModel?.subTotal??"",style: const TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.bold)),

                                       ],
                                     ),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         const Text("Coupon Discount",style: TextStyle(fontSize: 16,color: Colors.grey)),
                                         Text(controller.cartModel?.couponDiscount??"",style: const TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.bold)),

                                       ],
                                     ),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         const Text("Point Used",style: TextStyle(fontSize: 16,color: Colors.grey)),
                                         Text(controller.cartModel?.pointUsed??"",style: const TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.bold)),

                                       ],
                                     ),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         const Text("Delivery Charges",style: TextStyle(fontSize: 16,color: Colors.grey)),
                                         Text(controller.cartModel?.deliveryCharge??"",style: const TextStyle(fontSize: 16,color: Colors.green,fontWeight: FontWeight.bold)),

                                       ],
                                     ),
                                     Container(
                                       margin: const EdgeInsets.only(top: 7,bottom: 7),
                                       height: 2,
                                       width: MediaQuery.of(context).size.width/1.2,
                                       decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.green,width: 2))),
                                     ),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         const Text("Total Payable",style: TextStyle(fontSize: 16,color: Colors.green)),
                                         Text(controller.cartModel?.totalAmount??"",style: const TextStyle(fontSize: 16,color: Colors.green,fontWeight: FontWeight.bold)),

                                       ],
                                     ),


                                   ],
                                 )
                             ),
                             const SizedBox(height: 7),
                             Padding(
                               padding: const EdgeInsets.only(top: 20.0),
                               child: Container(
                                 height: 50,
                                 width: MediaQuery.of(context).size.width/1.1,
                                 decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(12)),
                                 child: TextButton(onPressed: (){
                                   Get.to(()=>const MyDelivery());
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHome(offer_id:controller.savingDaysModel?.result?[index].offerProductIds ?? "", offer_title: '',)));
                                 },
                                     child: const Text('NEXT',style: TextStyle(color: Colors.white,fontSize: 15),)
                                 ),
                               ),
                             )

                           ],
                         ) ,
                       ),
                     ),
                   )
                       :
                   Expanded(
                     child: Container(
                         color: Colors.grey.shade200,
                         // height: MediaQuery.of(context).size.height/,
                         child: Image.asset("assets/no_product_cart.png",scale: 1.5,)
                     ),
                   ),

                 ],
               ),
             ),
           ),






         ),
       );
    });
  }
}

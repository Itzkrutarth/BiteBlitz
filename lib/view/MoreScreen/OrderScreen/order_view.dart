import 'package:biteblitz/Widgets/customnavbar.dart';
import 'package:biteblitz/view/CartScreen/cart_view.dart';
import 'package:biteblitz/view/MoreScreen/OrderScreen/OrderDetailScreen/orderdetail_view.dart';
import 'package:biteblitz/view/MoreScreen/OrderScreen/order_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../colors.dart';
import '../../CartScreen/cart_controller.dart';

class MyOrderList extends StatelessWidget {
  const MyOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));

    return GetBuilder(
      init: OrderCon(),
      builder: (OrderCon controller) {

        return Scaffold(
          body: controller.loading == true ? const Center(
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
                        child: const Padding(
                            padding: EdgeInsets.only(
                                left: 20, top: 85, bottom: 14, right: 80),
                            child: Icon(
                              Icons.arrow_back, size: 25, color: Colors
                                .white,)
                        ),
                      ),

                      const Align(
                        alignment: Alignment.center,
                        child:
                        Padding(
                          padding: EdgeInsets.only(
                              left: 0, top: 80, bottom: 14),
                          child: Text("Order List", style: TextStyle(
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

                  padding: const EdgeInsets.all(10),

                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.zero,
                      itemCount: controller.orderModel?.result?.length,
                      itemBuilder:(BuildContext context,int index){
                        return InkWell(
                          onTap: (){
                            Get.to(()=>MyOrderDetail(inv_id: controller.orderModel?.result?[index].invoiceId??"",));
                            print("-=-=-=-=-=-=-=-=-=-=${controller.orderModel?.result?[index].invoiceId??""}");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 5),
                           // padding: EdgeInsets.only(left: 10,right: 10),
                            decoration: const BoxDecoration( color: Colors.white),
                            // height: MediaQuery.of(context).size.height/6,
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Container(
                                color: Colors.grey.shade100,
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.watch_later_outlined),
                                        //Text(controller.orderModel?.result?[index].cDate??""),
                                        const SizedBox(width: 10,),
                                        Text(controller.orderModel?.result?[index].cDate??"",style: const TextStyle(color: Colors.grey,fontSize: 16),)
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(border: Border.all(color:controller.orderModel?.result?[index].invoiceStatus!="Pending"? Colors.green:Colors.red),borderRadius: const BorderRadius.all(Radius.circular(5))),
                                      child: Text(controller.orderModel?.result?[index].invoiceStatus??"",style: TextStyle(color:controller.orderModel?.result?[index].invoiceStatus!="Pending"? Colors.green:Colors.red),),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: Row(children: [

                                  Text(controller.orderModel?.result?[index].orderId??"",style: const TextStyle(fontSize: 20),)
                                ],),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: Row(children: [
                                  Text(controller.orderModel?.result?[index].invoiceTotalAmount??"",style: const TextStyle(fontSize: 20),),
                                  Text(controller.orderModel?.result?[index].totalItem??"",style: const TextStyle(fontSize: 20),)
                                ],),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Text(controller.orderModel?.result?[index].bottomText??"",style: const TextStyle(color: Colors.grey,fontSize: 16),),
                                    GestureDetector(
                                      onTap: (){
                                        controller.getRepeatOrder(controller.orderModel?.result?[index].invoiceId??"");
                                        controller.update();

                                        Get.offAll(const CustomBottomNavigationBar(2));

                                      },
                                        child: const Text("Repeat Order",style: TextStyle(color: primaryColor,fontSize: 16),))
                                  ],),
                              )

                              ],
                            ),
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

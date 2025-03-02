import 'package:biteblitz/view/MoreScreen/OrderScreen/OrderDetailScreen/orderdetail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../colors.dart';
import '../../../CartScreen/cartcoupon_view.dart';
import '../../../CartScreen/delivery_view.dart';
import '../../../ProductdetailScreen/productdetail_view.dart';

class MyOrderDetail extends StatelessWidget {
  final String inv_id;

  const MyOrderDetail({super.key, required this.inv_id});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));
    return GetBuilder(
        init: OrderDetailCon(inv_id),
        builder: (OrderDetailCon controller) {

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
                            child: Text("Order Detail", style: TextStyle(
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
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.grey.shade200,),
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child:Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(controller.orderDetailModel?.generalInfo[0].invoiceNum??"",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                    Text(controller.orderDetailModel?.generalInfo?[0].invoiceStatus??"",style: TextStyle(color: controller.orderDetailModel?.generalInfo?[0].invoiceStatus!="Pending"?Colors.green:Colors.orange,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Text("Customer Name",style: TextStyle(fontSize: 16),),
                                Text(controller.orderDetailModel?.generalInfo?[0].invoiceAddress??"",style: TextStyle(color: Colors.grey.shade500),),
                                Text(controller.orderDetailModel?.generalInfo?[0].invoiceMobile??"",style: TextStyle(fontSize: 16),),
                              ],
                            ),
                          ),
                          SizedBox(height: 7),
                          Container(
                              color: Colors.white,
                              child:ListView.separated(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:controller.orderDetailModel!.result!.length,
                                separatorBuilder: (BuildContext context, int index) {
                                  return Divider(
                                    height:0,
                                    color: Colors.grey.shade200,
                                  );
                                },
                                itemBuilder: (context, int index) {
                                  return Container(
                                    // color: Colors.red,
                                    child:
                                    ListTile(
                                      // Your existing ListTile content
                                      //contentPadding: EdgeInsets.symmetric(horizontal: 5),
                                      leading: Image.network(controller.orderDetailModel?.result?[index].productImage??"", fit: BoxFit.fitHeight),
                                      title: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width/2,
                                                child: Text(
                                                  controller.orderDetailModel?.result?[index].detailProductName??"",
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    color: primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(controller.orderDetailModel?.result?[index].detailTotalPayable??"")
                                            ],
                                          ),
                                          Text(
                                            controller.orderDetailModel?.result?[index].detailProductVariantName??"",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                controller.orderDetailModel?.result?[index].detailQuantity??"",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text("X", style: TextStyle(
                                                color: Colors.black,
                                              ),),
                                              Text(
                                                controller.orderDetailModel?.result?[index].detailTotalPayable??"",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),




                                        ],
                                      ),

                                    ),
                                  );
                                },
                              )
                          ),
                          SizedBox(height: 7),
                          Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("MRP Total",style: TextStyle(fontSize: 16,color: Colors.grey)),
                                      Text(controller.orderDetailModel?.generalInfo[0].mrp??"",style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Discount",style: TextStyle(fontSize: 16,color: Colors.grey)),
                                      Text(controller.orderDetailModel?.generalInfo[0].discount??"",style: TextStyle(fontSize: 16,color: Colors.green,fontWeight: FontWeight.bold)),

                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("NET Amount",style: TextStyle(fontSize: 16,color: Colors.grey)),
                                      Text(controller.orderDetailModel?.generalInfo[0].totalAmount??"",style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.bold)),

                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Coupon Discount",style: TextStyle(fontSize: 16,color: Colors.grey)),
                                      Text(controller.orderDetailModel?.generalInfo[0].invoiceCouponCodeDiscount??"",style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.bold)),

                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Point Used",style: TextStyle(fontSize: 16,color: Colors.grey)),
                                      Text(controller.orderDetailModel?.generalInfo[0].pointDiscount??"",style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.bold)),

                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Delivery Charges",style: TextStyle(fontSize: 16,color: Colors.grey)),
                                      Text(controller.orderDetailModel?.generalInfo[0].deliveryCharges??"",style: TextStyle(fontSize: 16,color: Colors.green,fontWeight: FontWeight.bold)),

                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 7,bottom: 7),
                                    height: 2,
                                    width: MediaQuery.of(context).size.width/1.2,
                                    decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.green,width: 2))),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total Payable",style: TextStyle(fontSize: 16,color: Colors.green)),
                                      Text(controller.orderDetailModel?.generalInfo[0].netAmount??"",style: TextStyle(fontSize: 16,color: Colors.green,fontWeight: FontWeight.bold)),

                                    ],
                                  ),


                                ],
                              )
                          ),
                          SizedBox(height: 7),
                          controller.orderDetailModel?.generalInfo?[0].invoiceStatus=="Pending"?
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width/1.1,
                                decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(12)),
                                child: TextButton(onPressed: (){
                                  // Get.to(()=>MyDelivery());
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHome(offer_id:controller.savingDaysModel?.result?[index].offerProductIds ?? "", offer_title: '',)));
                                },
                                    child: Text('CANCEL ORDER',style: TextStyle(color: Colors.white,fontSize: 15),)
                                ),
                              ),
                            ):SizedBox()



                        ],
                      ) ,
                    ),
                  ),
                )




              ],


            ),


          );
        }
    );
  }
}

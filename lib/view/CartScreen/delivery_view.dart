import 'package:biteblitz/view/CartScreen/delivery_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../colors.dart';

class MyDelivery extends GetView<DeliveryController> {
  const MyDelivery({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder(
        init: DeliveryController(),
        builder: (DeliveryController controller) {
          return SafeArea(
            child: Scaffold(
              body: controller.loading==true?SpinKitHourGlass(color: primaryColor,size: 50):
              Container(
                child: Column(
                  children: [
                    Container(

                      height: MediaQuery.of(context).size.height/14.5,
                      decoration: BoxDecoration( color: primaryColor),
                      width: double.infinity,

                      child: Stack(
                          children:[
                            GestureDetector(
                              onTap: (){
                                Get.back();
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
                                child: Text("Delivery Detail",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
                              ),
                            ),]
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.grey.shade200),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Name*", style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),),
                                    SizedBox(height: 5),
                                    TextField(
                                      controller: controller.pname,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.person_outline,
                                          color: primaryColor, size: 30,),
                                        fillColor: Colors.grey.shade300,
                                        filled: true,
                                        hintText: "User Name",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                10),
                                            borderSide: BorderSide.none),
                                      ),),
                                  ],
                                ),
                              ), //name
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Email", style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),),
                                    SizedBox(height: 5),
                                    TextField(
                                      controller: controller.pemail,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email_outlined,
                                          color: primaryColor, size: 30,),
                                        fillColor: Colors.grey.shade300,
                                        filled: true,
                                        hintText: "User Email",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                10),
                                            borderSide: BorderSide.none),
                                      ),),
                                  ],
                                ),
                              ), //email
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Pincode*", style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,),),
                                    SizedBox(height: 5),
                                    TextField(
                                      controller: controller.ppin,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      maxLength: 6,
                                      decoration: InputDecoration(
                                        counter: Offstage(),
                                        prefixIcon: Icon(
                                          Icons.location_on_outlined,
                                          color: primaryColor, size: 30,),
                                        fillColor: Colors.grey.shade300,
                                        filled: true,
                                        hintText: "User Pincode",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                10),
                                            borderSide: BorderSide.none),
                                      ),),
                                  ],
                                ),
                              ), //pin
                              GestureDetector(
                                onTap: () {
                                  showDialog(context: context,
                                      builder: (BuildContext context) {
                                        return SimpleDialog(
                                          children: [citypicker()],
                                        );
                                      });
                                },
                                child: Stack(children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 20, right: 20, top: 10),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text("City*", style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),),
                                        SizedBox(height: 5),
                                        TextField(
                                          controller: controller.pcity,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.location_on_outlined,
                                              color: primaryColor, size: 30,),
                                            suffixIcon: Icon(Icons.arrow_drop_down_sharp,size: 30,),

                                            fillColor: Colors.grey.shade300,
                                            filled: true,
                                            hintText: "User Address",
                                            // labelText: controller.pcity.text,
                                            // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    10),
                                                borderSide: BorderSide.none),
                                          ),),
                                      ],
                                    ),
                                  ),
                                  Positioned(left: 20,
                                      top: 15,
                                      height: 80,
                                      width: 380,
                                      child: Container(
                                        color: Colors.transparent,)),
                                ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Address*", style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),),
                                    SizedBox(height: 5),
                                    TextField(
                                      controller: controller.paddress,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.location_on_outlined,
                                          color: primaryColor, size: 30,),
                                        fillColor: Colors.grey.shade300,
                                        filled: true,
                                        hintText: "User Address",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                10),
                                            borderSide: BorderSide.none),
                                      ),),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(context: context,
                                      builder: (BuildContext context) {
                                        return SimpleDialog(
                                          children: [slotpicker()],
                                        );
                                      });
                                },
                                child: Stack(children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 20, right: 20, top: 10),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text("Delivery Time", style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),),
                                        SizedBox(height: 5),
                                        TextField(
                                          controller: controller.pslot,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.location_on_outlined,
                                              color: primaryColor, size: 30,),
                                            suffixIcon: Icon(Icons.arrow_drop_down_sharp,size: 30,),
                                            fillColor: Colors.grey.shade300,
                                            filled: true,
                                            hintText: "Select Delivery Time",
                                            // labelText: controller.pcity.text,
                                            // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    10),
                                                borderSide: BorderSide.none),
                                          ),),
                                      ],
                                    ),
                                  ),
                                  Positioned(left: 20,
                                      top: 15,
                                      height: 80,
                                      width: 380,
                                      child: Container(
                                        color: Colors.transparent,)),
                                ],
                                ),
                              ),
                              controller.cartModel?.codPaymentStatus=="On"?
                              Container(
                                //color: Colors.red,
                                margin: EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 10),
                                decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.all(Radius.circular(12))),
                                child: RadioListTile(contentPadding: EdgeInsets.zero,value:"COD", activeColor: primaryColor,groupValue: controller.selectedPaymentMode, onChanged:(value){
                                  controller.selectedPaymentMode=value!;
                                  controller.update();
                                },
                                title: Text("Cash On Delivery"),),
                              ):SizedBox() ,

                              controller.cartModel?.onlinePaymentStatus=="On"?
                              Container(
                               // color: Colors.red,
                                margin: EdgeInsets.only(left: 20,top: 10,right: 20,bottom: 10),

                                decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.all(Radius.circular(12))),
                                child: RadioListTile(contentPadding: EdgeInsets.zero,value:"ONLINE",  activeColor: primaryColor,groupValue:controller.selectedPaymentMode, onChanged:(value){
                                  controller.selectedPaymentMode=value!;
                                  controller.update();
                                },
                                  title: Text("Pay Online"),),
                              ):SizedBox(),//Address

                              //city
            
            
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width/1.1,
                                  decoration: BoxDecoration(color: primaryColor,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: TextButton(onPressed: () {},
                                      child: Text('PLACE ORDER', style: TextStyle(
                                          color: Colors.white, fontSize: 15),)
                                  ),
                                ),
                              ), //submit
            
            
                            ],
            
                          ),
            
            
                        ),
                      ),
                    ),
            
            
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  Widget  citypicker() {
    return Container(
      height: 400,
      width: 300,
      child: Column(
        children: [
          Container(
            // height: 100,
            // color: Colors.red,
              child: TextField(
                  onChanged: (v){
                    controller.citySearchCon.text=v;
                    controller.filterCity(v.trim());
                  },
                  controller: controller.citySearchCon,
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.search_rounded),hintText: "Search"))),
          Expanded(
            child: Container(
              child: Obx(()=>
              controller.isLoading.value == true?const Center(child: CircularProgressIndicator()):
              controller.citySearchCon.text.isNotEmpty && controller.SearchListResult.isNotEmpty?
              ListView.builder(scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount:controller.SearchListResult.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(onTap: (){
                    Navigator.pop(context);
                    controller.cityval=controller.SearchListResult[index].cityName??"";
                    controller.pcity.text=controller.cityval??'';
                    controller.cityId=controller.SearchListResult[index].cityId??"";
                    controller.update();

                  },title: Text(controller.SearchListResult[index].cityName ?? ''));
                },):
              controller.citySearchCon.text.isNotEmpty && controller.SearchListResult.isEmpty?SizedBox():
              ListView.builder(scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount:controller.cityModel?.result?.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(onTap: (){
                    Navigator.pop(context);
                    controller.cityval=controller.SearchListResult[index].cityName??"";
                    controller.pcity.text=controller.cityval??'';
                    controller.cityId=controller.SearchListResult[index].cityId??"";
                    controller.update();

                  },title: Text(controller.dataList[index].cityName ?? ''));
                },),
              ),
            ),
          ),
        ],
      ),

    );
  }
  Widget  slotpicker() {
    return Container(
     // height: 400,
      width: 300,
      child: Column(
        children: [
          Container(
            child:
            ListView.builder(scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount:controller.deliverySlotModel?.result?.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(onTap: (){
                  Navigator.pop(context);

                  controller.slotval=controller.deliverySlotModel?.result?[index].deliveryTimeSlot??"";
                  controller.pslot.text=controller.slotval??'';
                  controller.cityId=controller.SearchListResult[index].cityId??"";
                  controller.update();

                },title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.deliverySlotModel?.result?[index].deliveryTimeSlot ?? ''),

                  ],
                ));
              },),

          ),
        ],
      ),

    );
  }
}




import 'dart:io';


import 'package:biteblitz/view/ProfileScreen/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';



import '../CartScreen/cart_view.dart';
import '../HomeScreen/home_view.dart';
import '../MoreScreen/more_view.dart';
import '../SearchScreen/serach_view.dart';
import './/welcome.dart';

import './/more/change_password.dart';
import './/colors.dart';


class MyProfile extends GetView<ProfileCon> {
  const MyProfile({super.key});




  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileCon(),
      builder: (ProfileCon controller) {
        return Scaffold(
          body:controller.isLoading==true?const SpinKitHourGlass(color: primaryColor,size: 50,):
          Container(
            child: Column(
              children: [
                Container(
                  color: Colors.grey.shade200,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(35)),
                    child: Container(
                      decoration: const BoxDecoration(color: primaryColor),
                      width: double.infinity,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0,top: 70,bottom: 14),
                            child: Text("My Profile",style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 15),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    showDialog(context: context, builder: (BuildContext context){
                                      return SimpleDialog(
                                        children:
                                        [imagepicker()],
                                      );
                                    });
                                  },
                                  child:
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    decoration: const BoxDecoration(shape: BoxShape.circle),
                                    height: 70,
                                    width: 70,
                                    child: controller.imagepath==null?
                                    const Icon(Icons.person_outline_rounded,size: 70,color: Colors.white,)
                                        :
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: Image.file(File(controller.imagepath!.path),scale: 2,fit: BoxFit.cover,)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(controller.profileModel?.result?[0].customerName??"",style:const TextStyle(color: Colors.white,fontSize: 20),),
                                      //SizedBox(height: 5,),
                                      Text(controller.profileModel?.result?[0].customerMobile??"",style:const TextStyle(color: Colors.white,fontSize: 20),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Name*",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                const SizedBox(height: 5),
                                TextField(
                                  controller: controller.pname,
                                  style:const TextStyle(fontWeight: FontWeight.bold),decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person_outline,color: primaryColor,size: 30,),
                                  fillColor: Colors.grey.shade300,
                                  filled: true,
                                  hintText: "User Name",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                                ),),
                              ],
                            ),
                          ),//name
                          Container(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Email",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                const SizedBox(height: 5),
                                TextField(
                                  controller: controller.pemail,
                                  style:const TextStyle(fontWeight: FontWeight.bold),decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.email_outlined,color: primaryColor,size: 30,),
                                  fillColor: Colors.grey.shade300,
                                  filled: true,
                                  hintText: "User Email",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                                ),),
                              ],
                            ),
                          ),//email
                          GestureDetector(
                            onTap: (){
                              controller.showDatePickerFun();
                            },
                            child: Stack(
                                children:[ Container(
                                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("Birth Date",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 5),
                                      TextField(
                                        controller: controller.pdob,
                                        style:const TextStyle(fontWeight: FontWeight.bold),decoration: InputDecoration(
                                        prefixIcon: const Icon(Icons.calendar_month,color: primaryColor,size: 30,),
                                        fillColor: Colors.grey.shade300,
                                        filled: true,
                                        // labelText: DateFormat('dd/MM/yyyy').format(controller.dateTime),
                                        // labelStyle:TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                                      ),),
                                    ],
                                  ),
                                ),
                                  Positioned(left: 20,top: 15,height: 80,width: 380,child: Container(color: Colors.transparent)),
                                ]
                            ),
                          ),//DOB
                          Container(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Address*",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                const SizedBox(height: 5),
                                TextField(
                                  controller: controller.paddress,
                                  maxLines: 2,style:const TextStyle(fontWeight: FontWeight.bold),decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.location_on_outlined,color: primaryColor,size: 30,),
                                  fillColor: Colors.grey.shade300,
                                  filled: true,
                                  hintText: "User Address",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                                ),),
                              ],
                            ),
                          ),//Address
                          Container(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Pincode*",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),),
                                const SizedBox(height: 5),
                                TextField(
                                  controller: controller.ppin,
                                  style:const TextStyle(fontWeight: FontWeight.bold),keyboardType: TextInputType.number,inputFormatters: [FilteringTextInputFormatter.digitsOnly],maxLength: 6,decoration: InputDecoration(
                                  counter: const Offstage(),
                                  prefixIcon: const Icon(Icons.location_on_outlined,color: primaryColor,size: 30,),
                                  fillColor: Colors.grey.shade300,
                                  filled: true,
                                  hintText: "User Pincode",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                                ),),
                              ],
                            ),
                          ),//pin
                          GestureDetector(
                            onTap: (){
                              showDialog(context: context, builder: (BuildContext context){
                                return SimpleDialog(
                                  children: [citypicker()],
                                );
                              });
                            },
                            child: Stack(children: [
                              Container(
                                padding: const EdgeInsets.only(left: 20,right: 20,top: 10),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("City*",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                    const SizedBox(height: 5),
                                    TextField(
                                      controller: controller.pcity,
                                      style:const TextStyle(fontWeight: FontWeight.bold),decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.location_on_outlined,color: primaryColor,size: 30,),
                                      fillColor: Colors.grey.shade300,
                                      filled: true,
                                      hintText: "User Address",
                                      // labelText: controller.pcity.text,
                                      // labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                                    ),),
                                  ],
                                ),
                              ),
                              Positioned(left: 20,top: 15,height: 80,width: 380,child: Container(color: Colors.transparent,)),
                            ],
                            ),
                          ),//city

                          Container(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Gender",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Radio(value: "1", groupValue:controller.selectedGender, activeColor: primaryColor,onChanged:(value){

                                      controller.selectedGender=value!;
                                      controller.update();

                                    }),
                                    const Text("Male",style: TextStyle(fontSize: 15),),
                                    Radio(value: "2", groupValue:controller.selectedGender, activeColor: primaryColor,onChanged:(value){

                                      controller.selectedGender=value!;
                                      controller.update();
                                    }),
                                    const Text("Female",style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                              ],
                            ),

                          ),//gender
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(12)),
                              child: TextButton(onPressed: (){
                                controller.getUpdateProfile();
                                print("🤣🤣🤣🤣🤣🤣🤣🤣🤣🤣🤣🤣🤣");
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content:
                                    controller.updateProfileModel?.status=="1"?
                                    const Text("Profile Updated Successfully!!"):
                                    const Text("Error While Updating Profile!!"))
                                );
                              },
                                  child: const Text('SUBMIT',style: TextStyle(color: Colors.white,fontSize: 15),)
                              ),
                            ),
                          ),//submit
                          Padding(
                            padding: const EdgeInsets.only(top:25.0),
                            child: TextButton(onPressed: (){},
                                child: const Text("Delete My Account",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 17),)
                            ),
                          )//delete

                        ],

                      ),


                    ),
                  ),
                ),


              ],
            ),
          ),
        );

      },


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
  Widget  imagepicker() {
    return Container(
      //height: 100,
      width: 300,
      child: Column(
        children:<Widget>[
          ListTile(
            leading: const Icon(Icons.photo_outlined),
            title: const Text("Pick from Gallery"),
            onTap: ()async{

              var image=await controller.picker.pickImage(source: ImageSource.gallery);

              controller.imagepath=image;
              controller.update();
              // Navigator.pop(context);

            },
          ),
          ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text("Take Photo"),
              onTap: ()async{
                var image=await controller.picker.pickImage(source: ImageSource.camera);
                controller.imagepath=image;
                controller.update();
                // Navigator.pop(context);

              }
          )
        ],
      ),

    );
  }


}
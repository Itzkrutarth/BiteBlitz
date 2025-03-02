

import 'package:biteblitz/more/terms&condition.dart';
import 'package:biteblitz/view/LoginScreen/Login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Widgets/customnavbar.dart';
import 'colors.dart';


class MySignUp extends StatefulWidget {
  const MySignUp({super.key});

  @override
  State<MySignUp> createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {
  bool is_checked = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,

          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 300,),
                    Container(
                      //color: Colors.red,
                      height: MediaQuery.of(context).size.height/2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 25,right: 25),
                            // height: MediaQuery.of(context).size.height/10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white,width: 1,),
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                boxShadow:[new BoxShadow(color: Colors.grey,blurRadius:2,offset: Offset(0,0))] ),
            
                            //boxShadow: BoxShadow(color: Colors.grey,blurRadius: 2,offset: Offset(2,2))),
                            padding: EdgeInsets.only(top: 8,left: 10,right: 10,bottom: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,)),
                                TextField(decoration: InputDecoration(hintText: "Enter Name", contentPadding: EdgeInsets.symmetric(horizontal: 5),hintStyle:TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 15),border: OutlineInputBorder(borderSide: BorderSide.none)))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25,right: 25),
                            height: MediaQuery.of(context).size.height/10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white,width: 1,),
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                boxShadow:[new BoxShadow(color: Colors.grey,blurRadius:2,offset: Offset(0,0))] ),
            
                            //boxShadow: BoxShadow(color: Colors.grey,blurRadius: 2,offset: Offset(2,2))),
                            padding: EdgeInsets.only(top: 8,left: 10,right: 10,bottom: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Mobile Number",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,)),
                                TextField(keyboardType: TextInputType.number,inputFormatters: [FilteringTextInputFormatter.digitsOnly],maxLength: 10,decoration: InputDecoration(counter: Offstage(),hintText: "Enter Mobile Number", contentPadding: EdgeInsets.symmetric(horizontal: 5),hintStyle:TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 15),border: OutlineInputBorder(borderSide: BorderSide.none)))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25,right: 25),
                            height: MediaQuery.of(context).size.height/10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white,width: 1,),
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                boxShadow:[new BoxShadow(color: Colors.grey,blurRadius:2,offset: Offset(0,0))] ),
            
                            //boxShadow: BoxShadow(color: Colors.grey,blurRadius: 2,offset: Offset(2,2))),
                            padding: EdgeInsets.only(top: 8,left: 10,right: 10,bottom: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Referral Code",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,)),
                                TextField(maxLength: 15,decoration: InputDecoration(counter: Offstage(),hintText: "Enter Referral Code", contentPadding: EdgeInsets.symmetric(horizontal: 5),hintStyle:TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 15),border: OutlineInputBorder(borderSide: BorderSide.none)))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0,right: 25),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(checkColor: Colors.white,activeColor: primaryColor,value: is_checked, onChanged: (bool? value){
                                  setState(() {
                                    is_checked=value!;
                                  });
            
            
                                }),
                                Text("I have read and accept the ",style: TextStyle(color: Colors.grey.shade500),),
                                GestureDetector(onTap: (){
                                  Get.to(()=>MyTermsCondition());
                                },
                                    child: Text("Terms & Conditions",style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold),)),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(is_checked==true)
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Done")));

                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 30,right: 30),
                              width: MediaQuery.of(context).size.width/1.1,
                              height: 50,
                              decoration: BoxDecoration(color:is_checked==true? primaryColor:Colors.grey
                                 ,borderRadius: BorderRadius.all(Radius.circular(10),),
                              ),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text("GET OTP",style: TextStyle(color: Colors.white,fontSize: 18),)),
                            ),
                          ),
                        ],
                      ),
                    ),
            
                  ],
                ),
            
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Have an Account?",style: TextStyle(fontSize:16),),
                      SizedBox(width: 10),
                      GestureDetector(onTap: (){
                        Get.to(()=>MyLogin());
                      },
                          child: Text("Sign In",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize:16 ,color: primaryColor),)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

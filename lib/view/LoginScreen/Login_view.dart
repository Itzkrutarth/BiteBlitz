import 'package:biteblitz/view/LoginScreen/Login_controller.dart';
import 'package:biteblitz/view/VerifyOTPScreen/verifyotp_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../Widgets/customnavbar.dart';
import '../../colors.dart';
import '../../signup.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});



  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
      init: LoginCon(),
      builder:(LoginCon controller) {
      return Scaffold(
        body: controller.loading==true?SpinKitHourGlass(color: primaryColor,size: 50,):SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        height: MediaQuery.of(context).size.height/2,
                        width: double.infinity,
                        child: Image.asset('assets/6447.jpg')),
                    SizedBox(
                      // color: Colors.red,
                      height: MediaQuery.of(context).size.height/8,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 25,right: 25),
                            height: MediaQuery.of(context).size.height/10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white,width: 1,),
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                boxShadow:[new BoxShadow(color: Colors.grey,blurRadius:2,offset: Offset(0,0))] ),

                            //boxShadow: BoxShadow(color: Colors.grey,blurRadius: 2,offset: Offset(2,2))),
                            padding: EdgeInsets.only(top: 8,left: 10,right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Mobile Number",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,)),
                                TextField(controller: controller.cust_mob,keyboardType: TextInputType.number,inputFormatters: [FilteringTextInputFormatter.digitsOnly],maxLength: 10,decoration: InputDecoration(counter: Offstage(),hintText: "Enter Mobile Number", contentPadding: EdgeInsets.symmetric(horizontal: 5),hintStyle:TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 15),border: OutlineInputBorder(borderSide: BorderSide.none)))

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),


                    GestureDetector(
                      onTap: (){
                       controller.istap=true;
                       controller.update();
                        if(controller.cust_mob.text.length!= 10){
                          print('if callled---------------------------');
                          showDialog(context: context, builder: (BuildContext context){
                            return AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                              title: Text("Alert!!"),
                              content: Container(

                                  margin: EdgeInsets.all(5),
                                  child: Text("Please Enter 10 Digit Mobile Number.",style: TextStyle(fontSize: 16),)),
                              actions: [TextButton(onPressed: (){Get.back();},
                                  child: Text("OK",style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold),))],
                            )
                            ;
                          });
                        }

                        else{
                          controller.getUserDetailStatic();
                          Future.delayed(Duration(seconds: 10),(){
                            controller.cust_mob.text="";
                            controller.update();
                            controller.istap=false;
                          });
                        }





                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 30,right: 30),
                        width: MediaQuery.of(context).size.width/1.1,
                        height: 50,
                        decoration: BoxDecoration(color:primaryColor,borderRadius: BorderRadius.all(Radius.circular(10),),
                        ),
                        child: Align(
                            alignment: Alignment.center,
                            child:controller.istap==false?
                            Text("Next",style: TextStyle(color: Colors.white,fontSize: 18),):
                                Container(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(strokeWidth: 2,color: Colors.white),
                                )
                        ),
                      ),
                    )



                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have an Account?",style: TextStyle(fontSize:16),),
                      SizedBox(width: 10),
                      GestureDetector(onTap: (){
                        Get.to(()=>MySignUp());

                      },
                          child: Text("Sign Up",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize:16 ,color: primaryColor),)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );}
    );
  }
}

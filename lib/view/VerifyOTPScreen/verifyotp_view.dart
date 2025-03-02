import 'package:biteblitz/view/VerifyOTPScreen/verifyotp_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../colors.dart';

class MyVerifyOTP extends StatelessWidget {


   MyVerifyOTP({super.key, });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light,));
    return GetBuilder(
      init: verifyOtpCon(),
        builder:(verifyOtpCon controller) {
          return
            Scaffold(
              body:
              SafeArea(
                child:
                Column(
                    children:[
                      Column(
                        children: [
                          Container(

                            height: MediaQuery.of(context).size.height/14.5,
                            decoration: BoxDecoration( color: primaryColor),
                            width: double.infinity,

                            child: Stack(
                                children:[
                                  GestureDetector(
                                    onTap: (){
                                      Get.back();// Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMore()));
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
                                      child: Text("Verify OTP",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
                                    ),
                                  ),]
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0,bottom: 15,left: 20,right: 10),
                            child: Text("We have sent you a code via SMS , please Enter it below to verify",maxLines: 2,style: TextStyle(fontSize: 16,color: Colors.grey),),
                          ),
                          Container(
                           // height: MediaQuery.of(context).size.height,

                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.fromLTRB(20,0,20,10),
                            width: double.infinity,
                            child: Container(
                              height: 50,
                              padding: EdgeInsets.only(top: 25),
                              decoration: BoxDecoration(border: Border.all(color: primaryColor),borderRadius: BorderRadius.all(Radius.circular(12))),
                                child: TextField(keyboardType: TextInputType.number,maxLength: 6,inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],controller: controller.otpcon,decoration: InputDecoration(counter: Offstage(),hintText:"Enter OTP",border: OutlineInputBorder(borderSide: BorderSide.none)),))
                          ),
                          GestureDetector(
                            onTap: (){
                              controller.getVerifyOtp();
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 30,right: 30),
                              width: MediaQuery.of(context).size.width/1.2,
                              height: 50,
                              decoration: BoxDecoration(color:primaryColor,borderRadius: BorderRadius.all(Radius.circular(10),),
                              ),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text("VERIFY",style: TextStyle(color: Colors.white,fontSize: 18),)),
                            ),
                          ),
                        ],
                      ),

                    ]
                ),
              ),
            );
      }
    );
  }
}

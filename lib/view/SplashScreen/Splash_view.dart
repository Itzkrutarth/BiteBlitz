

import 'package:biteblitz/Widgets/customnavbar.dart';
import 'package:biteblitz/colors.dart';
import 'package:biteblitz/view/SplashScreen/Splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../LoginScreen/Login_view.dart';

class MySplash extends StatelessWidget {
  const MySplash({super.key});



  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:SplashCon() ,
      builder: (SplashCon controller) {
        return SafeArea(
          child: GestureDetector(
            onTap:(){


              Get.offAll(MyLogin());
              },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.white,primaryColor],begin: Alignment.topLeft,end: Alignment.bottomRight)),
              child: Center(child: Image.asset('assets/intro-removebg-preview.png',fit: BoxFit.contain,),
              ),
            ),
          ),
        );  },

    );
  }




}











import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashCon extends GetxController{
  String? t;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    requesttoken();

  }

  void requesttoken()async{

    _firebaseMessaging.requestPermission();
    _firebaseMessaging.getToken().then((String? token) {

      print('Device Token: $token');
      // Handle the APNS token as needed
    });


  }



}
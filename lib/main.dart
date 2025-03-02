import 'package:biteblitz/Widgets/customnavbar.dart';
import 'package:biteblitz/colors.dart';
import 'package:biteblitz/view/SplashScreen/Splash_view.dart';
import 'package:biteblitz/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'notificationservice/local_notification_service.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyAqc8fwEjJ0FlTu4cQktdRxm02tjSariwA',
          appId: '1:650814466736:android:b0757d58273cab97fe2975',
          messagingSenderId: '650814466736',
          projectId: 'biteblitz-3b668'));

  print("FIREBASE Initialized Successfully!!!");

  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();

  runApp(
    GetMaterialApp(
      theme: ThemeData(
          // You can set your primary color here
          // hintColor: Colors.red,   // Set your accent color to red
          ),
      home: MySplash(),

      debugShowCheckedModeBanner: false,
      // initialRoute: 'login',
      // routes: {
      //   '/login': (context) => MyLogin(),
      //   '/register': (context) => MySignUp(),
      //   'home': (context) => MyHome(),
      //   'search': (context) => MySearch(),
      //   'cart': (context) => MyCart(),
      //   'profile': (context) => MyProfile(),
      //   'more': (context) => MyMore(),
      // },
    ),
  );
}

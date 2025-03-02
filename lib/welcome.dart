import 'package:biteblitz/colors.dart';
import 'package:biteblitz/signup.dart';
import 'package:biteblitz/view/LoginScreen/Login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyWelcome extends StatefulWidget {
  const MyWelcome({super.key});

  @override
  State<MyWelcome> createState() => _MyWelcomeState();
}

class _MyWelcomeState extends State<MyWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height/2,
              width: double.infinity,
              child: Image.asset('assets/XYZZZ.jpg')),
          Text("Hello",style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
          Text("Welcome to BiteBlitz!!!",style: TextStyle(fontSize: 24,color: Colors.grey),),
          Container(
                margin: EdgeInsets.only(top: 25),
            height: MediaQuery.of(context).size.height/6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: 50,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3), // Set shadow color
                          blurRadius: 8,
                          offset: Offset(0, 2), // changes position of shadow
                        ),]),
                  child: TextButton(onPressed: (){
                    Future.delayed(Duration(milliseconds: 500),(){
                      Get.to(()=>MyLogin());
                    });

                  },
                           style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(primaryColor)),
                            child: Text("Login",style: TextStyle(color: Colors.white),),),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/2,
                    height: 50,
                  decoration: BoxDecoration(
                  boxShadow: [
                  BoxShadow(
                  color: Colors.grey.withOpacity(0.3), // Set shadow color
                  blurRadius: 8,
                  offset: Offset(0, 2), // changes position of shadow
                  ),]),


                  child: TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MySignUp()));
                  },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                          side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(color: primaryColor, width: 2.0),)
                    ),

                    child: Text("Sign up",style: TextStyle(fontWeight:FontWeight.bold,color: primaryColor),),),
                ),
              ],
            ),
          ),

          // Container(
          //   margin: EdgeInsets.only(top: 50),
          //   width: MediaQuery.of(context).size.width/2,
          //   height: 80,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text("Sign up using",style: TextStyle(color: Colors.grey,fontSize: 20),),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           Image.asset("assets/login_with_facebook.png"),
          //           Image.asset("assets/login_with_google.png"),
          //           Image.asset("assets/login_twitter.png"),
          //
          //         ],
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),

    );
  }
}
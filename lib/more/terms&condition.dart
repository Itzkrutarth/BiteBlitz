import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';




import '../colors.dart';

class MyTermsCondition extends StatefulWidget {
  const MyTermsCondition({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyTermsConditionState();
  }
}

class MyTermsConditionState extends State<MyTermsCondition> {
  double _scaleFactor=1.0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      body: GestureDetector(
        onScaleUpdate: (details){
          setState(() {
            _scaleFactor=details.scale;
          });
        },
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color:primaryColor,
              child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMore()));
                      },
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 80, bottom: 14, right: 80),
                          child: Icon(
                            Icons.arrow_back,
                            size: 25,
                            color: Colors.white,
                          )),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0, top: 80, bottom: 14),
                        child: Text(
                          "Terms & Condition",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
            ),
            Expanded(child: Container(
              height: double.infinity,
              width: double.infinity,
             // color: Colors.green,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left:8.0,top: 10),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text("Terms and Conditions",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16* _scaleFactor))),
                            //SizedBox(height: 14),
                            Padding(
                              padding: const EdgeInsets.only(left:2.0,top: 14),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("1. Acceptance of Terms",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16* _scaleFactor))),
                                  SizedBox(height: 14),
                                  Text("By accessing or using Foodykart ('the Website'), you agree to comply with and be bound by these Terms and Conditions. If you do not agree to these terms, please do not use the Website/app.",style: TextStyle(fontSize: 16* _scaleFactor),)
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2.0,top:14),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("2. Use of the Website/App",style: TextStyle(fontSize: 16* _scaleFactor,fontWeight: FontWeight.bold),)),
                                  SizedBox(height: 14),
                                  Text("2.1. User Accounts: You may be required to create an account to access certain features of the Website/App. You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.",style: TextStyle(fontSize: 16* _scaleFactor)),
                                  SizedBox(height: 14),
                                  Text("2.2. Prohibited Activities: You agree not to engage in any of the following activities:",style: TextStyle(fontSize: 16* _scaleFactor)),
                                  SizedBox(height: 14),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("a. Violating any applicable laws or regulations.",style: TextStyle(fontSize: 16* _scaleFactor))),
                                  SizedBox(height: 14),
                                  Text("b. Using the Website for any illegal or unauthorized purpose.",style: TextStyle(fontSize: 16* _scaleFactor)),
                                  SizedBox(height: 14),
                                  Text("c. Attempting to gain unauthorized access to the Website or its servers.",style: TextStyle(fontSize: 16* _scaleFactor)),
                                  SizedBox(height: 14),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("d. Harassing, intimidating, or harming others",style: TextStyle(fontSize: 16* _scaleFactor))),
                                  SizedBox(height: 14),
                                  Text("e. Uploading or transmitting viruses or malicious code.",style: TextStyle(fontSize: 16* _scaleFactor)),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2.0,top:14),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("3. Ordering and Payment",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16* _scaleFactor))),
                                  SizedBox(height: 14),
                                  Text("3.1. Product Availability: We make every effort to display accurate product information on the Website/App. However, product availability may change, and we do not guarantee the availability of all items listed.",style: TextStyle(fontSize: 16* _scaleFactor)),
                                  SizedBox(height: 14),
                                  Text("3.2. Pricing: Product prices are subject to change without notice. The prices displayed at the time of purchase are the prices you will be charged.",style: TextStyle(fontSize: 16* _scaleFactor))

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2.0,top:14),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("4. Shipping and Returns",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16* _scaleFactor))),
                                  SizedBox(height: 14),
                                  Text("Please refer to our Shipping and Returns Policy for details on shipping, delivery, and returns.",style: TextStyle(fontSize: 16* _scaleFactor))

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2.0,top:14),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("5. Privacy",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16* _scaleFactor))),
                                  SizedBox(height: 14),
                                  Text("Your use of the Website is also governed by our Privacy Policy, which explains how we collect, use, and protect your personal information.",style: TextStyle(fontSize: 16* _scaleFactor))

                                ],
                              ),
                            ),

                          ],
                        )
                    )
                  ],
                ),
              )


            )
            )
          ],
        ),
      )
    );
  }
}
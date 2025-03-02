import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



import '../colors.dart';

class MyPrivacyPolicy extends StatefulWidget {
  const MyPrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyPrivacyPolicyState();
  }
}

class MyPrivacyPolicyState extends State<MyPrivacyPolicy> {
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
                    "Privacy Policy",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white),
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
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
                              child: Text("1.Introduction",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16* _scaleFactor))),
                          SizedBox(height: 14),
                        Text("Welcome to BiteBlitz('we','us', or 'our').We are committed to protecting your privacy and providing a safe and secure online experience for all of our users . This Privacy Policy explains how we collect, use, disclose, and protect your personal information when you visit our website or use our services.",style: TextStyle(fontSize: 16* _scaleFactor),),
                          Padding(
                            padding: const EdgeInsets.only(left:2.0,top: 14),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                    child: Text("2.Information We Collect",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16* _scaleFactor))),
                                SizedBox(height: 14),
                                Text("2.1. Personal Information: We may collect personal information such as your name, email address, phone number, shipping address when you create an account, place an order, or communicate with us.",style: TextStyle(fontSize: 16* _scaleFactor),),
                                SizedBox(height: 14),
                                Text("2.2. Automatically Collected Information: We may collect certain information automatically, including your device information when you use our website/app.",style: TextStyle(fontSize: 16* _scaleFactor),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0,top:14),
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("3.How We Use Your Information",style: TextStyle(fontSize: 16* _scaleFactor,fontWeight: FontWeight.bold),)),
                                SizedBox(height: 14),
                                Text("We use your personal information for the following purposes:",style: TextStyle(fontSize: 16* _scaleFactor)),
                               SizedBox(height: 14),
                               Text("3.1. To process and fulfill orders you place on our website.",style: TextStyle(fontSize: 16* _scaleFactor)),
                               SizedBox(height: 14),
                               Text("3.2. To provide customer support and respond to your inquiries.",style: TextStyle(fontSize: 16* _scaleFactor)),
                               SizedBox(height: 14),
                               Text("3.3. To improve our website's/app functionality, content, and user experience.",style: TextStyle(fontSize: 16* _scaleFactor)),
                               SizedBox(height: 14),
                               Text("3.4. To send you updates, promotions, and newsletters (if you opt-in to receive them).",style: TextStyle(fontSize: 16* _scaleFactor)),
                                SizedBox(height: 14),
                                Text("3.5. To monitor and protect against fraudulent activities and unauthorized access to your account.",style: TextStyle(fontSize: 16* _scaleFactor))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0,top:14),
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("4.Sharing Your Information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16* _scaleFactor))),
                                SizedBox(height: 14),
                                Text("We do not sell, trade, ,or rent your personal information to third parties. However, we may share your information with:",style: TextStyle(fontSize: 16* _scaleFactor)),
                                 SizedBox(height: 14),
                                Text("4.1. Service Providers: We may share your information with third-party service providers who assist us in operating our website, processing payments, and delivering products to you.",style: TextStyle(fontSize: 16* _scaleFactor)),
                                SizedBox(height: 14),
                                Text("4.2. Legal Compliance: We may disclose your information when required by law or in response to valid legal requests.",style: TextStyle(fontSize: 16* _scaleFactor))

                                                ],
                            ),
                          )
                        ],
                        )
                    )
                  ],
                ),
              )
            ),
          )
                ],
              ),
        )
    );
  }
}


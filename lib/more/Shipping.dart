import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



import '../colors.dart';

class MyShipping extends StatefulWidget {
  const MyShipping({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyShippingState();
  }
}

class MyShippingState extends State<MyShipping> {
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
                            "Shipping & Return",
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
                                      child: Text("\tShipping Policy",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16* _scaleFactor))),
                                  SizedBox(height: 14),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("1. Order Processing and Delivery",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16* _scaleFactor))),
                                  SizedBox(height: 14),
                                  Text("1.1. Order Processing Time: Orders are typically processed within 1 business days from the date of purchase. This processing time may vary depending on factors such as order volume and product availability.",style: TextStyle(fontSize: 16* _scaleFactor),),
                                  SizedBox(height: 14),
                                  Text("1.2. Delivery Time: The estimated delivery time for your order will depend on your location and the shipping method chosen during checkout. We aim to deliver your fresh fruits and vegetables as quickly as possible to maintain their quality and freshness.",style: TextStyle(fontSize: 16* _scaleFactor),),
                                  SizedBox(height: 14),
                                  Text("1.3. Shipping Charges: Shipping charges are calculated based on the weight of your order and your delivery location. Shipping options and rates will be displayed during the checkout process.",style: TextStyle(fontSize: 16* _scaleFactor),),
                                  Padding(
                                    padding: const EdgeInsets.only(left:2.0,top: 14),
                                    child: Column(
                                      children: [
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("\tReturns and Refunds Policy",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16* _scaleFactor))),
                                        SizedBox(height: 14),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("1. Returns",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16* _scaleFactor))),
                                        SizedBox(height: 14),
                                       Text("1.1. Damaged or Defective Items: If you receive damaged or defective fruits or vegetables, please contact us within 2 days of receiving your order. We will arrange for a replacement or refund as appropriate.",style: TextStyle(fontSize: 16* _scaleFactor),),
                                        SizedBox(height: 14),
                                        Text("1.2. Incorrect Items: If you receive an incorrect item in your order, please notify us within 2 days, and we will promptly rectify the issue by sending you the correct item or issuing a refund.",style: TextStyle(fontSize: 16* _scaleFactor),)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:2.0,top: 14),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 14),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("2. Returns Process",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16* _scaleFactor))),
                                        SizedBox(height: 14),
                                        Text("2.1. To initiate a return, please contact our customer support team at support@foodykart.com.",style: TextStyle(fontSize: 16* _scaleFactor),),
                                        SizedBox(height: 14),
                                        Text("2.2. Please provide your order number, a description of the issue, and clear photographs of the damaged or incorrect items.",style: TextStyle(fontSize: 16* _scaleFactor),),
                                        SizedBox(height: 14),
                                        Text("2.3. Our customer support team will guide you through the return process and provide you with instructions on returning the items.",style: TextStyle(fontSize: 16* _scaleFactor),)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:2.0,top: 14),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 14),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("3. Refunds",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16* _scaleFactor))),
                                        SizedBox(height: 14),
                                        Text("3.1. Once we receive and inspect the returned items, we will process your refund. The refund will be issued to the original payment method used for the purchase.",style: TextStyle(fontSize: 16* _scaleFactor),),
                                        SizedBox(height: 14),
                                        Text("3.2. Refunds may take 7-10 business days to appear in your account, depending on your payment provider's processing times.",style: TextStyle(fontSize: 16* _scaleFactor),)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:2.0,top: 14),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 14),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("4. Non-Returnable Items",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16* _scaleFactor))),
                                        SizedBox(height: 14),
                                        Text("Due to the perishable nature of fruits and vegetables, we do not accept returns or offer refunds for items that are not damaged, defective, or incorrect.",style: TextStyle(fontSize: 16* _scaleFactor),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:2.0,top: 14),
                                    child: Column(
                                      children: [
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("\tReturns and Refunds Policy",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16* _scaleFactor))),
                                        SizedBox(height: 14),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("1. Returns",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16* _scaleFactor))),
                                        SizedBox(height: 14),
                                        Text("1.1. Damaged or Defective Items: If you receive damaged or defective fruits or vegetables, please contact us within 2 days of receiving your order. We will arrange for a replacement or refund as appropriate.",style: TextStyle(fontSize: 16* _scaleFactor),),
                                        SizedBox(height: 14),
                                        Text("1.2. Incorrect Items: If you receive an incorrect item in your order, please notify us within 2 days, and we will promptly rectify the issue by sending you the correct item or issuing a refund.",style: TextStyle(fontSize: 16* _scaleFactor),)
                                      ],
                                    ),
                                  ),


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


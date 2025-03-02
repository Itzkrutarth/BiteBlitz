import 'package:biteblitz/more/change_password.dart';
import 'package:biteblitz/view/MoreScreen/RecentOfferScreen/recentoffer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:clipboard/clipboard.dart';




import './/more/change_password.dart';
import './/colors.dart';


class MyRecentoffer extends StatelessWidget {
  const MyRecentoffer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));

    return GetBuilder(
      init: RecentOfferCon(),
        builder: (RecentOfferCon controller) {
      return Scaffold(
        body: controller.loading==true?SpinKitHourGlass(color: primaryColor,size: 50,):
        Container(
          color: Colors.grey.shade200,
          child: Column(
            children: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 7,
                width: double.infinity,
                color: primaryColor,
                child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMore()));
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 85, bottom: 14, right: 80),
                            child: Icon(
                              Icons.arrow_back, size: 25, color: Colors.white,)
                        ),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child:
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0, top: 80, bottom: 14),
                          child: Text("Coupon Code List", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white),),
                        ),
                      ),
                    ]
                ),
              ),
              Container(
                color: Colors.grey.shade200,
                margin: EdgeInsets.all(10),
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Colors.white,),
                  //height: 500,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.couponModel?.result?[0].couponTitle??"",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                color: primaryColor,
                                height: 35,
                                child: TextButton(onPressed: () {},
                                    child: Text(controller.couponModel?.result?[0].couponCode??"",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),))),
                            Container(
                                color: primaryColor,
                                height: 35,
                                child: TextButton(onPressed: () {
                                  // Copy text to clipboard when button is pressed
                                  FlutterClipboard.copy(controller.couponModel?.result?[0].couponCode??"").then((
                                      value) {
                                    // Show a snackbar to indicate that text has been copied
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(
                                          'Text copied to clipboard')),
                                    );
                                  });
                                },
                                    child: Text("COPY",
                                      style: TextStyle(color: Colors.white),)))
                          ],
                        )
                      ],


                    ),
                  ),
                ),
              ),
            ],


          ),
        ),


      );
    }
    );
  }
}

import 'package:biteblitz/more/change_password.dart';
import 'package:biteblitz/view/MoreScreen/ReferScreen/refer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';




import './/more/change_password.dart';
import './/colors.dart';



class MyRefer extends StatelessWidget {
  const MyRefer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));

    return GetBuilder(
        init: ReferCon(),
        builder: (ReferCon controller){
      return Scaffold(
        body:controller.loading==true?SpinKitHourGlass(color: primaryColor,size: 50): Column(
          children: [
            Container(
              width: double.infinity,
              color: primaryColor,
              child: Stack(

                  children:[
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMore()));
                      },
                      child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 80, bottom: 14,right: 80),
                          child: Icon(Icons.arrow_back,size: 25,color: Colors.white,)
                      ),
                    ),

                    Align(
                      alignment: Alignment.center,
                      child:
                      Padding(
                        padding: const EdgeInsets.only(left: 0, top: 80, bottom: 14),
                        child: Text("Refer & Earn",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
                      ),
                    ),]
              ),
            ),
            Container(
              child: Column(
                children: [
                  Image.network(controller.referModel?.image??"",height: 300,width: 350),
                  Text(controller.referModel?.title??"",style: TextStyle(color: primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(controller.referModel?.text??"",style: TextStyle(color: Colors.grey.shade600),),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 25),
                      decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(controller.referModel?.result?[0].customerReferralCode??"",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      )),

                  Container(
                      margin: EdgeInsets.only(top: 40),
                      decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(onPressed: (){
                          Share.share(controller.referModel?.shareText??" ");
                        },child: Text("Share Your Code",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: primaryColor),)),
                      ))
                ],
              ),
            )
          ],
        )
        ,
      );
    }
    );
  }
}



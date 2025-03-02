import 'dart:convert';

import 'package:biteblitz/Widgets/customnavbar.dart';
import 'package:biteblitz/more/change_password.dart';
import 'package:biteblitz/more/terms&condition.dart';

import 'package:biteblitz/view/MoreScreen/OrderScreen/order_view.dart';
import 'package:biteblitz/view/MoreScreen/WishlistScreen/wishlist_view.dart';
import 'package:biteblitz/view/SplashScreen/Splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';


import '../../more/Shipping.dart';
import '../../more/blog.dart';
import '../../more/recent_offer.dart';
import '../CartScreen/cart_view.dart';
import '../HomeScreen/home_view.dart';
import '../ProfileScreen/profile_view.dart';
import '../SearchScreen/serach_view.dart';
import './/Model/CartModel.dart';

import './/welcome.dart';
import './/more/refer_earn.dart';

import './/more/change_password.dart';
import './/colors.dart';
import './/more/privacy_policy.dart';
import './/more/contact_us.dart';
import 'package:http/http.dart' as http;

import 'BlogScreen/blog_view.dart';
import 'PointScreen/point_view.dart';
import 'RecentOfferScreen/recentoffer_view.dart';
import 'ReferScreen/refer_view.dart';
import 'more_controller.dart';

class MyMore extends StatelessWidget {
  const MyMore({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
      init: MoreController(),
      builder: (MoreController controller) {
        return Scaffold(
          body:Container(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        color: primaryColor,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 0, top: 80, bottom: 14),
                              child: Text(
                                "More",textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child:Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10,top:10,right: 15),
                              //decoration: BoxDecoration(color: Colors.red),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Get.offAll(CustomBottomNavigationBar(0));
                                    },
                                    child: Stack(
                                        children:[
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 15.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Card(
                                                      elevation: 3,

                                                      color: Colors.white,
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                                                      child: Container(
                                                          height:50,
                                                          width: 50,
                                                          child: Icon(Icons.home_outlined,color: primaryColor,size: 28,)),
                                                    ),
                                                    Text("   Home",style: TextStyle(fontSize: 20),),
                                                  ],
                                                ),
                                                Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                                              ],
                                            ),
                                          ),

                                          Container(height: 65,color: Colors.transparent)
                                        ]
                                    ),
                                  ),//home
                                  GestureDetector(
                                    onTap: (){
                                      print("sfggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg");
                                      Get.offAll(()=>CustomBottomNavigationBar(3));
                                      //Get.to(MyProfile());

                                    },
                                    child: Stack(
                                        children:[
                                          Padding(
                                          padding: const EdgeInsets.only(bottom: 15.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(

                                                children: [
                                                  Card(
                                                    elevation: 3,
                                                    color: Colors.white,
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                                                    child: Container(
                                                        height: 50,
                                                        width: 50,
                                                        child: Icon(Icons.person_outline,color: primaryColor,size: 28,)),
                                                  ),
                                                  Text("   My Profile",style: TextStyle(fontSize: 20),),
                                                ],
                                              ),
                                              Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                                            ],
                                          ),
                                        ),
                                          Container(color: Colors.transparent,height: 65,)]
                                    ),
                                  ),//profile
                                  GestureDetector(
                                    onTap: ()
                                    {
                                      Get.to(()=>MyOrderList());
                                    },
                                    child: Stack(
                                      children:[
                                        Padding(
                                        padding: const EdgeInsets.only(bottom: 15.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(

                                              children: [
                                                Card(
                                                  elevation: 3,
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                                                  child: Container(
                                                      height: 50,
                                                      width: 50,
                                                      child: Icon(Icons.list,color: primaryColor,size: 28,)),
                                                ),
                                                Text("   My Orders",style: TextStyle(fontSize: 20),),
                                              ],
                                            ),
                                            Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                                          ],
                                        ),
                                      ),
                                        Container(height: 65,color: Colors.transparent),
                                      ]
                                    ),
                                  ),//order
                                  GestureDetector(
                                    onTap: (){
                                      Get.to(()=>MyWishlist());
                                    },
                                    child: Stack(
                                      children: [
                                        Padding(
                                        padding: const EdgeInsets.only(bottom: 15.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(

                                              children: [
                                                Card(
                                                  elevation: 3,
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                                                  child: Container(
                                                      height: 50,
                                                      width: 50,
                                                      child: Icon(Icons.add_shopping_cart_rounded,color: primaryColor,size: 28,)),
                                                ),
                                                Text("   My Wishlist",style: TextStyle(fontSize: 20),),
                                              ],
                                            ),
                                            Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                                          ],
                                        ),
                                      ),
                                        Container(height: 65,color: Colors.transparent),
                                       ]
                                    ),

                                  ),//wishlist
                                  GestureDetector(
                                    onTap: (){
                                      Get.to(()=>MyPoint());                                    },
                                    child: Stack(
                                        children:[
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 15.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(

                                                  children: [
                                                    Card(
                                                      elevation: 3,
                                                      color: Colors.white,
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                                                      child: Container(
                                                          height: 50,
                                                          width: 50,
                                                          child: Icon(Icons.attach_money,color: primaryColor,size: 28,)),
                                                    ),
                                                    Text("   My Points",style: TextStyle(fontSize: 20),),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                        height: 35,
                                                        width: 55,
                                                        decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(12)),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            controller.isnotdone==false?
                                                            Text(controller.pointModel?.customerPoint ??"",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),):
                                                            SpinKitFadingCircle(color: Colors.white,size: 20,)
                                                            //  TextField(controller: show,readOnly: true,)
                                                          ],
                                                        )),
                                                    Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                                                  ],
                                                ),

                                              ],
                                            ),
                                          ),
                                          Container(height: 65,color: Colors.transparent),]),
                                  ),//points
                                  GestureDetector(
                                    onTap: (){
                                      Get.offAll(CustomBottomNavigationBar(2));                                    },
                                    child: Stack(
                                        children:[ Padding(
                                          padding: const EdgeInsets.only(bottom: 15.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(

                                                children: [
                                                  Card(
                                                    elevation: 3,
                                                    color: Colors.white,
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                                                    child: Container(
                                                        height: 50,
                                                        width: 50,
                                                        child: Icon(Icons.shopping_cart_outlined,color: primaryColor,size: 28,)),
                                                  ),
                                                  Text("   My Cart",style: TextStyle(fontSize: 20),),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                      height: 40,
                                                      width: 35,
                                                      decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(12)),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                         controller.isnotdone==false?
                                                          Text(controller.cartModel?.result?.length.toString()??"",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),):
                                                             SpinKitFadingCircle(color: Colors.white,size: 20,)
                                                        ],
                                                      )),
                                                  Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                          Container(color: Colors.transparent,height: 65,)]
                                    ),
                                  ),//cart
                                  GestureDetector(
                                    onTap: (){
                                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyChangePass()));
                                      Get.to(()=>MyRecentoffer());
                                    },
                                    child: Stack(
                                      children:[
                                        Padding(
                                        padding: const EdgeInsets.only(bottom: 15.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Card(
                                                  elevation: 3,
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                                                  child: Container(
                                                      height: 50,
                                                      width: 50,
                                                      child: Icon(Icons.local_offer_outlined,color: primaryColor,size: 28,)),
                                                ),
                                                Text("   Recent Offers",style: TextStyle(fontSize: 20),),
                                              ],
                                            ),
                                            Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                                          ],
                                        ),
                                      ),
                                        Container(height: 65,color: Colors.transparent),
                                      ]
                                    ),
                                  ),//recent-offer
                                  Container(height:1,color: Colors.grey.shade300),//change_password
                                  GestureDetector(
                                    onTap: (){
                                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyRefer()));
                                      Get.to(MyRefer());
                                    },
                                    child: Stack(
                                        children:[ Padding(
                                          padding: const EdgeInsets.only(bottom: 15.0,top: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(

                                                children: [
                                                  Card(
                                                    elevation: 3,
                                                    color: Colors.white,
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                                                    child: Container(
                                                        height: 50,
                                                        width: 50,
                                                        child: Icon(Icons.card_giftcard_outlined,color: primaryColor,size: 28,)),
                                                  ),
                                                  Text("   Refer & Earn",style: TextStyle(fontSize: 20),),
                                                ],
                                              ),
                                              Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                                            ],
                                          ),
                                        ),Container(color: Colors.transparent,height: 65,)]
                                    ),
                                  ),//refer&earn
                                  GestureDetector(
                                    onTap: (){
                                     //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyChangePass()));
                                      Get.to(MyChangePass());
                                    },

                                    child: Stack(
                                        children:[ Padding(
                                          padding: const EdgeInsets.only(bottom: 15.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(

                                                children: [
                                                  Card(
                                                    elevation: 3,
                                                    color: Colors.white,
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                                                    child: Container(
                                                        height: 50,
                                                        width: 50,
                                                        child: Icon(Icons.lock_clock_outlined,color: primaryColor,size: 28,)),
                                                  ),
                                                  Text("   Change Password",style: TextStyle(fontSize: 20),),
                                                ],
                                              ),
                                              Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                                            ],
                                          ),
                                        ),
                                          Container(color: Colors.transparent,height: 65,)
                                        ]
                                    ),
                                  ),
                                  Container(height:1,color: Colors.grey.shade300),//change_password
                                  GestureDetector(

                                    onTap: (){
                                      Get.to(()=>MyTermsCondition());
                                    },
                                    child: Stack(
                                      children: [
                                        Padding(
                                        padding: const EdgeInsets.only(bottom: 15.0,top:10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(

                                              children: [
                                                Card(
                                                  elevation: 3,
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                                                  child: Container(
                                                      height: 50,
                                                      width: 50,
                                                      child: Icon(Icons.menu,color: primaryColor,size: 28,)),
                                                ),
                                                Text("   Terms & Conditions",style: TextStyle(fontSize: 20),),
                                              ],
                                            ),
                                            Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                                          ],
                                        ),
                                      ),
                                        Container(height: 65,color: Colors.transparent),

                                      ]
                                    ),
                                  ),//terms&con
                                  GestureDetector(
                                    onTap:(){
                                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPrivacyPolicy()));
                                      Get.to(MyPrivacyPolicy());
                                    },
                                    child: Stack(
                                        children:[ Padding(
                                          padding: const EdgeInsets.only(bottom: 15.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(

                                                children: [
                                                  Card(
                                                    elevation: 3,
                                                    color: Colors.white,
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                                                    child: Container(
                                                        height: 50,
                                                        width: 50,
                                                        child: Icon(Icons.verified_user_outlined,color: primaryColor,size: 28,)),
                                                  ),
                                                  Text("   Privacy Policy",style: TextStyle(fontSize: 20),),
                                                ],
                                              ),
                                              Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                                            ],
                                          ),
                                        ),Container(color: Colors.transparent,height: 65,)]
                                    ),
                                  ),//privacypolicy
                                  GestureDetector(

                                    onTap: (){
                                      Get.to(()=>MyShipping());
                                    },
                                    child: Stack(
                                      children:[
                                        Padding(
                                        padding: const EdgeInsets.only(bottom: 15.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(

                                              children: [
                                                Card(
                                                  elevation: 3,
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                                                  child: Container(
                                                      height: 50,
                                                      width: 50,
                                                      child: Icon(Icons.local_shipping_outlined,color: primaryColor,size: 28,)),
                                                ),
                                                Text("   Shipping & Return",style: TextStyle(fontSize: 20),),
                                              ],
                                            ),
                                            Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                                          ],
                                        ),
                                      ),
                                        Container(height: 65,color: Colors.transparent),

                                      ]
                                    ),
                                  ),//shipping&retrurn
                                  GestureDetector(
                                    onTap: (){

                                    },

                                    child: Stack(
                                      children:[
                                        Padding(
                                        padding: const EdgeInsets.only(bottom: 15.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(

                                              children: [
                                                Card(
                                                  elevation: 3,
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                                                  child: Container(
                                                      height: 50,
                                                      width: 50,
                                                      child: Icon(Icons.info_outline,color: primaryColor,size: 28,)),
                                                ),
                                                Text("   About Us",style: TextStyle(fontSize: 20),),
                                              ],
                                            ),
                                            Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                                          ],
                                        ),
                                      ),
                                        Container(height: 65,color: Colors.transparent),

                                      ]
                                    ),
                                  ),//aboutus
                                  GestureDetector(
                                    onTap:(){
                                      Get.to(MyContact());
                                      //Navigator.push(context,MaterialPageRoute(builder: (context)=>MyContact()));
                                      },
                                    child: Stack(
                                        children:[ Padding(
                                          padding: const EdgeInsets.only(bottom: 15.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(

                                                children: [
                                                  Card(
                                                    elevation: 3,
                                                    color: Colors.white,
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                                                    child: Container(
                                                        height: 50,
                                                        width: 50,
                                                        child: Icon(Icons.contact_mail_outlined,color: primaryColor,size: 28,)),
                                                  ),
                                                  Text("   Contact Us",style: TextStyle(fontSize: 20),),
                                                ],
                                              ),
                                              Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                                            ],
                                          ),
                                        ),Container(color: Colors.transparent,height: 65,)]
                                    ),
                                  ),//contactus
                                  GestureDetector(
                                    onTap:(){
                                      Get.to(MyBlog());
                                      //Navigator.push(context,MaterialPageRoute(builder: (context)=>MyContact()));
                                    },
                                    child: Stack(
                                      children: [
                                        Padding(
                                        padding: const EdgeInsets.only(bottom: 15.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(

                                              children: [
                                                Card(
                                                  elevation: 3,
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                                                  child: Container(
                                                      height: 50,
                                                      width: 50,
                                                      child: Icon(Icons.message_outlined,color: primaryColor,size: 28,)),
                                                ),
                                                Text("   Blog List",style: TextStyle(fontSize: 20),),
                                              ],
                                            ),
                                            Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                                          ],
                                        ),
                                      ),
                                      Container(height: 65,color: Colors.transparent),
                                            ]
                                     ),
                                  ),//bloglist
                                  Container(height:1,color: Colors.grey.shade300),
                                  GestureDetector(
                                    onTap: (){
                                      controller.removeUser();
                                      //controller.setString("", "", "");
                                      Get.to(MySplash());
                                      //Navigator.push(context,MaterialPageRoute(builder: (context)=>MyWelcome()));
                                    },
                                    child: Stack(
                                        children:[
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 15.0,top: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(

                                                  children: [
                                                    Card(
                                                      elevation: 3,
                                                      color: Colors.white,
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                                                      child: Container(
                                                          height: 50,
                                                          width: 50,
                                                          child: Icon(Icons.exit_to_app_outlined,color: primaryColor,size: 28,)),
                                                    ),
                                                    Text("   Logout",style: TextStyle(fontSize: 20),),
                                                  ],
                                                ),
                                                Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                                              ],
                                            ),
                                          ),
                                          Container(color: Colors.transparent,height: 65,)]
                                    ),
                                  ),//logout
                                  Container(height:1,color: Colors.grey.shade300),//change_password
                                //logo
                                  //change_password




                                ],
                              ),
                            )
                          ],
                        )

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

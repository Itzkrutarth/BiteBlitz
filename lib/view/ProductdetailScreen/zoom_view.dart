import 'dart:convert';

import 'package:biteblitz/view/ProductdetailScreen/zoom_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:photo_view/photo_view.dart';



import './/Model/add_to_cart_modal.dart';
import './/Model/subcategoryfruit.dart';
import './/Model/subcategorygrid.dart';
import './/Model/subcategorylist.dart';
import 'package:http/http.dart' as http;


import './/Model/subcategorymodel.dart';
import './/colors.dart';
class MyZoom extends StatelessWidget {

  final String zoom_id;
  const MyZoom({super.key,required this.zoom_id});



  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ZoomCon(zoom_id),
    builder: (ZoomCon controller) {
      return Scaffold(
        body: controller.loading == true ? const Center(
            child: SpinKitHourGlass(color: primaryColor, size: 50,)) :
        Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          color: Colors.white,
          padding: EdgeInsets.only(top: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.grey,
                      size: 45,
                    ),
                    label: Text("")),
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 1.5,
                //height: MediaQuery.of(context).size.height,
                // width: double.infinity,
                child: PageView.builder(
                    onPageChanged: (val) {

                       controller.currentPage = val;
                       controller.largeindex = val;
                       controller.update();
                    },
                    scrollDirection: Axis.horizontal,
                    controller: controller.pageController,
                    itemCount: controller.productModel?.result?[0]
                        .productMultipleImagesArray?.length,
                    itemBuilder: (context, index) {
                      return PhotoView(imageProvider: NetworkImage(
                          controller.productModel?.result?[0]
                              .productMultipleImagesArray?[index].image ??
                              "medam"),
                        minScale: PhotoViewComputedScale.contained,
                        maxScale: PhotoViewComputedScale.covered * 2,
                        backgroundDecoration: BoxDecoration(
                            color: Colors.white),
                      );
                    }),
              ),
              Container(
                width: double.infinity,
                height: 100,
                // padding: EdgeInsets.all(8),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.productModel?.result?[0]
                        .productMultipleImagesArray?.length,
                    itemBuilder: (BuildContext context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              print('call ontap');

                              controller.largeindex = index;

                              controller.updateMainImage(index);

                             controller.update();

                            },
                            child: Container(
                              padding: EdgeInsets.all(3),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: index == controller.currentPage
                                          ? primaryColor
                                          : Colors.grey,
                                      width: 1.5)),
                              child:
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(controller.productModel?.result?[0]
                                      .productMultipleImagesArray?[index]
                                      .image ?? "medam")
                              ),
                            ),
                          )
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      );
    },
    );
  }
}


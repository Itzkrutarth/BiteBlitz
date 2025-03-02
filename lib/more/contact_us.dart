import 'package:flutter/material.dart';

import '../colors.dart';

class MyContact extends StatefulWidget {
  const MyContact({super.key});

  @override
  State<MyContact> createState() => _MyContactState();
}

class _MyContactState extends State<MyContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: primaryColor,
            child: Stack(children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMore()));
                },
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 80, bottom:14, right: 80),
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
                    "Contact Us",
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
                color: primaryColor,
            child: SingleChildScrollView(
              child:Container(
               //margin: EdgeInsets.only(top: 0),
                decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),border: Border.all(color: primaryColor)),
                padding: EdgeInsets.only(top:60,left:15,right:15,bottom: 200),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,bottom: 5,top: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height/10.7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white,width: 1,),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow:[new BoxShadow(color: Colors.grey,blurRadius:2,offset: Offset(0,0))] ),

                        //boxShadow: BoxShadow(color: Colors.grey,blurRadius: 2,offset: Offset(2,2))),
                        padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,)),
                            TextField(decoration: InputDecoration(hintText: "Enter Name", contentPadding: EdgeInsets.symmetric(horizontal: 5),hintStyle:TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 15),border: OutlineInputBorder(borderSide: BorderSide.none)))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,bottom: 5,top: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height/10.7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white,width: 1,),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow:[new BoxShadow(color: Colors.grey,blurRadius:2,offset: Offset(0,0))] ),

                        //boxShadow: BoxShadow(color: Colors.grey,blurRadius: 2,offset: Offset(2,2))),
                        padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Mobile Number",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,)),
                            TextField(decoration: InputDecoration(hintText: "Enter Mobile Number", contentPadding: EdgeInsets.symmetric(horizontal: 5.0),hintStyle:TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 15),border: OutlineInputBorder(borderSide: BorderSide.none)))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,bottom: 5,top: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height/10.7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white,width: 1,),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow:[new BoxShadow(color: Colors.grey,blurRadius:2,offset: Offset(0,0))] ),

                        //boxShadow: BoxShadow(color: Colors.grey,blurRadius: 2,offset: Offset(2,2))),
                        padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Email",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,)),
                            TextField(decoration: InputDecoration(hintText: "Enter Email", contentPadding: EdgeInsets.symmetric(horizontal: 5.0),hintStyle:TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 15),border: OutlineInputBorder(borderSide: BorderSide.none)))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,bottom: 5,top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white,width: 1,),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow:[new BoxShadow(color: Colors.grey,blurRadius:2,offset: Offset(0,0))] ),

                        //boxShadow: BoxShadow(color: Colors.grey,blurRadius: 2,offset: Offset(2,2))),
                        padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Message",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16)),
                            TextField(maxLines: 4,decoration: InputDecoration(hintText: "Enter Message",contentPadding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5),hintStyle:TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 15),border: OutlineInputBorder(borderSide: BorderSide.none)))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Container(
                        height: 50,
                        width: 350,
                        decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(12)),
                        child: TextButton(onPressed: (){},
                            child: Text('CONTACT US',style: TextStyle(color: Colors.white,fontSize: 15),)
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}

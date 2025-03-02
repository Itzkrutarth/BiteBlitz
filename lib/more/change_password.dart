import 'package:flutter/material.dart';
import 'package:flutter/services.dart';





import '../colors.dart';

class MyChangePass extends StatefulWidget {
  const MyChangePass({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyChangePassState();
  }
}


class MyChangePassState extends State<MyChangePass> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
        body: Column(
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
                        child: Text("Change Passoword",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
                      ),
                    ),]
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(top: 2,left: 7,right: 7,bottom: 7),
                child: SingleChildScrollView(
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
                              Text("Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,)),
                              TextField(decoration: InputDecoration(hintText: "Enter Password", contentPadding: EdgeInsets.symmetric(horizontal: 5),hintStyle:TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 15),border: OutlineInputBorder(borderSide: BorderSide.none)))
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
                              Text("New Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,)),
                              TextField(decoration: InputDecoration(hintText: "Enter New Password", contentPadding: EdgeInsets.symmetric(horizontal: 5),hintStyle:TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 15),border: OutlineInputBorder(borderSide: BorderSide.none)))
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
                              Text("Confirm Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,)),
                              TextField(decoration: InputDecoration(hintText: "Enter Confirm Password", contentPadding: EdgeInsets.symmetric(horizontal: 5),hintStyle:TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 15),border: OutlineInputBorder(borderSide: BorderSide.none)))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(12)),
                          child: TextButton(onPressed: (){},
                              child: Text('CHANGE PASSWORD',style: TextStyle(color: Colors.white,fontSize: 15),)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
    );
  }

}
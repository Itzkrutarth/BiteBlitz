import 'package:flutter/material.dart';


class CustomDialog extends StatelessWidget {
  final Widget? message;
  final Widget? title;
  final VoidCallback? onpressedYes;
  final VoidCallback? onpressedNo;
  final bool isLogin;

  const CustomDialog(
      {super.key,
        this.message,
        this.onpressedYes,
        this.onpressedNo,
        this.isLogin=false,
        required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius
              .all(
              Radius.circular(
                  10.0)
          )),
      backgroundColor: Colors.white,
      title: title,
      content: message,
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              backgroundColor: Colors.red),
          onPressed: onpressedNo,
          child:isLogin?const Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ):
          const Text(
            'No',
            style: TextStyle(color: Colors.white),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              backgroundColor: Colors.green),
          onPressed: onpressedYes,
          child: isLogin ?const Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ):
          const Text(
            'Yes',
            style: TextStyle(color: Colors.white),
          ),
        ),

      ],
    );
  }
}
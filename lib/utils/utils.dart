import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void showFlash(BuildContext context, dynamic message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      icon: Icon(Icons.error),
      backgroundColor: Colors.blue,
      title: "Message",
      message: message,
      animationDuration: Duration(milliseconds: 100),

      duration: Duration(seconds: 3),
    ).show(context);
  }

  //toast message
  static void toastMessage(dynamic message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_LEFT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showMySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

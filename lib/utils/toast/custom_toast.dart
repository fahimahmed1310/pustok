import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast{
  static void toastShower(String msg, Color color){
    Fluttertoast.showToast(
      msg:msg,
      fontSize: 16,
      timeInSecForIosWeb: 1,
      textColor: Colors.black,
      backgroundColor: color,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}

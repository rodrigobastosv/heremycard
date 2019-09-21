import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MCUiUtils {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showSimpleDialog(
      {BuildContext context, Widget title, List<Widget> children}) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: title,
        children: children,
      ),
    );
  }
}

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

  static void showSnackBar(GlobalKey<ScaffoldState> key, String message, [Function undoAction]) {
    key.currentState
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          action: undoAction != null ? SnackBarAction(
            label: 'UNDO',
            onPressed: undoAction,
          ) : null,
        ),
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

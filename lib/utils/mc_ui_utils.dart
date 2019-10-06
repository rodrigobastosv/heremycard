import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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

  static void showSnackBar(GlobalKey<ScaffoldState> key, String message,
      [Function undoAction]) {
    key.currentState
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          action: undoAction != null
              ? SnackBarAction(
                  label: 'UNDO',
                  onPressed: undoAction,
                )
              : null,
        ),
      );
  }

  static Future<dynamic> showSimpleDialog(
      {BuildContext context, Widget title, List<Widget> children}) {
    dynamic response = showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: title,
        children: children,
        titlePadding: const EdgeInsets.only(top: 16.0, left: 16.0),
      ),
    );
    return response;
  }

  static void showColorPicker(
      {BuildContext context, Color pickedColor, Function onPickColor}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickedColor,
            onColorChanged: (color) {
              onPickColor(color);
            },
            enableLabel: true,
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('PICK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  static Widget buildInfoRow(IconData icon, String text, int fontSize, int fontColor, [Color color]) {
    if (text == null || text.isEmpty) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: color,
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize.toDouble(),
              color: Color(fontColor),
            ),
          ),
        ],
      ),
    );
  }
}

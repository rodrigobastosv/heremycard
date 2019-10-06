import 'package:flutter/material.dart';
import 'package:heremycard/enum/layout.dart';

class LayoutPicked with ChangeNotifier {
  Layout _layout;

  void setLayout(Layout l) {
    _layout = l;
    notifyListeners();
  }

  Layout getLayout() {
    return _layout;
  }
}
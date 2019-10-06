import 'package:flutter/material.dart';
import 'package:heremycard/model/card_model.dart';

class BasicWithProfileAndBrand extends StatelessWidget {
  BasicWithProfileAndBrand({@required this.card});

  final CardModel card;
  int get fontColor => card.fontColor;
  int get fontSize => card.fontSize;

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
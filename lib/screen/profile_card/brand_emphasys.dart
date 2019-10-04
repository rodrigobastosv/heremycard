import 'package:flutter/material.dart';
import 'package:heremycard/model/card_model.dart';

class BrandEmphasys extends StatelessWidget {
  BrandEmphasys({@required this.card});

  final CardModel card;
  int get fontColor => card.fontColor;
  int get fontSize => card.fontSize;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

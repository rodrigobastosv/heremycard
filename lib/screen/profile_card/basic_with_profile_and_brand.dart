import 'dart:io';

import 'package:flutter/material.dart';
import 'package:heremycard/model/card_model.dart';
import 'package:heremycard/utils/mc_ui_utils.dart';
import 'package:heremycard/utils/mc_utils.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BasicWithProfileAndBrand extends StatelessWidget {
  BasicWithProfileAndBrand({@required this.card});

  final CardModel card;
  int get fontColor => card.fontColor;
  int get fontSize => card.fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: MCUtils.getImageProviderByPathOrDefault(
            card.backgroundImagePath,
            'assets/logo.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: MediaQuery.of(context).size.height / 4,
                      child: Image.file(
                        File(card.brandImagePath),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 140.0,
                        height: 140.0,
                        child: Hero(
                          tag: card.id,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(70.0),
                            child: MCUtils.getImageByPathOrDefault(
                              card.profileImagePath,
                              'assets/person.jpeg',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: <Widget>[
                        Text('Rodrigo Bastos Vasconcelos',
                            style: TextStyle(
                                color: Color(card.fontColor),
                                fontWeight: FontWeight.bold,
                                fontSize: card.fontSize.toDouble())),
                        Text(card.profession,
                            style: TextStyle(
                                color: Color(card.fontColor),
                                fontSize: (card.fontSize - 3).toDouble())),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: <Widget>[
                MCUiUtils.buildInfoRow(Icons.email, card.email, fontSize, fontColor, Colors.red[800]),
                MCUiUtils.buildInfoRow(Icons.phone, card.phone, fontSize, fontColor),
                MCUiUtils.buildInfoRow(MdiIcons.whatsapp, card.whatsapp, fontSize, fontColor, Colors.green),
              ],
            )
          ],
        ),
      ),
    );
  }
}

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 240.0,
                  height: 180.0,
                  child: MCUtils.getImageByPathOrDefault(
                    card.brandImagePath,
                    'assets/brand.jpg',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100.0,
                        height: 100.0,
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
                      Container(
                        constraints: BoxConstraints(
                          minWidth: 200.0,
                          maxWidth: 260.0,
                        ),
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Wrap(
                          direction: Axis.vertical,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: <Widget>[
                            Text(
                              card.name,
                              style: TextStyle(
                                color: Color(card.fontColor),
                                fontWeight: FontWeight.bold,
                                fontSize: card.fontSize.toDouble(),
                              ),
                            ),
                            Text(
                              card.profession,
                              style: TextStyle(
                                color: Color(card.fontColor),
                                fontSize: (card.fontSize - 3).toDouble(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MCUiUtils.buildInfoRow(
                  Icons.email,
                  card.email,
                  fontSize,
                  fontColor,
                  Colors.red[800],
                ),
                MCUiUtils.buildInfoRow(
                  Icons.phone,
                  card.phone,
                  fontSize,
                  fontColor,
                ),
                MCUiUtils.buildInfoRow(
                  MdiIcons.whatsapp,
                  card.whatsapp,
                  fontSize,
                  fontColor,
                  Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

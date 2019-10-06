import 'package:flutter/material.dart';
import 'package:heremycard/model/card_model.dart';
import 'package:heremycard/utils/mc_ui_utils.dart';
import 'package:heremycard/utils/mc_utils.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BasicWithProfile extends StatelessWidget {
  BasicWithProfile({@required this.card});

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
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  SizedBox(
                    height: 16.0,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        card.name,
                        style: TextStyle(
                          fontSize: fontSize.toDouble(),
                          fontWeight: FontWeight.bold,
                          color: Color(fontColor),
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        card.profession,
                        style: TextStyle(
                          fontSize: fontSize.toDouble() - 6.0,
                          fontWeight: FontWeight.w500,
                          color: Color(fontColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MCUiUtils.buildInfoRow(Icons.email, card.email, fontSize, fontColor, Colors.red[800]),
                  MCUiUtils.buildInfoRow(Icons.phone, card.phone, fontSize, fontColor),
                  MCUiUtils.buildInfoRow(MdiIcons.whatsapp, card.whatsapp, fontSize, fontColor, Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

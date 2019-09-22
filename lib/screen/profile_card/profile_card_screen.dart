import 'dart:io';
import 'dart:ui';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:heremycard/model/card_model.dart';
import 'package:heremycard/utils/mc_utils.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:path_provider/path_provider.dart';

class ProfileCardScreen extends StatefulWidget {
  ProfileCardScreen(this.card);

  final CardModel card;

  @override
  _ProfileCardScreenState createState() => _ProfileCardScreenState(card);
}

class _ProfileCardScreenState extends State<ProfileCardScreen> {
  _ProfileCardScreenState(this.card);

  final GlobalKey globalKey = GlobalKey();
  final CardModel card;

  int get fontColor => card.fontColor;
  int get fontSize => card.fontSize;

  File _file;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepaintBoundary(
        key: globalKey,
        child: Container(
          key: UniqueKey(),
          child: buildContent(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          RenderRepaintBoundary boundary =
              globalKey.currentContext.findRenderObject();
          final image = await boundary.toImage();
          final byteData = await image.toByteData(format: ImageByteFormat.png);
          final pngBytes = byteData.buffer.asUint8List();
          final directory = (await getApplicationDocumentsDirectory()).path;

          await Share.file(
              'Card Image', 'here_my_card.png', pngBytes, 'image/png',
              text: 'Here\'s my card.');

          setState(() {
            _file = new File('$directory/screenshot.png');
            _file.writeAsBytes(pngBytes);
          });
        },
        child: Icon(Icons.share),
      ),
    );
  }

  Widget buildContent() {
    if (_file == null) {
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
                    _buildInfoRow(
                        Icons.email, card.email, Colors.red[800]),
                    _buildInfoRow(Icons.phone, card.phone),
                    _buildInfoRow(MdiIcons.whatsapp, card.whatsapp,
                        Colors.green),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Container(
      child: Center(
        child: Image.file(_file),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, [Color color]) {
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

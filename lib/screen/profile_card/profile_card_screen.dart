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

  final CardModel card;

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
    GlobalKey globalKey = GlobalKey();
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
          var image = await boundary.toImage();
          var byteData = await image.toByteData(format: ImageByteFormat.png);
          var pngBytes = byteData.buffer.asUint8List();
          final directory = (await getApplicationDocumentsDirectory()).path;

          await Share.file('esys image', 'esys.png', pngBytes, 'image/png',
              text: 'My optional text.');

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
        decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
              image: MCUtils.getImageProviderByPathOrDefault(
                  card.backgroundImagePath, 'assets/logo.jpg'),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 120.0,
                      height: 120.0,
                      child: Hero(
                        tag: card.id,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(28.0),
                          child: MCUtils.getImageByPathOrDefault(
                            card.profileImagePath,
                            'assets/person.jpeg',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 32.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          card.name,
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                        Divider(),
                        Text(
                          card.profession,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _buildInfoRow(Icons.phone, card.phone),
                    _buildInfoRow(Icons.email, card.email),
                    _buildInfoRow(
                        MdiIcons.whatsapp, card.whatsapp, Colors.green),
                  ],
                ),
              ],
            ),
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
}

Widget _buildInfoRow(IconData icon, String text, [Color color]) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: color,
          child: Icon(icon),
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(text)
      ],
    ),
  );
}

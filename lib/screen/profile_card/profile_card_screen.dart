import 'dart:io';
import 'dart:ui';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:heremycard/enum/layout.dart';
import 'package:heremycard/model/card_model.dart';
import 'package:path_provider/path_provider.dart';

import 'basic_with_profile.dart';
import 'basic_with_profile_and_brand.dart';
import 'brand_emphasys.dart';
import 'profile_emphasys.dart';

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
          child: _buildLayout(),
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

  Widget _buildLayout() {
    Layout layout = getLayoutByIndex(card.layout);

    switch (layout) {
      case Layout.basicWithProfile:
        return BasicWithProfile(card: card);
      case Layout.basicWithProfileAndBrand:
        return BasicWithProfileAndBrand(card: card);
      case Layout.profileEmphasys:
        return ProfileEmphasys(card: card);
      case Layout.brandEmphasys:
        return BrandEmphasys(card: card);
    }
    return BasicWithProfile(card: card);
  }

}

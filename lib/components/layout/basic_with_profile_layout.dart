import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BasicWithProfileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildFirstColumn(),
          SizedBox(width: 32.0),
          _buildSecondColumn(),
        ],
      ),
    );
  }

  Widget _buildFirstColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.person,
          size: 32.0,
        ),
        SizedBox(height: 6.0),
        Container(
          width: 50.0,
          height: 6.0,
          color: Colors.grey[600],
        ),
        SizedBox(height: 4.0),
        Container(
          width: 30.0,
          height: 6.0,
          color: Colors.grey[400],
        ),
      ],
    );
  }

  Widget _buildSecondColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.email,
              size: 16.0,
            ),
            SizedBox(width: 6.0),
            Container(
              width: 30.0,
              height: 6.0,
              color: Colors.grey[400],
            ),
          ],
        ),
        SizedBox(height: 2.0),
        Row(
          children: <Widget>[
            Icon(
              Icons.phone,
              size: 16.0,
            ),
            SizedBox(
              width: 6.0,
            ),
            Container(
              width: 30.0,
              height: 6.0,
              color: Colors.grey[400],
            ),
          ],
        ),
        SizedBox(height: 2.0),
        Row(
          children: <Widget>[
            Icon(
              MdiIcons.whatsapp,
              size: 16.0,
            ),
            SizedBox(
              width: 6.0,
            ),
            Container(
              width: 30.0,
              height: 6.0,
              color: Colors.grey[400],
            ),
          ],
        ),
      ],
    );
  }
}

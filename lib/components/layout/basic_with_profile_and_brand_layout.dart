import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BasicWithProfileAndBrandLayout extends StatelessWidget {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildFirstRow(),
          SizedBox(height: 12.0),
          _buildSecondRow(),
        ],
      ),
    );
  }

  Widget _buildFirstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(
          Octicons.getIconData('bookmark'),
          size: 32.0,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.person,
              size: 32.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
            )
          ],
        )
      ],
    );
  }

  Widget _buildSecondRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.email,
              size: 16.0,
            ),
            SizedBox(width: 4.0),
            Container(
              width: 30.0,
              height: 6.0,
              color: Colors.grey[400],
            ),
          ],
        ),
        SizedBox(width: 12.0),
        Row(
          children: <Widget>[
            Icon(
              Icons.phone,
              size: 16.0,
            ),
            SizedBox(width: 4.0),
            Container(
              width: 30.0,
              height: 6.0,
              color: Colors.grey[400],
            ),
          ],
        ),
        SizedBox(width: 12.0),
        Row(
          children: <Widget>[
            Icon(
              MdiIcons.whatsapp,
              size: 16.0,
            ),
            SizedBox(width: 4.0),
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

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BasicWithProfileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey[100]),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Icon(Icons.person),
                Container(
                  width: 50.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey[100]),
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 4.0,),
                Container(
                  width: 30.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey[100]),
                    color: Colors.grey[300],
                  ),
                ),
              ],
            )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.email, size: 16.0,),
                      SizedBox(width: 6.0,),
                      Container(
                        width: 30.0,
                        height: 6.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey[100]),
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.phone, size: 16.0,),
                      SizedBox(width: 6.0,),
                      Container(
                        width: 30.0,
                        height: 6.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey[100]),
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(MdiIcons.whatsapp, size: 16.0,),
                      SizedBox(width: 6.0,),
                      Container(
                        width: 30.0,
                        height: 6.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey[100]),
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:heremycard/screen/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue[800],
        primaryColorDark: Colors.blue[900],
      ),
      home: HomeScreen(),
    );
  }
}
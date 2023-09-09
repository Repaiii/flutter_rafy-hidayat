// ignore_for_file: unused_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'material_app.dart';
import 'exploration_page.dart';
import 'cupertino_app.dart';

//material app
void main() {
  runApp(MaterialApp(
    home: MyMaterialApp(), 
    theme: ThemeData.dark(),
  ));
}


//cupertino app
/*void main() {
  runApp(MyCupertinoApp());
}

class MyCupertinoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: HomePage(),
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.white,
      ),
    );
  }
}*/


//soal eksplorasi
/*void main() {
  runApp(MaterialApp(
    home: ExplorationPage(),
    theme: ThemeData(
      primaryColor: Color(0xFF6200EE),
    ),
  ));
}*/
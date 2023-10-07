import 'package:flutter/material.dart';
import 'package:test/screens/contact/avatar_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DiceBear Avatar Generator',
      home: AvatarGeneratorScreen(),
    );
  }
}

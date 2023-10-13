//main.dart

import 'package:flutter/material.dart';
import 'package:test/parameter_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smartphone Recommender',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ParameterForm(), // Memulai dengan halaman ParameterForm
    );
  }
}

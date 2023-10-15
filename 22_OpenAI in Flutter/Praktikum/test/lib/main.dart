// main.dart
import 'package:flutter/material.dart';
import 'package:test/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:test/providers/smartphone_recommendation_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SmartphoneRecommendationProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

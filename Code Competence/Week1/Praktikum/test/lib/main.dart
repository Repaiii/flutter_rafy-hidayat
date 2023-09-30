import 'package:flutter/material.dart';
import 'registration_page.dart'; // Import file registration.dart
import 'welcome_section.dart'; // Import file welcome_section.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WelcomeSection(), // Gunakan WelcomeSection dari welcome_section.dart
            RegistrationPage(), // Gunakan RegistrationPage dari registration.dart
          ],
        ),
      ),
    );
  }
}

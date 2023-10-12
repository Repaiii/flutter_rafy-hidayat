//homepage.dart

import 'package:flutter/material.dart';
import 'package:test/Screens/about_section.dart';
import 'package:test/Screens/sidebar.dart';
import 'package:test/Screens/welcome_section.dart';
import 'package:test/Screens/registration.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Sepatu'),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WelcomeSection(),
            RegistrationPage(),
            AboutUsSection(),
          ],
        ),
      ),
    );
  }
}

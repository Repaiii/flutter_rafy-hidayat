import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/login_page.dart';
import 'package:test/contact_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContactsProvider(),
      child: MaterialApp(
        title: 'Contacts App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginPage(),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'contacts_page.dart';

void main() {
  runApp(MaterialApp(
    home: const ContactsPage(contacts: [],),
    theme: ThemeData(
      primaryColor: const Color(0xFFEADDFF),
    ),
  ));
}

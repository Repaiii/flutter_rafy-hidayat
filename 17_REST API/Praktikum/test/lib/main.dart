import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/models/contact_model.dart';
import 'package:test/screens/avatar_screen.dart';
import 'package:test/screens/avatar_view_model.dart';
import 'package:test/services/api_services.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AvatarViewModel(),
      child: MyApp(),
    ),
  );

  // Jalankan tugas-tugas ini tanpa mengganggu UI
  runTasks();
}

void runTasks() {
  Future.delayed(Duration.zero, () async {
    final apiService = ApiService();

    final newContact = Contact(id: 4, name: 'Rafy Hidayat', phone: '0981231212');
    await apiService.createContact(newContact);

    await apiService.performPutRequest();

    await apiService.convertJson();
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DiceBear API Demo',
      home: ImageScreen(),
    );
  }
}
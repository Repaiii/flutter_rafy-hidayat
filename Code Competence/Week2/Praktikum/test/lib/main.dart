import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/screens/homepage.dart';
import 'package:test/services/registration_provider.dart';
import 'package:test/screens/registration_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegistrationViewModel()),
        ChangeNotifierProvider<RegistrationProvider>(
          create: (_) => RegistrationProvider(child: Container(), viewModel: RegistrationViewModel()),
        ), 
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

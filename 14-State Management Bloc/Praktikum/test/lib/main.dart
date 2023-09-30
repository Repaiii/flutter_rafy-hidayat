import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'contact_page.dart'; 
import 'contact_bloc.dart'; 

void main() {
  runApp(
    BlocProvider(
      create: (BuildContext context) => ContactBloc(), 
      child: MaterialApp(
        home: ContactsPage(),
        theme: ThemeData(
          primaryColor: const Color(0xFFEADDFF),
        ),
      ),
    ),
  );
}

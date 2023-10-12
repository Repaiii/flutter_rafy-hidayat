import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test/registration_page.dart';

void main() {
  testWidgets('Registration Page UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: RegistrationPage(),
    ));

    // Expect to find widgets in the initial state.
    expect(find.text('Formulir Keluhan'), findsOneWidget);
    expect(find.text('Nama Depan'), findsOneWidget);
    expect(find.text('Nama Belakang'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Keluhan'), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);

    // Enter text into text fields.
    await tester.enterText(find.byType(TextFormField).at(0), 'John');
    await tester.enterText(find.byType(TextFormField).at(1), 'Doe');
    await tester.enterText(find.byType(TextFormField).at(2), 'johndoe@example.com');
    await tester.enterText(find.byType(TextFormField).at(3), 'Ini adalah keluhan saya.');

    // Tap the Submit button.
    await tester.tap(find.text('Submit'));

    // Rebuild the widget after the button press.
    await tester.pump();

    // Expect to find the data displayed in the dialog.
    expect(find.text('Data Registrasi'), findsOneWidget);
    expect(find.text('Nama Depan: John'), findsOneWidget);
    expect(find.text('Nama Belakang: Doe'), findsOneWidget);
    expect(find.text('Email: johndoe@example.com'), findsOneWidget);
    expect(find.text('Deskripsi: Ini adalah keluhan saya.'), findsOneWidget);
  });
}

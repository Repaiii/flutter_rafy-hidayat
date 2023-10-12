import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test/contacts_page.dart'; // Sesuaikan dengan path proyek Anda.

void main() {
  testWidgets('Contacts Page UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: ContactsPage(contacts: []),
    ));

    // Expect to find widgets in the initial state.
    expect(find.text('Create New Contacts'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Phone Number'), findsOneWidget);

    // Find the text "Select Date:" and tap it.
    final selectDateText = find.text('Select Date:');
    expect(selectDateText, findsOneWidget);
    await tester.tap(selectDateText);
    await tester.pumpAndSettle(); // Tunggu hingga dialog muncul.

    // Expect to find widgets in the date selection dialog.
    expect(find.byType(CalendarDatePicker), findsOneWidget);
    expect(find.byType(TextButton), findsOneWidget); // Menggunakan TextButton.

    // Let's close the date selection dialog.
    final okButton = find.text('OK');
    expect(okButton, findsOneWidget);
    await tester.tap(okButton);
    await tester.pumpAndSettle(); // Tunggu hingga dialog tertutup.

    // Now, let's interact with the "Select Color" button.
    final selectColorText = find.text('Select Color:');
    expect(selectColorText, findsOneWidget);
    await tester.tap(selectColorText);
    await tester.pumpAndSettle(); // Tunggu hingga dialog muncul.

    // Expect to find the color picker dialog.
    expect(find.byType(ColorPicker), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget); // Menggunakan ElevatedButton.

    // Close the color picker dialog.
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(); // Tunggu hingga dialog tertutup.

    // Now, let's interact with the "Select File" button.
    final selectFileText = find.text('Select File:');
    expect(selectFileText, findsOneWidget);
    await tester.tap(selectFileText);
    await tester.pumpAndSettle(); // Tunggu hingga dialog muncul.

    // Expect to find the file selection dialog.
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget); // Menggunakan ElevatedButton.

    // Close the file picker dialog.
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(); // Tunggu hingga dialog tertutup.

    // Now, fill in the Name and Phone Number fields.
    await tester.enterText(find.widgetWithText(TextFormField, 'Name'), 'John Doe');
    await tester.enterText(find.widgetWithText(TextFormField, 'Phone Number'), '123456789');

    // Tap the "Submit" button to add a contact.
    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle(); // Tunggu hingga proses penambahan kontak selesai.

    // Expect that adding a valid contact works.
    expect(find.text('Contact Added:'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test/contacts_page.dart';

void main() {
  testWidgets('Add Contact Button Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ContactsPage(contacts: [])));

    var addButton = find.byType(ElevatedButton);
    expect(addButton, findsOneWidget);

    await tester.tap(addButton);
    await tester.pump();

    var nameField = find.byWidgetPredicate(
      (widget) => widget is TextField && widget.decoration!.labelText == 'Name',
    );
    expect(nameField, findsOneWidget);
  });

  testWidgets('Contact List Test', (WidgetTester tester) async {
  });
}

import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ContactList(),
    );
  }
}

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String?>> contacts = [
      {"nama": "John Doe", "telepon": "123-456-7890"},
      {"nama": "Jane Smith", "telepon": "987-654-3210"},
      {"nama": "John Doe", "telepon": "123-456-7890"},
      {"nama": "Jane Smith", "telepon": "987-654-3210"},
      {"nama": "John Doe", "telepon": "123-456-7890"},
      {"nama": "Jane Smith", "telepon": "987-654-3210"},
      {"nama": "John Doe", "telepon": "123-456-7890"},
      {"nama": "Jane Smith", "telepon": "987-654-3210"},
    ];

    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        final initial = contact['nama']?.isNotEmpty == true
            ? contact['nama']![0].toUpperCase()
            : '?';

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              initial,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          title: Text(
            contact['nama'] ?? '',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            contact['telepon'] ?? '',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}

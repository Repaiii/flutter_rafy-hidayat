// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final List<Map<String, dynamic>> contacts = [];

  String name = '';
  String phoneNumber = '';
  DateTime selectedDate = DateTime.now();
  Color selectedColor = Colors.blue;
  XFile? selectedFile;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    )) ?? DateTime.now();
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectColor(BuildContext context) async {
    Color pickedColor = selectedColor;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (Color color) {
                pickedColor = color;
              },
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    setState(() {
      selectedColor = pickedColor;
    });
  }

  Future<void> _selectFile(BuildContext context) async {
    final imagePicker = ImagePicker();
    final selectedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      setState(() {
        selectedFile = selectedImage;
      });
    }
  }

  void _addContact() {
    final newContact = {
      'name': name,
      'phoneNumber': phoneNumber,
      'date': selectedDate,
      'color': selectedColor,
      'file': selectedFile?.path,
    };
    setState(() {
      contacts.add(newContact);
    });
    print('Contact Added: $newContact');
    // Clear form fields
    name = '';
    phoneNumber = '';
    selectedDate = DateTime.now();
    selectedColor = Colors.blue;
    selectedFile = null;
  }

  void _deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  void _updateContact(int index) {
    final updatedContact = {
      'name': name,
      'phoneNumber': phoneNumber,
      'date': selectedDate,
      'color': selectedColor,
      'file': selectedFile?.path,
    };
    setState(() {
      contacts[index] = updatedContact;
    });
    print('Contact Updated: $updatedContact');
    // Clear form fields
    name = '';
    phoneNumber = '';
    selectedDate = DateTime.now();
    selectedColor = Colors.blue;
    selectedFile = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              // Add logic to show information
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(
                Icons.phone,
                size: 48,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Create New Contacts',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Please fill in the details below',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                fillColor: Color(0xFFEADDFF),
                filled: true,
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                fillColor: Color(0xFFEADDFF),
                filled: true,
              ),
              onChanged: (value) {
                setState(() {
                  phoneNumber = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Select Date: '),
                TextButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Select Color: '),
                TextButton(
                  onPressed: () {
                    _selectColor(context);
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    color: selectedColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Select File: '),
                TextButton(
                  onPressed: () {
                    _selectFile(context);
                  },
                  child: const Icon(
                    Icons.attach_file,
                    color: Color(0xFF6750A4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  if (name.isNotEmpty && phoneNumber.isNotEmpty) {
                    _addContact();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6750A4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: const Text('Submit'),
              ),
            ),
            const SizedBox(height: 32),
            const Center(
              child: Text(
                'List Contacts',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    title: Text(contact['name']),
                    subtitle: Text(contact['phoneNumber']),
                    leading: CircleAvatar(
                      backgroundColor: contact['color'],
                      child: Text(
                        contact['name'][0].toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // Add edit contact logic here
                            setState(() {
                              name = contact['name'];
                              phoneNumber = contact['phoneNumber'];
                              selectedDate = contact['date'];
                              selectedColor = contact['color'];
                              selectedFile = contact['file'] != null
                                  ? XFile(contact['file'])
                                  : null;
                            });
                            _deleteContact(index);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _deleteContact(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

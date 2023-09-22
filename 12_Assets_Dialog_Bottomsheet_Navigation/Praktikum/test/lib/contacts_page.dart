// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'contact.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final List<Contact> contacts = [];
  String name = '';
  String phoneNumber = '';
  DateTime selectedDate = DateTime.now();
  Color selectedColor = Colors.blue;
  XFile? selectedFile;
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        )) ??
        DateTime.now();
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
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
    final selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      setState(() {
        selectedFile = selectedImage;
      });
    }
  }

  void _addContact() {
    // Validate the form
    if (_formKey.currentState!.validate()) {
      final newContact = Contact(
        name: name,
        phoneNumber: phoneNumber,
        selectedDate: selectedDate,
        selectedColor: selectedColor,
        selectedFile: selectedFile?.path,
      );
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
  }

  void _deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Form(
              key: _formKey, // Assign form key for validation
              child: Column(
                children: [
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name is required';
                      } else if (value.length < 8) {
                        return 'Name must be at least 8 characters';
                      } else if (value.contains(RegExp(r'[0-9\W]'))) {
                        return 'Name cannot contain numbers or symbols';
                      }
                      return null;
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Phone Number is required';
                      } else if (value.length < 10) {
                        return 'Phone Number must be at least 10 characters';
                      } else if (value.contains(RegExp(r'[a-zA-Z\W]'))) {
                        return 'Phone Number cannot contain letters or symbols';
                      }
                      return null;
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
                        _addContact();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF6750A4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: const Text('Submit'),
                    ),
                  ),
                ],
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
                    title: Text(contact.name),
                    subtitle: Text(
                        '${contact.phoneNumber}, ${contact.selectedDate} ${contact.selectedFile ?? ""}'),
                    leading: CircleAvatar(
                      backgroundColor: contact.selectedColor,
                      child: Text(
                        contact.name[0].toUpperCase(),
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
                              name = contact.name;
                              phoneNumber = contact.phoneNumber;
                              selectedDate = contact.selectedDate;
                              selectedColor = contact.selectedColor;
                              selectedFile = contact.selectedFile != null
                                  ? XFile(contact.selectedFile!)
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

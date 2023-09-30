import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'contact.dart';
import 'contact_provider.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contactsProvider = Provider.of<ContactsProvider>(context);

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
            Form(
              key: contactsProvider.formKey,
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
                      contactsProvider.updateName(value);
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
                      contactsProvider.updatePhoneNumber(value);
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
                          _selectDate(context, contactsProvider);
                        },
                        child: Text(
                          "${contactsProvider.selectedDate.toLocal()}".split(' ')[0],
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
                          _selectColor(context, contactsProvider);
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          color: contactsProvider.selectedColor,
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
                          _selectFile(context, contactsProvider);
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
                        if (contactsProvider.selectedIndex == -1) {
                          contactsProvider.addContact();
                        } else {
                          contactsProvider.editContact(contactsProvider.selectedIndex);
                        }
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
            Consumer<ContactsProvider>(
              builder: (context, contactsProvider, child) {
                final contacts = contactsProvider.contacts;
                return ListView.builder(
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
                                contactsProvider.editContact(index);
                                _updateFormFields(context, contactsProvider, contact);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                contactsProvider.deleteContact(index);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, ContactsProvider provider) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: provider.selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    )) ??
        DateTime.now();
    if (picked != provider.selectedDate) {
      provider.updateSelectedDate(picked);
    }
  }

  Future<void> _selectColor(BuildContext context, ContactsProvider provider) async {
    Color pickedColor = provider.selectedColor;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: provider.selectedColor,
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
                provider.updateSelectedColor(pickedColor);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectFile(BuildContext context, ContactsProvider provider) async {
    final imagePicker = ImagePicker();
    final selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      provider.updateSelectedFile(selectedImage);
    }
  }

  void _updateFormFields(
      BuildContext context, ContactsProvider provider, Contact contact) {
    provider.updateName(contact.name);
    provider.updatePhoneNumber(contact.phoneNumber);
    provider.updateSelectedDate(contact.selectedDate);
    provider.updateSelectedColor(contact.selectedColor);
    if (contact.selectedFile != null) {
      provider.updateSelectedFile(XFile(contact.selectedFile!));
    }
  }
}

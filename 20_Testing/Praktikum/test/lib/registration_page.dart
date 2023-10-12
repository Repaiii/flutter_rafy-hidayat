import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _submitForm() {
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final email = _emailController.text;
    final description = _descriptionController.text;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Data Registrasi'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nama Depan: $firstName'),
              Text('Nama Belakang: $lastName'),
              Text('Email: $email'),
              Text('Deskripsi: $description'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );

    // Mengosongkan formulir setelah disubmit
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _descriptionController.clear();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Formulir Keluhan',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      labelText: 'Nama Depan',
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.lightBlue[50],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Nama Belakang',
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.lightBlue[50],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: Colors.lightBlue[50],
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(
              labelText: 'Keluhan',
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: Colors.lightBlue[50],
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

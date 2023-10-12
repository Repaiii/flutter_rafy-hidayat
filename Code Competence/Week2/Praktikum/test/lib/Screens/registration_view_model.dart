// registration_viewmodel.dart

import 'package:flutter/material.dart';

class RegistrationViewModel extends ChangeNotifier {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController descriptionController;

  RegistrationViewModel() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    descriptionController = TextEditingController();
  }

  void submitForm(BuildContext context) {
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final email = emailController.text;
    final description = descriptionController.text;

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
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    descriptionController.clear();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}

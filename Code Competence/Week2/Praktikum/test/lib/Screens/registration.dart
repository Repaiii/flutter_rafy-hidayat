// registration.dart

import 'package:flutter/material.dart';
import 'package:test/services/registration_provider.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = RegistrationProvider.of(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Formulir Pemesanan Sepatu',
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
                    controller: viewModel.firstNameController, // Menggunakan controller dari viewModel
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
                    controller: viewModel.lastNameController, // Menggunakan controller dari viewModel
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
            controller: viewModel.emailController, // Menggunakan controller dari viewModel
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
            controller: viewModel.descriptionController, // Menggunakan controller dari viewModel
            decoration: InputDecoration(
              labelText: 'Deskripsi Sepatu Pesanan',
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: Colors.lightBlue[50],
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Mengirim data ke ViewModel saat tombol "Submit" ditekan
              viewModel.submitForm(context);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}


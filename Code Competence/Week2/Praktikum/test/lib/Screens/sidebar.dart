import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Contact Us'),
            onTap: () {
              // Tambahkan logika navigasi ke "Contact Us" di sini
              Navigator.of(context).pop(); // Tutup sidebar setelah navigasi
            },
          ),
          ListTile(
            title: const Text('About Us'),
            onTap: () {
              // Tambahkan logika navigasi ke "About Us" di sini
              Navigator.of(context).pop(); // Tutup sidebar setelah navigasi
            },
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              // Tambahkan logika navigasi ke "Login" di sini
              Navigator.of(context).pop(); // Tutup sidebar setelah navigasi
            },
          ),
        ],
      ),
    );
  }
}

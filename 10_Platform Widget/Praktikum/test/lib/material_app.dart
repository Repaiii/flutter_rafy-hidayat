import 'package:flutter/material.dart';
import 'contacts_page.dart'; // Import halaman kontak

class MyMaterialApp extends StatefulWidget {
  @override
  _MyMaterialAppState createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List of pages for the BottomNavigationBar
    final List<Widget> _pages = [
      Center(child: Text('This is Material App')),
      ContactsPage(), // Halaman kontak
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Material App'),
      ),
      body: _pages[_selectedIndex], // Tampilkan halaman yang dipilih
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Contacts',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                // Tambahkan logika navigasi ke halaman pengaturan di sini
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // Tambahkan logika navigasi ke halaman pengaturan di sini
              },
            ),
          ],
        ),
      ),
    );
  }
}

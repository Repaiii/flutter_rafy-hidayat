import 'package:flutter/material.dart';

class ExplorationPage extends StatelessWidget {
  const ExplorationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6200EE), // Ubah warna AppBar
        title: const Center( // Teks menjadi tengah
          child: Text('My Flutter App'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Tambahkan logika pencarian di sini
            },
          ),
        ],
      ),
      body: ListView(
        children: const [
          ListTile(title: Text('Learn Flutter')),
          ListTile(title: Text('Learn ReactJS')),
          ListTile(title: Text('Learn VueJS')),
          ListTile(title: Text('Learn Tailwind CSS')),
          ListTile(title: Text('Learn UI/UX')),
          ListTile(title: Text('Learn Figma')),
          ListTile(title: Text('Learn Digital Marketing')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan logika untuk tombol tindakan di sini
        },
        backgroundColor: const Color(0xFF03DAC5),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Information',
          ),
        ],
        currentIndex: 0, // Indeks elemen terpilih
        onTap: (index) {
          // Tambahkan logika untuk menangani pemilihan tab di sini
        },
        backgroundColor: const Color(0xFF6200EE), // Ubah warna BottomNavigationBar
        selectedItemColor: Colors.white, // Warna teks yang dipilih
        unselectedItemColor: Colors.white.withOpacity(0.6), // Warna teks yang tidak dipilih
      ),
    );
  }
}

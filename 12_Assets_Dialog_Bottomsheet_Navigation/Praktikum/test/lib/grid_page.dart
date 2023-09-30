import 'package:flutter/material.dart';

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah kolom dalam grid
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          final imageUrl = imageUrls[index];
          return GestureDetector(
            onTap: () {
              // Tampilkan gambar pada bottom sheet saat ditekan
              _showImageBottomSheet(context, imageUrl);
            },
            child: Card(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  // Menampilkan gambar pada bottom sheet
  void _showImageBottomSheet(BuildContext context, String imageUrl) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Sesuaikan dengan kebutuhan Anda
              children: [
                const Text('Smartphone Images'),
                const SizedBox(height: 16),
                const Text(
                  'Are you sure to choose this image'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Tampilkan gambar pada dialog saat memilih "Ya"
                        Navigator.pop(context);
                        _showImageDialog(context, imageUrl);
                      },
                      child: const Text('Ya'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Tutup bottom sheet saat memilih "Tidak"
                        Navigator.pop(context);
                      },
                      child: const Text('Tidak'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Menampilkan gambar pada dialog
  void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Are you sure want to see this image?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Image.network(imageUrl),
          ],
        ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Masuk ke halaman baru saat memilih "Ya"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPage(imageUrl: imageUrl),
                  ),
                );
              },
              child: const Text('Ya'),
            ),
            ElevatedButton(
              onPressed: () {
                // Tutup dialog saat memilih "Tidak"
                Navigator.pop(context);
              },
              child: const Text('Tidak'),
            ),
          ],
        );
      },
    );
  }
}

// Halaman Baru (NewPage) yang akan dibuka jika memilih "Ya" pada dialog
class NewPage extends StatelessWidget {
  final String imageUrl;

  const NewPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}

// Daftar URL gambar (ganti dengan URL gambar Anda)
List<String> imageUrls = [
  'https://th.bing.com/th?id=OIP.S51UVFV_CcFyuQhSh4qSZQHaEK&w=333&h=187&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
  'https://th.bing.com/th?id=OIP.n1UdAuk1vqwRBHk5BX7E0gHaHa&w=249&h=249&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
  'https://th.bing.com/th?id=OIP.3NExAQcqWHGqxX3RUKsldAAAAA&w=333&h=187&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
  // Tambahkan URL gambar lainnya
];

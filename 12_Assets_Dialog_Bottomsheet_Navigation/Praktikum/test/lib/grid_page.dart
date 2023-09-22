import 'package:flutter/material.dart';

class GridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Sesuaikan dengan kebutuhan Anda
              children: [
                Text('Bottom Sheet Content'),
                SizedBox(height: 16),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae turpis eget arcu '
                  'efficitur rhoncus. Suspendisse potenti.',
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Tampilkan gambar pada dialog saat memilih "Ya"
                        Navigator.pop(context);
                        _showImageDialog(context, imageUrl);
                      },
                      child: Text('Ya'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Tutup bottom sheet saat memilih "Tidak"
                        Navigator.pop(context);
                      },
                      child: Text('Tidak'),
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
          content: Image.network(imageUrl),
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
              child: Text('Ya'),
            ),
            ElevatedButton(
              onPressed: () {
                // Tutup dialog saat memilih "Tidak"
                Navigator.pop(context);
              },
              child: Text('Tidak'),
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

  NewPage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
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

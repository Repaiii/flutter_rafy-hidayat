import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://th.bing.com/th/id/OIP.kLSHOYrpV909KNS-T_irNQHaEY?pid=ImgDet&rs=1',
          fit: BoxFit.cover, // Gambar akan menutupi seluruh area Stack
          height: 300.0, // Sesuaikan dengan tinggi gambar Anda
        ),
        Container(
          height: 300.0, // Sesuaikan dengan tinggi gambar Anda
          color: Colors.black.withOpacity(0.5), // Warna latar belakang transparan
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bantuan Pengguna',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Warna teks
                ),
              ),
              const SizedBox(height: 16.0), // Jarak antara teks judul dan deskripsi
              const Text(
                'Jika ada yang ingin ditanyakan, silakan mengisi formulir di bawah ini agar kami dapat menghubungi anda.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white, // Warna teks
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

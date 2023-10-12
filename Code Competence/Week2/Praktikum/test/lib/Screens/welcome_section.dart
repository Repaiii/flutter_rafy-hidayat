//welcome_section.dart

import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/sepatu.jpeg',
          fit: BoxFit.cover,
          height: 300.0,
        ),
        Container(
          height: 300.0,
          color: Colors.black.withOpacity(0.5),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bantuan Pengguna',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Jika anda ingin memesan sepatu tertentu yang tidak ada di etalase, silakan mengisi formulir di bawah ini agar kami dapat menghubungi anda.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

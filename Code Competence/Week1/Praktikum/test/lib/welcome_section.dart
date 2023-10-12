import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://th.bing.com/th/id/OIP.kLSHOYrpV909KNS-T_irNQHaEY?pid=ImgDet&rs=1',
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
                'Jika ada yang ingin ditanyakan, silakan mengisi formulir di bawah ini agar kami dapat menghubungi anda.',
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

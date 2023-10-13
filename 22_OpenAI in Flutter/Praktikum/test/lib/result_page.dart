//result_page

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final List<String> recommendations;

  ResultPage(this.recommendations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Tampilkan rekomendasi smartphone
            for (var recommendation in recommendations)
              Text(recommendation),

            // Tombol untuk kembali ke halaman sebelumnya
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

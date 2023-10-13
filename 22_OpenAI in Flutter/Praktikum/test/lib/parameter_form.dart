//parameter_form

import 'package:flutter/material.dart';
import 'package:test/result_page.dart';
import 'package:test/api_service.dart';

class ParameterForm extends StatefulWidget {
  @override
  _ParameterFormState createState() => _ParameterFormState();
}

class _ParameterFormState extends State<ParameterForm> {
  TextEditingController hargaController = TextEditingController();
  TextEditingController kameraController = TextEditingController();
  TextEditingController penyimpananController = TextEditingController();

  // Fungsi ini akan dipanggil ketika pengguna menekan tombol "Submit"
  void onRecommendationButtonPressed(BuildContext context) async {
  // Validasi input (contoh: pastikan input tidak kosong)
  if (hargaController.text.isEmpty ||
      kameraController.text.isEmpty ||
      penyimpananController.text.isEmpty) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Harap isi semua parameter.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  } else {
    try {
      // Meminta rekomendasi dari OpenAI
      final recommendations = await getSmartphoneRecommendation(
        hargaController.text,
        kameraController.text,
        penyimpananController.text,
      );

      // Navigasikan ke halaman hasil dengan membawa data rekomendasi
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(recommendations),
        ),
      );
    } catch (e) {
      // Tangani kesalahan jika gagal mendapatkan rekomendasi.
      print('Error: $e');
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rekomendasi Smartphone'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Form pengisian parameter
            TextField(
              controller: hargaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Harga'),
            ),
            TextField(
              controller: kameraController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Kamera (MP)'),
            ),
            TextField(
              controller: penyimpananController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Kapasitas Penyimpanan (GB)'),
            ),

            // Tombol "Submit" untuk meminta rekomendasi
            ElevatedButton(
              onPressed: () {
                onRecommendationButtonPressed(context);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

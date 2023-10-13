//api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> getSmartphoneRecommendation(
    String price, String camera, String storage) async {
  const apiKey = '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'; // Ganti dengan kunci API OpenAI Anda
  const apiUrl = 'https://api.openai.com/v1/engines/davinci-codex/completions'; // Ganti dengan URL API OpenAI

  String prompt =
      "Saya ingin merekomendasikan smartphone dengan harga di bawah $price, memiliki kamera sekitar $camera MP, dan kapasitas penyimpanan internal sekitar $storage GB. Rekomendasikan smartphone yang sesuai dengan kriteria ini.";

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'model': 'text-davinci-1', // Ganti dengan model yang sesuai, sesuaikan dengan model OpenAI yang Anda gunakan
      'prompt': prompt,
      'max_tokens': 50, // Jumlah token maksimum dalam respons, sesuaikan sesuai kebutuhan
    }),
  );

  if (response.statusCode == 200) {
    // Berhasil mendapatkan rekomendasi
    final Map<String, dynamic> data = json.decode(response.body);

    // Mengambil rekomendasi dari data respons
    final List<String> recommendations = List<String>.from(
        data['choices'][0]['text'].toString().split('\n'));

    return recommendations;
  } else {
    throw Exception('Gagal mendapatkan rekomendasi');
  }
}

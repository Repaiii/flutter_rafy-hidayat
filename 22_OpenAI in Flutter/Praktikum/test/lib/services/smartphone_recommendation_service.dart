// lib/services/smartphone_recommendation_service.dart
import 'package:dio/dio.dart';

class SmartphoneRecommendationService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>?> getRecommendations({
    required String harga,
    required String camera,
    required String storage,
  }) async {
    try {
      _dio.options = BaseOptions(
        baseUrl: 'https://api.openai.com/v1/',
        headers: {
          'Authorization': 'Bearer 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',
        },
      );

      final response = await _dio.post(
        'completions',
        data: {
          "model": "text-davinci-003",
          "prompt":
              "Kamu adalah seorang gadget expert, Berikan saya rekomendasi HP dengan kisaran harga Rp. $harga, kamera $camera MP, dan storage $storage GB.",
          "temperature": 0.4,
          "max_tokens": 900,
          "top_p": 1,
          "frequency_penalty": 0,
          "presence_penalty": 0,
        },
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.data}');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('Failed to make API request: ${response.statusCode}');
      }
    } catch (error) {
      // An error occurred
      print('Error: $error');
    }
    return null;
  }
}

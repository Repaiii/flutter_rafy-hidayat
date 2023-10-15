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
              "Kamu adalah seorang gadget expert, Berikan saya rekomendasi HP dengan kisaran harga $harga rupiah, kamera $camera Megapixel, dan storage $storage Gigabyte.",
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

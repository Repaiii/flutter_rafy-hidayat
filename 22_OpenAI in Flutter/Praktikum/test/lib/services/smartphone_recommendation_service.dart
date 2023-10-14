// lib/services/smartphone_recommendation_service.dart
import 'dart:convert';
import '../constants/open_ai.dart';
import 'package:http/http.dart' as http;
import 'package:test/models/smartphone_recommendation.dart';

class SmartphoneRecommendationService {
  static Future<SmartphoneRecommendation> getRecommendations({
    required String priceRange,
    required String cameraQuality,
    required String storageCapacity,
  }) async {
    late SmartphoneRecommendation recommendation;

    try {
      var url = Uri.parse('https://api.openai.com/v1/completions');

      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey'
      };

      String promptData =
          "You are a smartphone expert. Please recommend a smartphone with a price range of $priceRange, camera quality of $cameraQuality Megapixel, and storage capacity of $storageCapacity Gigabyte.";
      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": promptData,
        "temperature": 0.4,
        "max_tokens": 64,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      });

      var response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        recommendation = SmartphoneRecommendation.fromJson(json.decode(response.body));
      }
    } catch (e) {
      throw Exception('Error occurred when sending the request.');
    }

    return recommendation;
  }
}

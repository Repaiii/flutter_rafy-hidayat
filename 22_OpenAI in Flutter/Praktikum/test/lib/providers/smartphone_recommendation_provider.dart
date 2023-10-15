// smartphone_recommendation_provider.dart
import 'package:flutter/material.dart';
import 'package:test/services/smartphone_recommendation_service.dart';

class SmartphoneRecommendationProvider extends ChangeNotifier {
  final SmartphoneRecommendationService _service = SmartphoneRecommendationService();
  Map<String, dynamic>? recommendation;

  Future<void> getRecommendations({
    required String budget,
    required String camera,
    required String storage,
  }) async {
    recommendation = await _service.getRecommendations(
      harga: budget,
      camera: camera,
      storage: storage,
    );
    notifyListeners();
  }
}

// lib/screens/result_page.dart
import 'package:flutter/material.dart';
import 'package:test/models/smartphone_recommendation.dart';

class ResultScreen extends StatelessWidget {
  final SmartphoneRecommendation smartphoneRecommendation;

  const ResultScreen({Key? key, required this.smartphoneRecommendation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendations'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Recommendations",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Name: ${smartphoneRecommendation.name}\n'
              'Brand: ${smartphoneRecommendation.brand}\n'
              'Price: ${smartphoneRecommendation.price}\n'
              'Camera: ${smartphoneRecommendation.camera}\n'
              'Storage: ${smartphoneRecommendation.storage}\n'
              'Description: ${smartphoneRecommendation.description}',
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
              },
              child: const Text("Back"),
            ),
          ),
        ],
      ),
    );
  }
}

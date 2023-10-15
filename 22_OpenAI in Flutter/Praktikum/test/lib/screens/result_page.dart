// lib/screens/result_screen.dart
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic>? responseData;

  ResultScreen({Key? key, required this.responseData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendations'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Recommendations",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Recommendations:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            if (responseData != null && responseData!['choices'] != null)
              ListView.builder(
                shrinkWrap: true, // Tambahkan ini untuk menghindari masalah render
                itemCount: responseData!['choices'].length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      responseData!['choices'][index]['text'] ?? "No recommendation text available",
                      textAlign: TextAlign.justify,
                    ),
                  );
                },
              )
            else
              const Text("No recommendations available"),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}

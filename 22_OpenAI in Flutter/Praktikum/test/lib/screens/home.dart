// home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/providers/smartphone_recommendation_provider.dart';
import 'package:provider/provider.dart';
import 'package:test/screens/result_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _cameraController = TextEditingController();
  final TextEditingController _storageController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final recommendationProvider =
        Provider.of<SmartphoneRecommendationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI App'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                heightFactor: 4,
                child: Text(
                  'Smartphone Recommendations by AI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _budgetController,
                  decoration: const InputDecoration(
                    labelText: 'Budget',
                    hintText: 'Enter the budget',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]')), // Hanya izinkan angka
                  ],
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter the budget';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _cameraController,
                  decoration: const InputDecoration(
                    labelText: 'Camera Quality (MP)',
                    hintText: 'Enter the camera quality',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]')), // Hanya izinkan angka
                  ],
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter the camera quality';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _storageController,
                  decoration: const InputDecoration(
                    labelText: 'Storage Capacity (GB)',
                    hintText: 'Enter the storage capacity',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]')), // Hanya izinkan angka
                  ],
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter the storage capacity';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            await recommendationProvider.getRecommendations(
                              budget: _budgetController.text,
                              camera: _cameraController.text,
                              storage: _storageController.text,
                            );

                            if (recommendationProvider.recommendation != null) {
                              // Navigasi ke halaman hasil
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ResultScreen(
                                        responseData: recommendationProvider
                                            .recommendation!);
                                  },
                                ),
                              );
                            } else {
                              // Tangani kesalahan lain jika perlu
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('An error occurred.'),
                                ),
                              );
                            }

                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        child: const Text("Get Recommendations"),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// lib/screens/home.dart
import 'package:flutter/material.dart';
import 'package:test/screens/result_page.dart';
import 'package:test/services/smartphone_recommendation_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _cameraController = TextEditingController();
  final TextEditingController _storageController = TextEditingController();
  bool isLoading = false;

  void _getRecommendations() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        final result = await SmartphoneRecommendationService.getRecommendations(
          priceRange: _priceController.text,
          cameraQuality: _cameraController.text,
          storageCapacity: _storageController.text,
        );

        if (mounted) {
          setState(() {
            isLoading = false;
          });

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ResultScreen(smartphoneRecommendation: result);
              },
            ),
          );
        }
      } catch (e) {
        const snackBar = SnackBar(
          content: Text('Failed to send a request. Please try again.'),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smartphone Recommendation'),
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
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price Range',
                    hintText: 'Enter the price range',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter the price range';
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
                        onPressed: _getRecommendations,
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

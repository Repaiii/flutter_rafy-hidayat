// lib/models/smartphone_recommendation
class SmartphoneRecommendation {
  final String name;
  final String brand;
  final String price;
  final String camera;
  final String storage;
  final String description;

  SmartphoneRecommendation({
    required this.name,
    required this.brand,
    required this.price,
    required this.camera,
    required this.storage,
    required this.description,
  });

  factory SmartphoneRecommendation.fromJson(Map<String, dynamic> json) {
    return SmartphoneRecommendation(
      name: json['name'],
      brand: json['brand'],
      price: json['price'],
      camera: json['camera'],
      storage: json['storage'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'brand': brand,
      'price': price,
      'camera': camera,
      'storage': storage,
      'description': description,
    };
  }
}

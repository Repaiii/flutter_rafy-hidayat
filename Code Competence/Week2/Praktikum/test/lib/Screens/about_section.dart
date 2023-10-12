import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;

  ProductCard({required this.title, required this.description, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0, // Atur lebar sesuai kebutuhan
      margin: const EdgeInsets.symmetric(horizontal: 16.0), // Atur jarak antara kartu
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              imageAsset,
              height: 150.0, // Atur tinggi gambar sesuai kebutuhan
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUsSection extends StatelessWidget {
  final List<ProductCard> products = [
    ProductCard(
      title: 'Sepatu Putih',
      description: 'Bening banget',
      imageAsset: 'assets/produk1.jpeg',
    ),
    ProductCard(
      title: 'Sepatu Biru',
      description: 'Sebiru hatiku',
      imageAsset: 'assets/produk2.jpeg',
    ),
    ProductCard(
      title: 'Sepatu Jordan',
      description: 'Sipaling hype dah',
      imageAsset: 'assets/produk3.jpeg',
    ),
    ProductCard(
      title: 'Sepatu Nike',
      description: 'Bukan Ardilla',
      imageAsset: 'assets/produk4.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Pilihan Utama',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 250.0, // Atur tinggi sesuai kebutuhan
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return products[index];
            },
          ),
        ),
      ],
    );
  }
}

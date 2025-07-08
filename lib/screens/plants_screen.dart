import 'package:flutter/material.dart';
import '../widgets/plant_product_card.dart';

class PlantsScreen extends StatefulWidget {
  const PlantsScreen({Key? key}) : super(key: key);

  @override
  _PlantsScreenState createState() => _PlantsScreenState();
}

class _PlantsScreenState extends State<PlantsScreen> {
  List<Map<String, dynamic>> plantProducts = [
    {
      'imageAsset': 'assets/images/jasminum_sambac.png',
      'name': 'Jasminum sambac, Mogra, Arabian Jasmine - Plant',
      'currentPrice': 299.0,
      'originalPrice': 350.0,
      'discountPercentage': 15.0,
      'isAirPurifying': true,
      'isPerfectGift': true,
      'isFavorite': false,
    },
    {
      'imageAsset': 'assets/images/jasminum_sambac.png',
      'name': 'Money Plant Golden, Pothos, Epipremnum Aureum - Plant',
      'currentPrice': 249.0,
      'originalPrice': 299.0,
      'discountPercentage': 17.0,
      'isAirPurifying': true,
      'isPerfectGift': false,
      'isFavorite': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const Text(
            'Featured Plants',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.55,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: plantProducts.length,
            itemBuilder: (context, index) {
              final product = plantProducts[index];
              return PlantProductCard(
                imageAsset: product['imageAsset'],
                name: product['name'],
                currentPrice: product['currentPrice'],
                originalPrice: product['originalPrice'],
                discountPercentage: product['discountPercentage'],
                isAirPurifying: product['isAirPurifying'],
                isPerfectGift: product['isPerfectGift'],
                isFavorite: product['isFavorite'],
                onFavoritePressed: () {
                  setState(() {
                    product['isFavorite'] = !product['isFavorite'];
                  });
                },
                onBuyNowPressed: () {
                  // Handle buy now
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Buy Now: ${product['name']}')),
                  );
                },
                onAddToCartPressed: () {
                  // Handle add to cart
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added to cart: ${product['name']}')),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
} 
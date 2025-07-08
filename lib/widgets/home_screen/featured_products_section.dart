import 'package:flutter/material.dart';
import '../plant_product_card.dart';

class FeaturedProductsSection extends StatelessWidget {
  const FeaturedProductsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample product data
    final List<Map<String, dynamic>> products = [
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
        'name': '5.1 inch (13 cm) Round Plastic Thermoform Pot',
        'currentPrice': 299.0,
        'originalPrice': 350.0,
        'discountPercentage': 15.0,
        'isAirPurifying': false,
        'isPerfectGift': false,
        'isFavorite': false,
      },
      {
       'imageAsset': 'assets/images/jasminum_sambac.png',
        'name': 'Jade Plant, Money Plant - Succulent Plant',
        'currentPrice': 299.0,
        'originalPrice': 350.0,
        'discountPercentage': 15.0,
        'isAirPurifying': true,
        'isPerfectGift': true,
        'isFavorite': false,
      },
      {
        'imageAsset': 'assets/images/jasminum_sambac.png',
        'name': 'Miniature Rose, Button Rose (Any Color) - Plant',
        'currentPrice': 299.0,
        'originalPrice': 350.0,
        'discountPercentage': 15.0,
        'isAirPurifying': true,
        'isPerfectGift': true,
        'isFavorite': false,
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header with title and See All button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    'Explore Our Plants, Pots, Pebbles & More',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle See All tap
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      color: Color(0xFF54A801),
                      fontSize: 14,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Grid of product cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.55,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return PlantProductCard(
                  imageAsset: product['imageAsset'],
                  name: product['name'],
                  currentPrice: product['currentPrice'],
                  originalPrice: product['originalPrice'],
                  discountPercentage: product['discountPercentage'],
                  isAirPurifying: product['isAirPurifying'],
                  isPerfectGift: product['isPerfectGift'],
                  isFavorite: product['isFavorite'],
                  onBuyNowPressed: () {
                    // Handle Buy Now tap
                  },
                  onAddToCartPressed: () {
                    // Handle Add to Cart tap
                  },
                  onFavoritePressed: () {
                    // Handle Favorite tap
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} 
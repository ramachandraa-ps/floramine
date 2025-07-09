import 'package:flutter/material.dart';
import '../plant_product_card.dart';

class TrendingProductsSection extends StatefulWidget {
  const TrendingProductsSection({Key? key}) : super(key: key);

  @override
  _TrendingProductsSectionState createState() => _TrendingProductsSectionState();
}

class _TrendingProductsSectionState extends State<TrendingProductsSection> {
  int _selectedCategoryIndex = 1; // Default to Outdoor Plants

  final List<String> _categories = [
    'Indoor Plants',
    'Outdoor Plants',
    'Gifts',
    'Pots',
    'Corporate Bulk',
  ];

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
        'name': 'Miniature Rose, Button Rose (Any Color) - Plant',
        'currentPrice': 299.0,
        'originalPrice': 350.0,
        'discountPercentage': 15.0,
        'isAirPurifying': true,
        'isPerfectGift': true,
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
        'name': '5.1 inch (13 cm) Round Plastic Thermoform Pot',
        'currentPrice': 299.0,
        'originalPrice': 350.0,
        'discountPercentage': 15.0,
        'isAirPurifying': false,
        'isPerfectGift': false,
        'isFavorite': false,
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        color: Color(0x0C54A801), // Light green background
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header with title and See All button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Trending Products',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.w700,
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
          
          // Category filter tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(
                  _categories.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: _buildCategoryTab(index),
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Horizontal scrollable product cards
          SizedBox(
            height: 400, // Fixed height for the scrollable container
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  width: 200, // Fixed width for each product card
                  margin: const EdgeInsets.only(right: 16),
                  child: PlantProductCard(
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(int index) {
    final bool isSelected = _selectedCategoryIndex == index;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategoryIndex = index;
        });
      },
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF54A801) : const Color(0x1954A801),
          borderRadius: BorderRadius.circular(6),
          border: isSelected 
              ? null 
              : Border.all(
                  width: 0.5,
                  color: const Color(0x7F54A801),
                ),
          boxShadow: isSelected 
              ? [
                  const BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  )
                ] 
              : null,
        ),
        child: Center(
          child: Text(
            _categories[index],
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF316300),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
} 
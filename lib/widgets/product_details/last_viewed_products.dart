import 'package:flutter/material.dart';
import '../../widgets/plant_product_card.dart';
import '../../models/product_model.dart';

class LastViewedProducts extends StatelessWidget {
  final List<Product>? apiProducts;
  
  const LastViewedProducts({
    Key? key,
    this.apiProducts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // If API products are provided, use them, otherwise use sample products
    final List<dynamic> productsToShow = apiProducts != null && apiProducts!.isNotEmpty
        ? apiProducts!
        : _getSampleProducts();
    
    // If no products to show, don't render the widget
    if (productsToShow.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        // Section title
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 5),
          
          child: const Text(
            'Last Viewed Products',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        
        // Horizontal scrollable products
        SizedBox(
          height: 350, // Height for the product card
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productsToShow.length,
            itemBuilder: (context, index) {
              // Handle both API Product objects and sample product maps
              if (apiProducts != null) {
                final Product product = productsToShow[index] as Product;
                
                // Extract price information
                double currentPrice = 0;
                double originalPrice = 0;
                double discountPercentage = 0;
                
                if (product.variations.isNotEmpty) {
                  final variation = product.variations.first;
                  
                  // Parse prices
                  try {
                    String currentPriceStr = variation.defaultSellPrice.replaceAll('₹', '').trim();
                    String originalPriceStr = variation.defaultPrice.replaceAll('₹', '').trim();
                    
                    currentPrice = double.tryParse(currentPriceStr) ?? 0;
                    originalPrice = double.tryParse(originalPriceStr) ?? 0;
                    
                    if (originalPrice > 0 && currentPrice > 0 && originalPrice > currentPrice) {
                      discountPercentage = ((originalPrice - currentPrice) / originalPrice) * 100;
                    }
                  } catch (e) {
                    // Handle parsing errors silently
                  }
                }
                
                // Check for tags
                bool isAirPurifying = product.tags.toLowerCase().contains('air purifying');
                bool isPerfectGift = product.tags.toLowerCase().contains('perfect gift');
                
                // Get image URL
                String imageUrl = product.images.isNotEmpty
                    ? product.images.first
                    : 'assets/images/jasminum_sambac.png';
                
                return Container(
                  width: 180,
                  margin: const EdgeInsets.only(right: 16),
                  child: PlantProductCard(
                    imageUrl: imageUrl,
                    name: product.name,
                    currentPrice: currentPrice,
                    originalPrice: originalPrice,
                    discountPercentage: discountPercentage,
                    isAirPurifying: isAirPurifying,
                    isPerfectGift: isPerfectGift,
                    usps: product.usps, // Pass USPs from API
                    onTap: () {
                      // Navigate to product details
                      Navigator.pushNamed(
                        context,
                        '/product-details',
                        arguments: {
                          'productId': product.id,
                          'productName': product.name,
                        },
                      );
                    },
                  ),
                );
              } else {
                // Handle sample products (map format)
                final Map<String, dynamic> product = productsToShow[index] as Map<String, dynamic>;
                
                return Container(
                  width: 180,
                  margin: const EdgeInsets.only(right: 16),
                  child: PlantProductCard(
                    imageAsset: 'assets/images/jasminum_sambac.png',
                    name: product['name'] as String,
                    currentPrice: product['price'] as double,
                    originalPrice: product['originalPrice'] as double,
                    discountPercentage: product['discount'] as double,
                    isAirPurifying: product['isAirPurifying'] as bool,
                    isPerfectGift: product['isPerfectGift'] as bool,
                    usps: product['usps'] as List<String>, // Pass USPs from sample data
                    onTap: () {
                      // Navigate to product details screen with static data
                      Navigator.pushNamed(
                        context,
                        '/product-details',
                        arguments: {
                          'productName': product['name'],
                        },
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
  
  // Helper method to get sample products
  List<Map<String, dynamic>> _getSampleProducts() {
    return [
      {
        'name': 'Money Plant, Devil\'s Ivy',
        'price': 249.0,
        'originalPrice': 299.0,
        'discount': 17.0,
        'isAirPurifying': true,
        'isPerfectGift': false,
        'usps': ['🍃 Air Purifying', '🌿 Low Maintenance', '🏠 Indoor Plant'],
      },
      {
        'name': 'Boston Fern',
        'price': 349.0,
        'originalPrice': 399.0,
        'discount': 12.0,
        'isAirPurifying': true,
        'isPerfectGift': true,
        'usps': ['🍃 Air Purifying', '🎁 Perfect Gift', '💧 Loves Humidity'],
      },
      {
        'name': 'Spider Plant',
        'price': 199.0,
        'originalPrice': 249.0,
        'discount': 20.0,
        'isAirPurifying': true,
        'isPerfectGift': false,
        'usps': ['🍃 Air Purifying', '🌿 Low Maintenance', '🐱 Pet Friendly'],
      },
      {
        'name': 'Rubber Plant',
        'price': 399.0,
        'originalPrice': 450.0,
        'discount': 11.0,
        'isAirPurifying': false,
        'isPerfectGift': true,
        'usps': ['🎁 Perfect Gift', '🌿 Low Maintenance', '🌳 Tall Growing'],
      },
      {
        'name': 'ZZ Plant',
        'price': 299.0,
        'originalPrice': 350.0,
        'discount': 14.0,
        'isAirPurifying': true,
        'isPerfectGift': false,
        'usps': ['🍃 Air Purifying', '🌿 Low Maintenance', '💧 Low Water Needs'],
      },
      {
        'name': 'Jade Plant',
        'price': 249.0,
        'originalPrice': 299.0,
        'discount': 17.0,
        'isAirPurifying': false,
        'isPerfectGift': true,
        'usps': ['🎁 Perfect Gift', '🌵 Succulent', '🌞 Loves Sunlight'],
      },
    ];
  }
}
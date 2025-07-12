import 'package:flutter/material.dart';
import '../../widgets/plant_product_card.dart';
import '../../models/product_model.dart';

class YouMightAlsoLike extends StatelessWidget {
  final List<Product>? apiProducts;
  
  const YouMightAlsoLike({
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
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: const Text(
            'You Might Also Like',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        
        // Horizontal scrollable products
        SizedBox(
          height: 420, // Height for the product card
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
        
        // View All Products button
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/products');
            },
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'View All Products',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  
  // Helper method to get sample products
  List<Map<String, dynamic>> _getSampleProducts() {
    return [
      {
        'name': 'Areca Palm, Butterfly Palm',
        'price': 399.0,
        'originalPrice': 450.0,
        'discount': 10.0,
        'isAirPurifying': true,
        'isPerfectGift': true,
      },
      {
        'name': 'Snake Plant, Mother-in-law\'s Tongue',
        'price': 299.0,
        'originalPrice': 350.0,
        'discount': 15.0,
        'isAirPurifying': true,
        'isPerfectGift': false,
      },
      {
        'name': 'Peace Lily, Spathiphyllum',
        'price': 349.0,
        'originalPrice': 399.0,
        'discount': 12.0,
        'isAirPurifying': true,
        'isPerfectGift': true,
      },
      {
        'name': 'Aloe Vera',
        'price': 249.0,
        'originalPrice': 299.0,
        'discount': 17.0,
        'isAirPurifying': false,
        'isPerfectGift': true,
      },
      {
        'name': 'Pothos, Devil\'s Ivy',
        'price': 199.0,
        'originalPrice': 249.0,
        'discount': 20.0,
        'isAirPurifying': true,
        'isPerfectGift': false,
      },
      {
        'name': 'Fiddle Leaf Fig',
        'price': 599.0,
        'originalPrice': 699.0,
        'discount': 14.0,
        'isAirPurifying': false,
        'isPerfectGift': true,
      },
    ];
  }
}
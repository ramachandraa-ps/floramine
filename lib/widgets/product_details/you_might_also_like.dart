import 'package:flutter/material.dart';
import '../../widgets/plant_product_card.dart';

class YouMightAlsoLike extends StatelessWidget {
  const YouMightAlsoLike({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Predefined list of sample products
    final sampleProducts = [
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
            itemCount: sampleProducts.length,
            itemBuilder: (context, index) {
              final product = sampleProducts[index];
              
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
}
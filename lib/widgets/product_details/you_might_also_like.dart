import 'package:flutter/material.dart';
import '../../widgets/plant_product_card.dart';

class YouMightAlsoLike extends StatelessWidget {
  const YouMightAlsoLike({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          height: 420, // Increased height to accommodate the PlantProductCard
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6, // Number of products
            itemBuilder: (context, index) {
              return Container(
                width: 180,
                margin: const EdgeInsets.only(right: 16),
                child: PlantProductCard(
                  imageAsset: 'assets/images/jasminum_sambac.png',
                  name: 'Areca Palm, Butterfly Palm',
                  currentPrice: 399,
                  originalPrice: 450,
                  discountPercentage: 10,
                  isAirPurifying: index % 2 == 0,
                  isPerfectGift: true,
                ),
              );
            },
          ),
        ),
        
        // View All Products button
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
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
      ],
    );
  }
}
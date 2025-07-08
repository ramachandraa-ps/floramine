import 'package:flutter/material.dart';
import '../../widgets/product_card.dart';

class LastViewedProducts extends StatelessWidget {
  const LastViewedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section title
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: const Text(
            'Last Viewed Products',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        
        // Product grid - 2x2 layout (4 products total)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // First row (2 products)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: ProductCard()),
                  const SizedBox(width: 16),
                  Expanded(child: ProductCard()),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Second row (2 products)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: ProductCard()),
                  const SizedBox(width: 16),
                  Expanded(child: ProductCard()),
                ],
              ),
            ],
          ),
        ),
        
        // View All Products button - using the same design as in HomeScreen
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1),
                borderRadius: BorderRadius.circular(26),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
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
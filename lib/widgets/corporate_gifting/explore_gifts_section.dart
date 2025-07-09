import 'package:flutter/material.dart';
import 'corporate_gift_card.dart';

class ExploreGiftsSection extends StatelessWidget {
  final List<Map<String, dynamic>> giftProducts;
  final VoidCallback? onViewAllTap;

  const ExploreGiftsSection({
    Key? key,
    required this.giftProducts,
    this.onViewAllTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Explore Our Gifts',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          
          const SizedBox(height: 30),
          
          // Products grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildProductGrid(),
          ),
          
          const SizedBox(height: 30),
          
          // View All button
          GestureDetector(
            onTap: onViewAllTap,
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              clipBehavior: Clip.antiAlias,
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
      ),
    );
  }

  Widget _buildProductGrid() {
    // Handle empty or small lists
    if (giftProducts.isEmpty) {
      return Center(child: Text('No products available'));
    }

    // Create rows of products (2 products per row)
    List<Widget> rows = [];
    
    // First row (first 2 products)
    if (giftProducts.length >= 1) {
      List<Widget> firstRowItems = [];
      
      // First product
      firstRowItems.add(
        Expanded(
          child: _buildProductCard(giftProducts[0]),
        ),
      );
      
      // Second product (if available)
      if (giftProducts.length >= 2) {
        firstRowItems.add(
          const SizedBox(width: 16),
        );
        firstRowItems.add(
          Expanded(
            child: _buildProductCard(giftProducts[1]),
          ),
        );
      } else {
        // Empty space if only one product
        firstRowItems.add(
          const SizedBox(width: 16),
        );
        firstRowItems.add(
          Expanded(
            child: Container(),
          ),
        );
      }
      
      // Add first row
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: firstRowItems,
        ),
      );
    }
    
    // Add spacing between rows
    if (giftProducts.length > 2) {
      rows.add(const SizedBox(height: 20));
    }
    
    // Second row (next 2 products)
    if (giftProducts.length >= 3) {
      List<Widget> secondRowItems = [];
      
      // Third product
      secondRowItems.add(
        Expanded(
          child: _buildProductCard(giftProducts[2]),
        ),
      );
      
      // Fourth product (if available)
      if (giftProducts.length >= 4) {
        secondRowItems.add(
          const SizedBox(width: 16),
        );
        secondRowItems.add(
          Expanded(
            child: _buildProductCard(giftProducts[3]),
          ),
        );
      } else {
        // Empty space if only three products
        secondRowItems.add(
          const SizedBox(width: 16),
        );
        secondRowItems.add(
          Expanded(
            child: Container(),
          ),
        );
      }
      
      // Add second row
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: secondRowItems,
        ),
      );
    }
    
    return Column(
      children: rows,
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return CorporateGiftCard(
      imageUrl: product['imageUrl'],
      title: product['title'],
      currentPrice: product['currentPrice'],
      originalPrice: product['originalPrice'],
      tags: List<String>.from(product['tags'] ?? []),
      hasDiscount: product['hasDiscount'] ?? false,
      discountText: product['discountText'] ?? 'Save upto 15%',
      onTap: () {
        // Handle product tap
        print('Product tapped: ${product['title']}');
      },
    );
  }
} 
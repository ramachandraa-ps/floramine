import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import '../../models/variation_model.dart';
import 'variation_selector.dart';

class ProductDetailBelowImage extends StatelessWidget {
  final Product? product;
  final String productName;
  
  const ProductDetailBelowImage({
    Key? key,
    this.product,
    this.productName = 'Jasminum sambac, Mogra, Arabian Jasmine - Plant',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract price information from product if available
    double currentPrice = 0;
    double originalPrice = 0;
    String discountText = '';
    double discountPercentage = 0;
    
    if (product != null && product!.variations.isNotEmpty) {
      final variation = product!.variations.first;
      
      // Parse prices
      String currentPriceStr = variation.defaultSellPrice.replaceAll('₹', '').trim();
      String originalPriceStr = variation.defaultPrice.replaceAll('₹', '').trim();
      
      try {
        currentPrice = double.tryParse(currentPriceStr) ?? 0;
        originalPrice = double.tryParse(originalPriceStr) ?? 0;
        
        if (originalPrice > 0 && currentPrice > 0 && originalPrice > currentPrice) {
          discountPercentage = ((originalPrice - currentPrice) / originalPrice) * 100;
          discountText = 'Save upto ${discountPercentage.toInt()}%';
        }
      } catch (e) {
        // Handle parsing errors
        print('Error parsing prices: $e');
      }
    } else {
      // Default values if no product data
      currentPrice = 299;
      originalPrice = 350;
      discountText = 'Save upto 15%';
    }
    
    // Extract tags from product if available
    List<Map<String, dynamic>> tags = [];
    
    if (product != null) {
      // Check if product has air purifying or perfect gift tags
      bool isAirPurifying = product!.tags.toLowerCase().contains('air purifying');
      bool isPerfectGift = product!.tags.toLowerCase().contains('perfect gift');
      
      if (isAirPurifying) {
        tags.add({
          'text': '🍃 Air Purifying',
          'color': 0x7F27DBE5,
        });
      }
      
      if (isPerfectGift) {
        tags.add({
          'text': '🎁 Perfect Gift',
          'color': 0x7FE5D827,
        });
      }
    }
    
    // If no tags were extracted, use default tags
    if (tags.isEmpty) {
      tags = [
        {
          'text': '🍃 Air Purifying',
          'color': 0x7F27DBE5,
        },
        {
          'text': '🎁 Perfect Gift',
          'color': 0x7FE5D827,
        },
      ];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tags and Share button row
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tags row
              Flexible(
                child: Row(
                  children: [
                    for (int i = 0; i < tags.length; i++) ...[
                      if (i > 0) const SizedBox(width: 7),
                      Container(
                        height: 20,
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        decoration: ShapeDecoration(
                          color: Color(tags[i]['color']),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          tags[i]['text'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Cabin',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              
              // Share button
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.share, size: 24),
                  const SizedBox(width: 10),
                  Text(
                    'Share',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.50),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Product title - use product name from API if available
        SizedBox(
          width: 400,
          child: Text(
            product?.name ?? productName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Price section with discount tag
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Discount tag - only show if there's a discount
            if (discountPercentage > 0)
              Container(
                height: 20,
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                decoration: ShapeDecoration(
                  color: const Color(0xFF54A801),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  discountText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            
            if (discountPercentage > 0)
              const SizedBox(width: 5),
            
            // Current price
            Text(
              '₹ $currentPrice',
              style: const TextStyle(
                color: Color(0xFF316300),
                fontSize: 24,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w700,
              ),
            ),
            
            // Original price (strikethrough) - only show if there's a discount
            if (originalPrice > currentPrice) ...[
              const SizedBox(width: 5),
              Text(
                '₹ $originalPrice',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.50),
                  fontSize: 16,
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ],
        ),
        
        const SizedBox(height: 20),
        
        // Variation selector for size and color
        if (product != null)
          VariationSelector(
            productId: product!.id,
            onVariationsSelected: (selectedVariations) {
              // Handle selected variations
              print('Selected variations: $selectedVariations');
            },
          ),
        
        const SizedBox(height: 20),
        
        // Action buttons
        Container(
          width: double.infinity,
          child: Row(
            children: [
              // Add to Cart button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Add to cart functionality
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Added to cart')),
                    );
                  },
                  child: Container(
                    height: 34,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF316300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 19,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              // Buy Now button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Show a SnackBar instead of navigating to a non-existent screen
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Buy Now pressed')),
                    );
                  },
                  child: Container(
                    height: 34,
                    margin: const EdgeInsets.only(left: 8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xFF316300),
                        ),
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                          color: Color(0xFF316300),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Delivery estimation section
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Estimated Delivery',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Pincode input
              Container(
                width: double.infinity,
                height: 34,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFF54A801),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Enter Pincode',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.50),
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      'Check',
                      style: TextStyle(
                        color: Color(0xFF316300),
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Delivery information
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Delivery by 19 May, Monday |',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.80),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const TextSpan(
                            text: ' Free',
                            style: TextStyle(
                              color: Color(0xFF54A801),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.80),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: '₹ 50',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.50),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      'If ordered before 6:52 PM',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.80),
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
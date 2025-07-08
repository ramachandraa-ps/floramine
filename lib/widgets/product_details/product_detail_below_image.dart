import 'package:flutter/material.dart';
import '../../screens/cart.dart'; // Import the cart screen

class ProductDetailBelowImage extends StatelessWidget {
  final String productName;
  final double currentPrice;
  final double originalPrice;
  final String discountText;
  final List<Map<String, dynamic>> tags;
  
  const ProductDetailBelowImage({
    Key? key,
    this.productName = 'Jasminum sambac, Mogra, Arabian Jasmine - Plant',
    this.currentPrice = 299,
    this.originalPrice = 350,
    this.discountText = 'Save upto 15%',
    this.tags = const [
      {
        'text': '🍃 Air Purifying',
        'color': 0x7F27DBE5,
      },
      {
        'text': '🎁 Perfect Gift',
        'color': 0x7FE5D827,
      },
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Row(
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
              
              // Share button
              Row(
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
        
        // Product title
        SizedBox(
          width: 400,
          child: Text(
            productName,
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
            // Discount tag
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
            
            const SizedBox(width: 5),
            
            // Original price (strikethrough)
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
        ),
        
        const SizedBox(height: 20),
        
        // Size selection
        Row(
          children: [
            const Text(
              'Select Size',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w500,
              ),
            ),
            
            const SizedBox(width: 10),
            
            // Size options
            Container(
              padding: const EdgeInsets.all(2),
              decoration: ShapeDecoration(
                color: const Color(0xFFEAEAEA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  // Small size
                  _buildSizeOption('S', false),
                  
                  // Medium size (selected)
                  _buildSizeOption('M', true),
                  
                  // Large size
                  _buildSizeOption('L', false),
                ],
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 20),
        
        // Color selection
        Row(
          children: [
            const Text(
              'Select Colour',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w500,
              ),
            ),
            
            const SizedBox(width: 10),
            
            // Color options
            Container(
              padding: const EdgeInsets.all(2),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  // White color (selected)
                  _buildColorOption(Colors.white, true),
                  
                  const SizedBox(width: 10),
                  
                  // Black color
                  _buildColorOption(Colors.black, false),
                  
                  const SizedBox(width: 10),
                  
                  // Red color
                  _buildColorOption(const Color(0xFF8D0000), false),
                  
                  const SizedBox(width: 10),
                  
                  // Blue color
                  _buildColorOption(const Color(0xFF002D61), false),
                ],
              ),
            ),
          ],
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
                    // Navigate to cart screen when Buy Now
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartScreen()),
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

  // Helper method to build size option
  Widget _buildSizeOption(String size, bool isSelected) {
    return Container(
      width: 30,
      height: 30,
      decoration: ShapeDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          size,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Cabin',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // Helper method to build color option
  Widget _buildColorOption(Color color, bool isSelected) {
    return Container(
      width: 30,
      height: 30,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          side: isSelected 
              ? const BorderSide(
                  width: 1,
                  color: Color(0xFF316300),
                )
              : BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
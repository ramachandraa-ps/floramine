import 'package:flutter/material.dart';

class BulkGiftsSection extends StatelessWidget {
  const BulkGiftsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final contentWidth = isTablet ? 600.0 : screenWidth * 0.9;
    
    return Container(
      decoration: const BoxDecoration(color: Color(0x0C54A801)),
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        children: [
          // Section title
          SizedBox(
            width: contentWidth,
            child: const Text(
              'Top Deals on Bulk Gifts',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          
          const SizedBox(height: 30),
          
          // Products grid - first row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First product card
                Expanded(
                  child: _buildBulkGiftCard(
                    context,
                    'Aglaonema Lipstick Plant - Corporate Gift (set of 30)',
                    '₹ 22,470',
                    '₹ 26,999'
                  ),
                ),
                
                const SizedBox(width: 20),
                
                // Second product card
                Expanded(
                  child: _buildBulkGiftCard(
                    context,
                    'Aglaonema Lipstick Plant - Corporate Gift (set of 30)',
                    '₹ 22,470',
                    '₹ 26,999'
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Products grid - second row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Third product card
                Expanded(
                  child: _buildBulkGiftCard(
                    context,
                    'Aglaonema Lipstick Plant - Corporate Gift (set of 30)',
                    '₹ 22,470',
                    '₹ 26,999'
                  ),
                ),
                
                const SizedBox(width: 20),
                
                // Fourth product card
                Expanded(
                  child: _buildBulkGiftCard(
                    context,
                    'Aglaonema Lipstick Plant - Corporate Gift (set of 30)',
                    '₹ 22,470',
                    '₹ 26,999'
                  ),
                ),
              ],
            ),
          ),
          
          // View All Products button
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
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
      ),
    );
  }
  
  Widget _buildBulkGiftCard(BuildContext context, String title, String price, String originalPrice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product image with tags
        Container(
          width: double.infinity,
          height: 190,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Stack(
            children: [
              // Product image
              Positioned(
                left: -8,
                top: -23,
                child: Container(
                  width: 275,
                  height: 275,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/jasminum_sambac.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              
              // Discount tag
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF54A801),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Save upto 15%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              // Favorite button
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 10),
        
        // Product title
        SizedBox(
          width: 190,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        
        const SizedBox(height: 10),
        
        // Size and color selection options
        Row(
          children: [
            // Size selection
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.10),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select Size',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(width: 10),
            
            // Color selection
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.10),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select Colour',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 10),
        
        // Price section
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              price,
              style: const TextStyle(
                color: Color(0xFF316300),
                fontSize: 18,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              originalPrice,
              style: TextStyle(
                color: Colors.black.withOpacity(0.50),
                fontSize: 12,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 10),
        
        // Tags section
        Row(
          children: [
            Container(
              height: 20,
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: ShapeDecoration(
                color: const Color(0x7F27DBE5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                '🍃 Air Purifying',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 7),
            Container(
              height: 20,
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: ShapeDecoration(
                color: const Color(0x7FE5D827),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                '🎁 Perfect Gift',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 10),
        
        // Action buttons
        Row(
          children: [
            Container(
              width: 73,
              height: 34,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 34,
                decoration: ShapeDecoration(
                  color: const Color(0xFF316300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 14,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
} 
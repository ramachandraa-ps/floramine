import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../screens/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onAddToCartPressed;
  final VoidCallback? onBuyNowPressed;
  final bool isFavorite;

  const ProductCard({
    Key? key,
    required this.product,
    this.onTap,
    this.onFavoritePressed,
    this.onAddToCartPressed,
    this.onBuyNowPressed,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the first variation for price display
    final variation = product.variations.isNotEmpty 
        ? product.variations.first 
        : null;
    
    // Parse tags
    List<String> tagsList = [];
    if (product.tags.isNotEmpty) {
      tagsList = product.tags.split(',').map((tag) => tag.trim()).toList();
    }

    // Check if product has air purifying or perfect gift tags
    bool isAirPurifying = product.tags.toLowerCase().contains('air purifying');
    bool isPerfectGift = product.tags.toLowerCase().contains('perfect gift');

    // Calculate discount percentage if available
    double discountPercentage = 0;
    double currentPrice = 0;
    double originalPrice = 0;
    
    if (variation != null) {
      // Extract numeric values from price strings
      String sellPriceStr = variation.defaultSellPrice.replaceAll('₹', '').trim();
      String originalPriceStr = variation.defaultPrice.replaceAll('₹', '').trim();
      
      try {
        currentPrice = double.tryParse(sellPriceStr) ?? 0;
        originalPrice = double.tryParse(originalPriceStr) ?? 0;
        
        if (originalPrice > 0 && currentPrice > 0) {
          discountPercentage = ((originalPrice - currentPrice) / originalPrice) * 100;
        }
      } catch (e) {
        // Handle parsing errors
      }
    }

    return GestureDetector(
      onTap: onTap ?? () {
        // Navigate to product details when card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              productName: product.name,
            ),
          ),
        );
      },
      child: LayoutBuilder(builder: (context, constraints) {
        // Calculate appropriate sizes based on available width
        final double availableWidth = constraints.maxWidth;
        final double imageHeight = availableWidth * 0.9; // Adjust image height proportionally

        return SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(), // Prevent scrolling within card
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image container with discount badge and favorite button
              SizedBox(
                width: availableWidth,
                height: imageHeight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Product image
                      product.images.isNotEmpty
                          ? Image.network(
                              product.images.first,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[200],
                                  child: const Center(
                                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                                  ),
                                );
                              },
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  color: Colors.grey[200],
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded /
                                              loadingProgress.expectedTotalBytes!
                                          : null,
                                      color: const Color(0xFF54A801),
                                    ),
                                  ),
                                );
                              },
                            )
                          : Container(
                              color: Colors.grey[200],
                              child: const Center(
                                child: Icon(Icons.image_not_supported, color: Colors.grey),
                              ),
                            ),
                      
                      // Discount badge
                      if (discountPercentage > 0)
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 20,
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                            decoration: const ShapeDecoration(
                              color: Color(0xFF54A801),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                ),
                              ),
                            ),
                            child: Text(
                              'Save upto ${discountPercentage.toInt()}%',
                              style: const TextStyle(
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
                        child: GestureDetector(
                          onTap: onFavoritePressed,
                          child: Container(
                            width: 20,
                            height: 20,
                            padding: const EdgeInsets.all(3),
                            decoration: const ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(18)),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.grey,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 6),
              
              // Product name
              Text(
                product.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: 6),
              
              // Size and color selection
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: [
                  _buildSelectionButton('Select Size'),
                  _buildSelectionButton('Select Colour'),
                ],
              ),
              
              const SizedBox(height: 6),
              
              // Price section
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    variation?.defaultSellPrice ?? '₹ 0',
                    style: const TextStyle(
                      color: Color(0xFF316300),
                      fontSize: 16,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      variation?.defaultPrice ?? '₹ 0',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.50),
                        fontSize: 10,
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.lineThrough,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 6),
              
              // Feature tags
              SizedBox(
                height: 20,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    // If we have USPs from API, use those
                    if (product.usps.isNotEmpty)
                      ...product.usps.map((usp) {
                        // Extract emoji and text if available
                        final parts = usp.split(' ');
                        final emoji = parts.isNotEmpty ? parts.first : '🌿';
                        final text = parts.length > 1 ? parts.sublist(1).join(' ') : usp;
                        
                        // Determine background color based on content
                        Color bgColor;
                        if (usp.toLowerCase().contains('air purifying')) {
                          bgColor = const Color(0x7F27DBE5); // Light blue
                        } else if (usp.toLowerCase().contains('perfect gift')) {
                          bgColor = const Color(0x7FE5D827); // Light yellow
                        } else if (usp.toLowerCase().contains('low maintenance')) {
                          bgColor = const Color(0x7F54A801); // Light green
                        } else if (usp.toLowerCase().contains('pet friendly')) {
                          bgColor = const Color(0x7FE527B9); // Light pink
                        } else {
                          bgColor = const Color(0x7FA0A0A0); // Light gray
                        }
                        
                        return _buildFeatureTag(usp, bgColor);
                      }).toList()
                    // Otherwise fall back to tag-based detection
                    else ...[
                      if (isAirPurifying)
                        _buildFeatureTag('🍃 Air Purifying', const Color(0x7F27DBE5)),
                      if (isPerfectGift)
                        _buildFeatureTag('🎁 Perfect Gift', const Color(0x7FE5D827)),
                      // Add other tags from API
                      for (var tag in tagsList)
                        if (!tag.toLowerCase().contains('air purifying') && 
                            !tag.toLowerCase().contains('perfect gift') &&
                            tag.isNotEmpty)
                          _buildFeatureTag('🌿 $tag', const Color(0x7F54A801)),
                    ],
                  ],
                ),
              ),
              
              const SizedBox(height: 10), // Increased spacing before buttons
              
              // Action buttons
              Row(
                children: [
                  // Buy Now button
                  GestureDetector(
                    onTap: onBuyNowPressed,
                    child: Container(
                      height: 36, // Increased height
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Increased padding
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            color: Color(0xFF316300),
                          ),
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(
                          color: Color(0xFF316300),
                          fontSize: 12, // Increased font size
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500, // Made text slightly bolder
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: 6), // Increased spacing between buttons
                  
                  // Add to Cart button
                  Expanded(
                    child: GestureDetector(
                      onTap: onAddToCartPressed,
                      child: Container(
                        height: 36, // Increased height
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Increased padding
                        decoration: ShapeDecoration(
                          color: const Color(0xFF316300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                                size: 14, // Slightly larger icon
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Add to Cart',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12, // Increased font size
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500, // Made text slightly bolder
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8), // Added bottom padding to prevent cutting off
            ],
          ),
        );
      }),
    );
  }

  Widget _buildSelectionButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 8,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 1),
          const Icon(
            Icons.arrow_drop_down,
            size: 12,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureTag(String text, Color backgroundColor) {
    return Container(
      height: 18,
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 8,
          fontFamily: 'Cabin',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
} 
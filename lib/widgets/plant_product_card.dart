import 'package:flutter/material.dart';
import '../screens/product_details_screen.dart';

class PlantProductCard extends StatelessWidget {
  final String? imageAsset;
  final String? imageUrl;
  final String name;
  final double currentPrice;
  final double originalPrice;
  final double discountPercentage;
  final bool isAirPurifying;
  final bool isPerfectGift;
  final VoidCallback? onBuyNowPressed;
  final VoidCallback? onAddToCartPressed;
  final VoidCallback? onFavoritePressed;
  final bool isFavorite;

  const PlantProductCard({
    Key? key,
    this.imageAsset,
    this.imageUrl,
    required this.name,
    required this.currentPrice,
    required this.originalPrice,
    this.discountPercentage = 0,
    this.isAirPurifying = false,
    this.isPerfectGift = false,
    this.onBuyNowPressed,
    this.onAddToCartPressed,
    this.onFavoritePressed,
    this.isFavorite = false,
  }) : assert(imageAsset != null || imageUrl != null, 'Either imageAsset or imageUrl must be provided'),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to product details screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              productName: name,
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
                      // Plant image - use either network image or asset image
                      if (imageUrl != null)
                        Image.network(
                          imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // Fallback to asset image if available, otherwise show error placeholder
                            if (imageAsset != null) {
                              return Image.asset(
                                imageAsset!,
                                fit: BoxFit.cover,
                              );
                            }
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
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        )
                      else
                        Image.asset(
                          imageAsset!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[200],
                              child: const Center(
                                child: Icon(Icons.image_not_supported, color: Colors.grey),
                              ),
                            );
                          },
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
              
              // Plant name
              Text(
                name,
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
                    '₹ ${currentPrice.toStringAsFixed(2)}',
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
                      '₹ ${originalPrice.toStringAsFixed(2)}',
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
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: [
                  if (isAirPurifying)
                    _buildFeatureTag('🍃 Air Purifying', const Color(0x7F27DBE5)),
                  if (isPerfectGift)
                    _buildFeatureTag('🎁 Perfect Gift', const Color(0x7FE5D827)),
                ],
              ),
              
              const SizedBox(height: 6),
              
              // Action buttons
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Buy Now button
                  Container(
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
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
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: 4),
                  
                  // Add to Cart button
                  Expanded(
                    child: GestureDetector(
                      onTap: onAddToCartPressed,
                      child: Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
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
                                size: 12,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Add to Cart',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
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
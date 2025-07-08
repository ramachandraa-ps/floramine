import 'package:flutter/material.dart';

class PlantProductCard extends StatelessWidget {
  final String imageAsset;
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
    required this.imageAsset,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image container with discount badge and favorite button
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
                // Plant image
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
                
                // Discount badge
                if (discountPercentage > 0)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                      decoration: const ShapeDecoration(
                        color: Color(0xFF54A801),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
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
                      width: 28,
                      height: 28,
                      padding: const EdgeInsets.all(4),
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
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 8),
          
          // Plant name
          SizedBox(
            width: 190,
            child: Text(
              name,
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
          
          const SizedBox(height: 8),
          
          // Size and color selection
          Wrap(
            spacing: 10,
            children: [
              _buildSelectionButton('Select Size'),
              _buildSelectionButton('Select Colour'),
            ],
          ),
          
          const SizedBox(height: 8),
          
          // Price section
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '₹ ${currentPrice.toInt()}',
                style: const TextStyle(
                  color: Color(0xFF316300),
                  fontSize: 18,
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '₹ ${originalPrice.toInt()}',
                style: const TextStyle(
                  color: Color(0x80000000),
                  fontSize: 12,
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          // Feature tags
          Wrap(
            spacing: 7,
            children: [
              if (isAirPurifying)
                _buildFeatureTag('🍃 Air Purifying', const Color(0x7F27DBE5)),
              if (isPerfectGift)
                _buildFeatureTag('🎁 Perfect Gift', const Color(0x7FE5D827)),
            ],
          ),
          
          const SizedBox(height: 8),
          
          // Action buttons
          Row(
            children: [
              // Buy Now button
              GestureDetector(
                onTap: onBuyNowPressed,
                child: Container(
                  height: 34,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(width: 10),
              
              // Add to Cart button
              Expanded(
                child: GestureDetector(
                  onTap: onAddToCartPressed,
                  child: Container(
                    height: 34,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0x1A000000),
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
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 14,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureTag(String text, Color backgroundColor) {
    return Container(
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
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
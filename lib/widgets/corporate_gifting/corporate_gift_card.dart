import 'package:flutter/material.dart';

class CorporateGiftCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String currentPrice;
  final String originalPrice;
  final List<String> tags;
  final bool hasDiscount;
  final String discountText;
  final VoidCallback? onTap;

  const CorporateGiftCard({
    Key? key,
    this.title = 'Plant Name',
    this.imageUrl = 'assets/images/jasminum_sambac.png',
    this.currentPrice = '₹299',
    this.originalPrice = '₹350',
    this.tags = const ['Air Purifying', 'Perfect Gift'],
    this.hasDiscount = true,
    this.discountText = 'Save upto 15%',
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
              // Product image with tags
              SizedBox(
                width: availableWidth,
                height: imageHeight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        imageUrl,
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
                      if (hasDiscount)
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
                              discountText,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'Cabin',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
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
              ),
              const SizedBox(height: 6),

              // Product title
              SizedBox(
                width: availableWidth,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 6),

              // Size and color selection options
              Wrap(
                spacing: 4,
                children: [
                  // Size selection
                  Container(
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
                      children: const [
                        Text(
                          'Select Size',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 1),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 12,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),

                  // Color selection
                  Container(
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
                      children: const [
                        Text(
                          'Select Colour',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 1),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 12,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),

              // Price section
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      currentPrice,
                      style: const TextStyle(
                        color: Color(0xFF316300),
                        fontSize: 16,
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      originalPrice,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.50),
                        fontSize: 10,
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),

              // Tags section
              SizedBox(
                width: availableWidth,
                child: Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: tags.map((tag) {
                    final bool isAirPurifying = tag.contains('Air');
                    
                    return Container(
                      height: 18,
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: ShapeDecoration(
                        color: isAirPurifying ? const Color(0x7F27DBE5) : const Color(0x7FE5D827),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        isAirPurifying ? '🍃 $tag' : '🎁 $tag',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 8,
                          fontFamily: 'Cabin',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 6),

              // Buy Now and Add to Cart buttons
              SizedBox(
                width: availableWidth,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Buy Now button
                      Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                      const SizedBox(width: 5),
                      
                      // Add to Cart button
                      Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF316300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
} 
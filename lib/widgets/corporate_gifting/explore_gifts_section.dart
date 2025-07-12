import 'package:flutter/material.dart';
import '../../models/corporate_gift_model.dart';

class ExploreGiftsSection extends StatelessWidget {
  final List<CorporateGift> gifts;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onRetry;
  final VoidCallback? onViewAllTap;

  const ExploreGiftsSection({
    Key? key,
    required this.gifts,
    required this.isLoading,
    this.errorMessage,
    required this.onRetry,
    this.onViewAllTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Explore Corporate Gifts',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (onViewAllTap != null)
                  GestureDetector(
                    onTap: onViewAllTap,
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: Color(0xFF54A801),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Gift products
          isLoading
              ? _buildLoadingState()
              : errorMessage != null
                  ? _buildErrorState(errorMessage!, onRetry)
                  : _buildGiftsList(gifts, context),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Container(
      height: 200,
      child: const Center(
        child: CircularProgressIndicator(
          color: Color(0xFF54A801),
        ),
      ),
    );
  }

  Widget _buildErrorState(String errorMessage, VoidCallback onRetry) {
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Failed to load corporate gifts',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              errorMessage,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF54A801),
              ),
              child: Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGiftsList(List<CorporateGift> gifts, BuildContext context) {
    if (gifts.isEmpty) {
      return Container(
        height: 200,
        child: Center(
          child: Text(
            'No corporate gifts available',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    return SizedBox(
      height: 320,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: gifts.length,
        itemBuilder: (context, index) {
          final gift = gifts[index];
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CorporateGiftCard(
              imageUrl: gift.image,
              title: gift.name,
              currentPrice: '₹1,499',  // Placeholder as API doesn't provide price
              originalPrice: '₹1,999', // Placeholder
              tags: ['Corporate', 'Gift'],
              hasDiscount: true,
              discountText: 'Save 25%',
              onTap: () {
                // Handle tap on gift card
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Selected: ${gift.name}'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class CorporateGiftCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String currentPrice;
  final String originalPrice;
  final List<String> tags;
  final bool hasDiscount;
  final String discountText;
  final VoidCallback? onTap;

  const CorporateGiftCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.currentPrice,
    required this.originalPrice,
    required this.tags,
    required this.hasDiscount,
    required this.discountText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                width: 220,
                height: 180,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 220,
                    height: 180,
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.image_not_supported,
                      color: Colors.grey[600],
                      size: 40,
                    ),
                  );
                },
              ),
            ),
            
            // Product details
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tags
                  Row(
                    children: tags.map((tag) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEEF6E6),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              color: Color(0xFF54A801),
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Price and discount
                  Row(
                    children: [
                      Text(
                        currentPrice,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        originalPrice,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const Spacer(),
                      if (hasDiscount)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEBEB),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            discountText,
                            style: const TextStyle(
                              color: Color(0xFFE54D4D),
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
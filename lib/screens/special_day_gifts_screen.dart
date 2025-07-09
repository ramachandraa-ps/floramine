import 'package:flutter/material.dart';
import '../widgets/special_day_gifts/gift_products_section_title.dart';
import '../widgets/special_day_gifts/gift_product_grid.dart';

class SpecialDayGiftsScreen extends StatelessWidget {
  const SpecialDayGiftsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header with green background
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: const Color(0xFF54A801),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  
                  // Title
                  const Text(
                    'Special Day Gifts',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  
                  // Cart icon with badge
                  Stack(
                    children: [
                      const Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              '0',
                              style: TextStyle(
                                color: Color(0xFF54A801),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  // Search input field
                  Expanded(
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(25),
                          right: Radius.circular(0),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search "Indoor Plants"',
                                hintStyle: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.mic, color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Search button
                  Container(
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFF54A801),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(0),
                        right: Radius.circular(25),
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gift categories
                    HorizontalGiftCategoriesList(),
                    
                    // Products section title
                    const GiftProductsSectionTitle(
                      title: 'Special Day Gift Plants',
                      description: 'Perfect plants to celebrate special moments and occasions with your loved ones.',
                    ),
                    
                    // Product grid
                    const GiftProductGrid(),
                    
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom HorizontalProductCard with error handling
class CustomHorizontalProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback? onTap;
  final bool isRounded;
  final bool isAsset;

  const CustomHorizontalProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.onTap,
    this.isRounded = false,
    this.isAsset = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 101,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Product image with error handling
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: isRounded
                    ? BorderRadius.circular(500)
                    : BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: isRounded
                    ? BorderRadius.circular(500)
                    : BorderRadius.circular(8),
                child: isAsset
                    ? Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: Icon(
                              Icons.image_not_supported,
                              color: Colors.grey[600],
                            ),
                          );
                        },
                      )
                    : Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: Icon(
                              Icons.image_not_supported,
                              color: Colors.grey[600],
                            ),
                          );
                        },
                      ),
              ),
            ),

            const SizedBox(height: 8),

            // Product title
            SizedBox(
              width: 101,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
                maxLines: 2,
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalGiftCategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List of gift categories data
    final List<Map<String, dynamic>> giftCategories = [
      {
        'title': 'Birthdays',
        'imageUrl': 'assets/images/special_day_gifts/birthdays.png',
        'isRounded': true,
      },
      {
        'title': 'Anniversaries',
        'imageUrl': 'assets/images/special_day_gifts/anniversaries.png',
        'isRounded': true,
      },
      {
        'title': 'Graduations',
        'imageUrl': 'assets/images/special_day_gifts/graduations.png',
        'isRounded': true,
      },
      {
        'title': 'Romantic Surprises',
        'imageUrl': 'assets/images/special_day_gifts/romantic_surprises.png',
        'isRounded': true,
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 15),
            child: Text(
              'Gift Categories',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            height: 160,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    for (var category in giftCategories)
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: CustomHorizontalProductCard(
                          imageUrl: category['imageUrl'],
                          title: category['title'],
                          isRounded: category['isRounded'],
                          isAsset: true,
                          onTap: () {
                            // Handle tap for each gift category
                            print('Tapped on ${category['title']}');
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

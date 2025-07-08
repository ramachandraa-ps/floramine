import 'package:flutter/material.dart';

class OtherProductsSection extends StatelessWidget {
  const OtherProductsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header with title and See All button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Other Products',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle See All tap
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      color: Color(0xFF54A801),
                      fontSize: 14,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Horizontal scrollable product cards
          SizedBox(
            height: 220, // Increased height to accommodate content
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Planters card
                  _buildProductCard(
                    title: 'Planters - Starting ₹129',
                    description:
                        'Add color to your garden. 400+ pots of different colors, shapes, and materials.',
                    backgroundImage: 'assets/images/home_screen/planters_bg.png',
                  ),

                  const SizedBox(width: 16),

                  // Soil & Fertilizers card
                  _buildProductCard(
                    title: 'Soil & Fertilizers - Starting ₹100',
                    description:
                        'Healthy food is a key for healthy plants. Choose from a wide range of soil.',
                    backgroundImage:
                        'assets/images/home_screen/soil_fertilizers_bg.png',
                  ),

                  const SizedBox(width: 16),

                  // Tools card
                  _buildProductCard(
                    title: 'Tools - Starting ₹129',
                    description:
                        'Get a tool for every gardening activity and make it a fun experience.',
                    backgroundImage: 'assets/images/home_screen/tools_bg.png',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build product cards
  Widget _buildProductCard({
    required String title,
    required String description,
    required String backgroundImage,
  }) {
    return Container(
      width: 300,
      height: 220, // Increased height to match parent container
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16), // Adjusted padding
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0.91, 0.85),
            end: const Alignment(0.06, 0.07),
            colors: [
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18, // Slightly reduced font size
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8), // Reduced spacing
            SizedBox(
              width: 260, // Adjusted width
              child: Text(
                description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12, // Slightly reduced font size
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 3, // Limit number of lines
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(), // Push button to bottom
            Container(
              height: 36, // Slightly reduced height
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: ShapeDecoration(
                color: const Color(0xFF54A801),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Explore Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 16,
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

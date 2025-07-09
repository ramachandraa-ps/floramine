import 'package:flutter/material.dart';

class GiftingCategoriesSection extends StatelessWidget {
  const GiftingCategoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 440,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0x0C54A801)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 400,
            child: Text(
              'Our Gifting Categories',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Corporate Gifts
                _buildGiftingCategoryItem(
                  imageUrl: 'assets/images/gifting/corporate_gifts.png',
                  title: 'Corporate Gifts',
                  onTap: () {
                    Navigator.pushNamed(context, '/corporate_gifting');
                  },
                ),
                const SizedBox(height: 30),
                
                // Special Day Gifts
                _buildGiftingCategoryItem(
                  imageUrl: 'assets/images/gifting/special_day_gifts.png',
                  title: 'Special Day Gifts',
                  onTap: () {
                    Navigator.pushNamed(context, '/special_day_gifts');
                  },
                ),
                const SizedBox(height: 30),
                
                // Occasion Gifts
                _buildGiftingCategoryItem(
                  imageUrl: 'assets/images/gifting/occasion_gifts.png',
                  title: 'Occasion Gifts',
                  onTap: () {
                    Navigator.pushNamed(context, '/occasion_gifts');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftingCategoryItem({
    required String imageUrl,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image container
          Container(
            width: double.infinity,
            height: 232,
            padding: const EdgeInsets.all(20),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
                onError: (exception, stackTrace) => NetworkImage("https://placehold.co/400x232"),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          
          // Title and button row
          Container(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 34,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF316300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Explore',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 
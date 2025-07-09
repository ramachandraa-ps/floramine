import 'package:flutter/material.dart';
import '../widgets/corporate_gifting/corporate_gift_form.dart';
import '../widgets/corporate_gifting/explore_gifts_section.dart';
import '../widgets/corporate_gifting/personalized_gifting_section.dart';
import '../widgets/corporate_gifting/corporate_testimonials_section.dart';

class CorporateGiftingScreen extends StatelessWidget {
  const CorporateGiftingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              const Rectangle135(),
              
              // Main content
              const Frame427320937(),
              
              // Explore Gifts Section
              ExploreGiftsSection(
                giftProducts: [
                  {
                    'imageUrl': 'assets/images/plants/plant_1.png',
                    'title': 'Corporate Gift Hamper - Eco-Friendly',
                    'currentPrice': '₹1,499',
                    'originalPrice': '₹1,999',
                    'tags': ['Eco-Friendly', 'Branded'],
                    'hasDiscount': true,
                    'discountText': 'Save 25%'
                  },
                  {
                    'imageUrl': 'assets/images/plants/plant_2.png',
                    'title': 'Premium Plant Gift Box',
                    'currentPrice': '₹2,499',
                    'originalPrice': '₹2,999',
                    'tags': ['Premium', 'Custom'],
                    'hasDiscount': true,
                    'discountText': 'Save 15%'
                  },
                  {
                    'imageUrl': 'assets/images/plants/plant_3.png',
                    'title': 'Desktop Plant Collection',
                    'currentPrice': '₹999',
                    'originalPrice': '₹1,299',
                    'tags': ['Desktop', 'Office'],
                    'hasDiscount': true,
                    'discountText': 'Save 20%'
                  },
                  {
                    'imageUrl': 'assets/images/plants/plant_4.png',
                    'title': 'Executive Plant Gift Set',
                    'currentPrice': '₹3,499',
                    'originalPrice': '₹3,999',
                    'tags': ['Executive', 'Premium'],
                    'hasDiscount': true,
                    'discountText': 'Save 10%'
                  },
                ],
                onViewAllTap: () {
                  // Navigate to all corporate gifts
                },
              ),
              
              // Personalized Gifting Section
              const PersonalizedGiftingSection(),
              
              // Testimonials Section
              CorporateTestimonialsSection(
                testimonials: [
                  {
                    'name': 'Sarath Kumar',
                    'rating': '2 Star',
                    'review': '"Reliable and trustworthy. They have earned my trust and loyalty. This company has consistently demonstrated reliability and trustworthiness."',
                    'image': 'assets/images/testimonials/user1.png',
                  },
                  {
                    'name': 'Priya Sharma',
                    'rating': '5 Star',
                    'review': '"Exceptional service! The plants arrived in perfect condition and the corporate branding was exactly what we wanted. Will definitely order again."',
                    'image': 'assets/images/testimonials/user1.png',
                  },
                  {
                    'name': 'Raj Patel',
                    'rating': '4 Star',
                    'review': '"Great quality plants for our office space. The team was very responsive and helped us choose the right plants for our environment."',
                    'image': 'assets/images/testimonials/user1.png',
                  },
                ],
                onWriteReviewTap: () {
                  // Handle write review action
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Write a review feature coming soon!')),
                  );
                },
              ),
              
              // Bottom padding
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class Rectangle135 extends StatelessWidget {
  const Rectangle135({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 117,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, 0.50),
              end: Alignment(1.00, 0.50),
              colors: [Color(0xFF54A801), Color(0xFF214200)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Back button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 40,
                    height: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xFFE4E4E4),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                
                // Search bar
                Expanded(
                  child: Container(
                    height: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 41,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(color: Colors.white),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Search ',
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.50),
                                          fontSize: 11,
                                          fontFamily: 'Cabin',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: '"Indoor Plants"',
                                        style: TextStyle(
                                          color: Color(0x7F622700),
                                          fontSize: 11,
                                          fontFamily: 'Cabin',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.mic,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 52,
                          height: 40,
                          padding: const EdgeInsets.all(13),
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(color: Color(0xFF54A801)),
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                
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
                        width: 12.50,
                        height: 12.50,
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '5',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 7,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
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
        ),
      ],
    );
  }
}

class Frame427320937 extends StatelessWidget {
  const Frame427320937({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 19),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFFEEF6E6)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Bulk Plant Gifts for Your Clients, Employees & Events',
                        style: TextStyle(
                          color: const Color(0xFF316300),
                          fontSize: 32,
                          fontFamily: 'Cabin',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              
              // Hero image
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/corporate_gifting/hero.png',
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 350,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Icon(Icons.image_not_supported, color: Colors.grey, size: 50),
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Form section
              const CorporateGiftForm(),
            ],
          ),
        ),
      ],
    );
  }
}

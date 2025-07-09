import 'package:flutter/material.dart';
import '../widgets/gifting/why_choose_plant_gifting_section.dart';
import '../widgets/gifting/gifting_categories_section.dart';
import '../widgets/gifting/whats_included_section.dart';
import '../widgets/gifting/how_to_order_section.dart';
import '../widgets/gifting/gifting_testimonials_section.dart';

class GiftingScreen extends StatelessWidget {
  const GiftingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with Rectangle135
              const Rectangle135(),
              
              // Why Choose Plant Gifting Section
              const WhyChoosePlantGiftingSection(),
              
              // Gifting Categories Section
              const GiftingCategoriesSection(),
              
              // What's Included Section
              const WhatsIncludedSection(),
              
              // How to Order Section
              const HowToOrderSection(),
              
              // Testimonials Section
              const GiftingTestimonialsSection(),
              
              // Bottom Padding
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
        
        const SizedBox(height: 20),
        
        // Banner section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFFF7FFEF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Celebrate ',
                            style: TextStyle(
                              color: Color(0xFF54A801),
                              fontSize: 32,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 1.38,
                            ),
                          ),
                          TextSpan(
                            text: 'Moments That Matter,',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 1.38,
                            ),
                          ),
                          TextSpan(
                            text: ' the Green Way',
                            style: TextStyle(
                              color: Color(0xFF54A801),
                              fontSize: 32,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 1.38,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'From birthdays to anniversaries, make every special day unforgettable with a plant gift that symbolizes life, love, and lasting memories.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 14),
                    InkWell(
                      onTap: () {
                        // Navigate to special day gifts
                      },
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
                            const Text(
                              'Shop Special Day Gifts',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/gifting/gift_banner.png',
                    width: double.infinity,
                    height: 206.67,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 206.67,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.image_not_supported,
                            color: Colors.grey,
                            size: 50,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

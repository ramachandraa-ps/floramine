import 'package:flutter/material.dart';
import 'testimonial_card.dart';

class TestimonialSection extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> testimonials;
  final VoidCallback? onWriteReviewTap;
  final bool showWriteReviewButton;
  final double cardWidth;
  final double sectionHeight;

  const TestimonialSection({
    Key? key,
    this.title = 'Testimonials',
    required this.testimonials,
    this.onWriteReviewTap,
    this.showWriteReviewButton = true,
    this.cardWidth = 300,
    this.sectionHeight = 220,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          
          const SizedBox(height: 30),
          
          // Horizontally scrollable testimonials
          SizedBox(
            height: sectionHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: testimonials.length,
              itemBuilder: (context, index) {
                final testimonial = testimonials[index];
                return Container(
                  width: cardWidth,
                  margin: EdgeInsets.only(
                    right: index < testimonials.length - 1 ? 20 : 0,
                    left: index == 0 ? 0 : 0,
                  ),
                  child: TestimonialCard(
                    name: testimonial['name'],
                    rating: testimonial['rating'],
                    review: testimonial['review'],
                    imageUrl: testimonial['image'],
                  ),
                );
              },
            ),
          ),
          
          if (showWriteReviewButton) ...[
            const SizedBox(height: 30),
            
            // Write a review button
            GestureDetector(
              onTap: onWriteReviewTap,
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Write a review',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
} 
import 'package:flutter/material.dart';
import '../testimonials/testimonial_section.dart';

class GiftingTestimonialsSection extends StatelessWidget {
  const GiftingTestimonialsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TestimonialSection(
      title: 'What Our Gift Recipients Say',
      testimonials: [
        {
          'name': 'Sarath Kumar',
          'rating': 5,
          'review':
              '"The plant gift was perfect for my friend\'s housewarming. It arrived on time and looked even better than in the photos. Will definitely use this service again!"',
          'image': 'assets/images/testimonials/user1.png',
        },
        {
          'name': 'Priya Sharma',
          'rating': 5,
          'review':
              '"Sent a plant as a birthday gift and the recipient loved it! The packaging was beautiful and the personalized message card was a lovely touch."',
          'image': 'assets/images/testimonials/user2.png',
        },
        {
          'name': 'Rahul Verma',
          'rating': 4,
          'review':
              '"Ordered plants as corporate gifts for our clients. The branding was perfect and delivery was seamless. Our clients were impressed with the quality."',
          'image': 'assets/images/testimonials/user3.png',
        },
      ],
      onWriteReviewTap: () {
        // Handle write review action
      },
      showWriteReviewButton: true,
      cardWidth: 300,
      sectionHeight: 220,
    );
  }
} 
import 'package:flutter/material.dart';
import '../testimonials/testimonial_section.dart';

class CorporateTestimonialsSection extends StatelessWidget {
  final List<Map<String, dynamic>> testimonials;
  final VoidCallback? onWriteReviewTap;

  const CorporateTestimonialsSection({
    Key? key,
    this.testimonials = const [
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
        'image': 'assets/images/testimonials/user2.png',
      },
      {
        'name': 'Raj Patel',
        'rating': '4 Star',
        'review': '"Great quality plants for our office space. The team was very responsive and helped us choose the right plants for our environment."',
        'image': 'assets/images/testimonials/user3.png',
      },
    ],
    this.onWriteReviewTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TestimonialSection(
      title: 'Testimonials',
      testimonials: testimonials,
      onWriteReviewTap: onWriteReviewTap,
      showWriteReviewButton: onWriteReviewTap != null,
      cardWidth: 350,
      sectionHeight: 200,
    );
  }
} 
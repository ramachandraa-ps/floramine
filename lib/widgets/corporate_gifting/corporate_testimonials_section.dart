import 'package:flutter/material.dart';

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
              'Testimonials',
              textAlign: TextAlign.center,
              style: TextStyle(
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
            height: 200, // Fixed height for the testimonial cards
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: testimonials.length,
              itemBuilder: (context, index) {
                final testimonial = testimonials[index];
                return Container(
                  width: 350,
                  margin: EdgeInsets.only(
                    right: index < testimonials.length - 1 ? 20 : 0,
                    left: index == 0 ? 0 : 0,
                  ),
                  padding: const EdgeInsets.all(20),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.10),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User info and rating row
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // User profile image (optional)
                                if (testimonial.containsKey('image') && testimonial['image'] != null)
                                  Container(
                                    width: 40,
                                    height: 40,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(testimonial['image']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                Text(
                                  testimonial['name'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: ShapeDecoration(
                                color: Colors.black.withOpacity(0.05),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    testimonial['rating'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.50),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 13),
                      
                      // Review text
                      Expanded(
                        child: Text(
                          testimonial['review'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          
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
                  side: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
              child: Row(
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
      ),
    );
  }
} 
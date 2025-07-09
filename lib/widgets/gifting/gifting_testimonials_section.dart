import 'package:flutter/material.dart';

class GiftingTestimonialsSection extends StatelessWidget {
  const GiftingTestimonialsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section title
          const SizedBox(
            width: 400,
            child: Text(
              'What Our Gift Recipients Say',
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

          // Horizontal scrolling testimonial cards
          SizedBox(
            height: 220, // Increased height to accommodate user image
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildTestimonialCard(
                  name: 'Sarath Kumar',
                  rating: 5,
                  review:
                      '"The plant gift was perfect for my friend\'s housewarming. It arrived on time and looked even better than in the photos. Will definitely use this service again!"',
                  imageUrl:
                      'assets/images/testimonials/user1.png',
                ),
                const SizedBox(width: 20),
                _buildTestimonialCard(
                  name: 'Priya Sharma',
                  rating: 5,
                  review:
                      '"Sent a plant as a birthday gift and the recipient loved it! The packaging was beautiful and the personalized message card was a lovely touch."',
                  imageUrl:
                      'assets/images/testimonials/user2.png',
                ),
                const SizedBox(width: 20),
                _buildTestimonialCard(
                  name: 'Rahul Verma',
                  rating: 4,
                  review:
                      '"Ordered plants as corporate gifts for our clients. The branding was perfect and delivery was seamless. Our clients were impressed with the quality."',
                  imageUrl:
                      'assets/images/testimonials/user3.png',
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Write a review button
          Container(
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
        ],
      ),
    );
  }

  Widget _buildTestimonialCard({
    required String name,
    required int rating,
    required String review,
    required String imageUrl,
  }) {
    return Container(
      width: 300,
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
        shadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info row with image, name and rating
          Row(
            children: [
              // User image
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) => const NetworkImage(
                      'https://ui-avatars.com/api/?name=User&background=random',
                    ), // Fallback image if asset not found
                  ),
                ),
              ),

              const SizedBox(width: 15),

              // Name and rating column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 5),

                    // Rating with star icon
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: ShapeDecoration(
                        color: Colors.black.withOpacity(0.05),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color:
                                const Color(0xFFFFD700), // Gold color for star
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '$rating Star',
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
            ],
          ),

          const SizedBox(height: 15),

          // Review text
          Text(
            review,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
} 
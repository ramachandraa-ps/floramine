import 'package:flutter/material.dart';
import 'no_reviews_widget.dart';

class CustomerReview extends StatefulWidget {
  const CustomerReview({Key? key}) : super(key: key);

  @override
  State<CustomerReview> createState() => _CustomerReviewState();
}

class _CustomerReviewState extends State<CustomerReview> {
  // Sample data - in a real app, this would come from an API
  // Set to false to show the "No Reviews" state
  final bool _hasReviews = false;

  @override
  Widget build(BuildContext context) {
    // If there are no reviews, show the NoReviewsWidget
    if (!_hasReviews) {
      return NoReviewsWidget(
        onWriteReviewPressed: () {
          // Handle write review action
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Write a review action')),
          );
        },
      );
    }

    // Get the screen width to make responsive adjustments
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title - make it responsive
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Customer Reviews & Feedbacks',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              // Adjust font size based on screen width
              fontSize: screenWidth < 600 ? 28 : 40,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        
        // Review summary card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: ShapeDecoration(
            color: Colors.black.withOpacity(0.05),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            children: [
              // Rating summary
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Reviews',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '4.1',
                        style: TextStyle(
                          color: Color(0xFF54A801),
                          fontSize: 60,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Star rating
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: index < 4 ? Colors.amber : Colors.grey.shade300,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            '128.45k reviews',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Write a review button
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF622700),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Write a Review',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              
              // Rating breakdown - use ListView to prevent overflow
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildRatingBar(context, 5, 0.62, '5.1k'),
                    const SizedBox(height: 9),
                    _buildRatingBar(context, 4, 0.50, '41.1k'),
                    const SizedBox(height: 9),
                    _buildRatingBar(context, 3, 0.79, '71.1k'),
                    const SizedBox(height: 9),
                    _buildRatingBar(context, 2, 0.52, '5.1k'),
                    const SizedBox(height: 9),
                    _buildRatingBar(context, 1, 0.40, '1.1k'),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Review cards
        _buildReviewCard(
          context,
          userName: 'Jenny Wilson',
          date: 'Nov 26, 2025',
          reviewText: 'Bright, indirect light is best for the Areca Palms. They need to be watered once a week or when the top inch of soil feels dry. Palms prefer evenly moist soil but are susceptible to root rot if overwatered.',
        ),
        
        const SizedBox(height: 10),
        
        _buildReviewCard(
          context,
          userName: 'Jenny Wilson',
          date: 'Nov 26, 2025',
          reviewText: 'Bright, indirect light is best for the Areca Palms. They need to be watered once a week or when the top inch of soil feels dry.',
        ),
        
        const SizedBox(height: 20),
        
        // View all reviews button - center it
        Center(
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(26),
              ),
            ),
            child: const Center(
              child: Text(
                'View All Reviews',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  
  // Helper method to build rating bar
  Widget _buildRatingBar(BuildContext context, int rating, double fillPercentage, String count) {
    // Get available width to make the progress bar responsive
    final availableWidth = MediaQuery.of(context).size.width - 150; // Subtract space for other elements
    final progressBarWidth = availableWidth * 0.6; // Use 60% of available width
    
    return Row(
      mainAxisSize: MainAxisSize.min, // Prevent overflow
      children: [
        // Rating number with star
        SizedBox(
          width: 40,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$rating',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.star, size: 16, color: Colors.amber),
            ],
          ),
        ),
        
        const SizedBox(width: 8),
        
        // Progress bar - make it responsive
        Container(
          width: progressBarWidth,
          height: 5,
          decoration: ShapeDecoration(
            color: const Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Stack(
            children: [
              Container(
                width: progressBarWidth * fillPercentage,
                height: 3,
                margin: const EdgeInsets.symmetric(vertical: 1),
                decoration: ShapeDecoration(
                  color: const Color(0xFF54A801),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(width: 8),
        
        // Count
        SizedBox(
          width: 40,
          child: Text(
            count,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
  
  // Helper method to build review card
  Widget _buildReviewCard(
    BuildContext context, {
    required String userName,
    required String date,
    required String reviewText,
    int rating = 5,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.black.withOpacity(0.10)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info and rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // User info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.50),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              
              // Star rating
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    color: index < rating ? Colors.amber : Colors.grey.shade300,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 10),
          
          // Review text
          Text(
            reviewText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
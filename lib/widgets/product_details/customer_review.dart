import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import 'no_reviews_widget.dart';

class CustomerReview extends StatefulWidget {
  final bool forceShowReviews;
  final List<Review>? apiReviews;
  final ReviewSummary? reviewSummary;
  final ReviewPagination? reviewPagination;
  
  const CustomerReview({
    Key? key,
    this.forceShowReviews = true,
    this.apiReviews,
    this.reviewSummary,
    this.reviewPagination,
  }) : super(key: key);

  @override
  State<CustomerReview> createState() => _CustomerReviewState();
}

class _CustomerReviewState extends State<CustomerReview> {
  // Check if we have reviews from the API
  bool get _hasReviews => widget.apiReviews != null && widget.apiReviews!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    // If no reviews and not forcing to show reviews UI, show the "No Reviews" widget
    if (!_hasReviews && !widget.forceShowReviews) {
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
    
    // Get review stats from API or use defaults
    final totalReviews = widget.reviewSummary?.totalReviews ?? 0;
    final averageRating = widget.reviewSummary?.averageRating ?? 0.0;
    final breakdown = widget.reviewSummary?.breakdown ?? {};
    
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
                      Text(
                        averageRating.toStringAsFixed(1),
                        style: const TextStyle(
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
                                color: index < averageRating.round() ? Colors.amber : Colors.grey.shade300,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '$totalReviews reviews',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
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
                  GestureDetector(
                    onTap: () {
                      // Handle write review action
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Write a review action')),
                      );
                    },
                    child: Container(
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
                    _buildRatingBar(context, 5, _getBreakdownPercentage('5_star', breakdown), breakdown['5_star'] ?? '0'),
                    const SizedBox(height: 9),
                    _buildRatingBar(context, 4, _getBreakdownPercentage('4_star', breakdown), breakdown['4_star'] ?? '0'),
                    const SizedBox(height: 9),
                    _buildRatingBar(context, 3, _getBreakdownPercentage('3_star', breakdown), breakdown['3_star'] ?? '0'),
                    const SizedBox(height: 9),
                    _buildRatingBar(context, 2, _getBreakdownPercentage('2_star', breakdown), breakdown['2_star'] ?? '0'),
                    const SizedBox(height: 9),
                    _buildRatingBar(context, 1, _getBreakdownPercentage('1_star', breakdown), breakdown['1_star'] ?? '0'),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Review cards - show API reviews if available, otherwise show sample reviews
        if (_hasReviews) 
          ...widget.apiReviews!.map((review) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _buildReviewCard(
              context,
              userName: review.contactName,
              date: review.createdAt,
              reviewText: review.comments,
              rating: review.rating,
              imageUrl: review.contactImg,
              reviewImages: review.images,
            ),
          )).toList()
        else
          ...[
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
          ],
        
        const SizedBox(height: 20),
        
        // View all reviews button - center it
        if (widget.reviewPagination != null && widget.reviewPagination!.total > widget.reviewPagination!.perPage)
          Center(
            child: GestureDetector(
              onTap: () {
                // Handle view all reviews action
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('View all reviews action')),
                );
              },
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
          ),
      ],
    );
  }
  
  // Helper method to calculate breakdown percentage
  double _getBreakdownPercentage(String starKey, Map<String, String> breakdown) {
    if (breakdown.isEmpty) return 0.0;
    
    try {
      // Get total reviews
      int total = 0;
      breakdown.forEach((key, value) {
        total += int.tryParse(value) ?? 0;
      });
      
      if (total == 0) return 0.0;
      
      // Get count for this star rating
      int count = int.tryParse(breakdown[starKey] ?? '0') ?? 0;
      
      // Calculate percentage
      return count / total;
    } catch (e) {
      return 0.0;
    }
  }

  // Helper method to build rating bar
  Widget _buildRatingBar(BuildContext context, int stars, double fillPercentage, String count) {
    final double progressBarWidth = MediaQuery.of(context).size.width * 0.5;
    
    return Row(
      children: [
        // Stars label
        SizedBox(
          width: 40,
          child: Row(
            children: [
              Text(
                '$stars',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 14,
              ),
            ],
          ),
        ),
        
        // Progress bar
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
    String? imageUrl,
    List<String>? reviewImages,
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
              // User info with profile image
              Row(
                children: [
                  // Profile image
                  if (imageUrl != null && imageUrl.isNotEmpty)
                    Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                          onError: (exception, stackTrace) => const AssetImage('assets/images/default_profile.png'),
                        ),
                      ),
                    ),
                  
                  // User name and date
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
          
          // Review images
          if (reviewImages != null && reviewImages.isNotEmpty) ...[
            const SizedBox(height: 10),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: reviewImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(reviewImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
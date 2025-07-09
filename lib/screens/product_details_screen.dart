import 'package:flutter/material.dart';
import '../widgets/search_bar.dart';
import '../widgets/product_details/product_action_bar.dart';
import '../widgets/product_details/image_section.dart';
import '../widgets/product_details/product_detail_below_image.dart';
import '../widgets/product_details/product_description.dart';
import '../widgets/product_details/customer_review.dart';
import '../widgets/product_details/related_products.dart';
import '../widgets/product_details/you_might_also_like.dart';
import '../widgets/product_details/last_viewed_products.dart';
import '../widgets/product_details/no_reviews_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productName;
  
  const ProductDetailsScreen({
    Key? key,
    required this.productName,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  // State to control whether to show reviews or no reviews
  bool _hasReviews = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header with gradient background
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
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40,
                        height: 40,
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
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 18,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    
                    // Search bar
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomSearchBar(
                          hintText: 'Indoor Plants',
                          onSearchIconTap: () {
                            // Handle search
                          },
                        ),
                      ),
                    ),
                    
                    // Cart icon with badge
                    Stack(
                      children: [
                        const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 16,
                            height: 16,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: const Color(0xFF54A801),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.5,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '5',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
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
          ),
          
          // Product details content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    
                    // 1. Image Section
                    const ProductImageSection(),
                    
                    const SizedBox(height: 16),
                    
                    // 2. Product Detail Below Image
                    const ProductDetailBelowImage(),
                    
                    const SizedBox(height: 16),
                    
                    // 3. Product Description
                    const ProductDescription(),
                    
                    const SizedBox(height: 16),
                    
                    // Toggle switch for reviews/no reviews
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Toggle Reviews',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Switch(
                          value: _hasReviews,
                          activeColor: const Color(0xFF54A801),
                          onChanged: (value) {
                            setState(() {
                              _hasReviews = value;
                            });
                          },
                        ),
                      ],
                    ),
                    
                    // 4. Customer Review - conditionally show reviews or no reviews
                    _hasReviews 
                      ? const CustomerReview() 
                      : NoReviewsWidget(
                          onWriteReviewPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Write a review pressed')),
                            );
                          },
                        ),
                    
                    const SizedBox(height: 16),
                    
                    // 5. Related Products
                    const RelatedProducts(),
                    
                    const SizedBox(height: 16),
                    
                    // 6. You Might Also Like
                    const YouMightAlsoLike(),
                    
                    const SizedBox(height: 16),
                    
                    // 7. Last Viewed Products
                    const LastViewedProducts(),
                    
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
          
          // Bottom action bar
          ProductActionBar(
            onAddToCartPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Added to cart')),
              );
            },
            onBuyNowPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Buy Now pressed')),
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
import '../providers/product_provider.dart';
import '../models/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productName;
  final int? productId;
  
  const ProductDetailsScreen({
    Key? key,
    required this.productName,
    this.productId,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  // State to control whether to show reviews or no reviews
  bool _hasReviews = false;
  Product? _product;
  bool _isLoadingProduct = false;

  @override
  void initState() {
    super.initState();
    
    // If productId is provided, fetch the product details
    if (widget.productId != null) {
      _isLoadingProduct = true;
      // Use post-frame callback to ensure the widget is fully built
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _fetchProductDetails();
        }
      });
    }
  }
  
  Future<void> _fetchProductDetails() async {
    try {
      final productProvider = Provider.of<ProductProvider>(context, listen: false);
      await productProvider.getProductById(widget.productId!);
      if (mounted) {
        setState(() {
          _product = productProvider.selectedProduct;
          _isLoadingProduct = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingProduct = false;
        });
      }
      print('Error fetching product details: $e');
    }
  }

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
            child: _isLoadingProduct 
              ? const Center(
                  child: CircularProgressIndicator(color: Color(0xFF54A801)),
                )
              : _buildProductDetails(),
          ),
          
          // Product Action Bar (Add to Cart, Buy Now)
          const ProductActionBar(),
        ],
      ),
    );
  }
  
  Widget _buildProductDetails() {
    // Use local product state or get it from provider
    final product = _product ?? Provider.of<ProductProvider>(context).selectedProduct;
    final error = Provider.of<ProductProvider>(context).error;
    
    // Show error message if there was an error
    if (error != null && product == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            const Text(
              'Error loading product details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(error),
          ],
        ),
      );
    }
    
    // Show product details if available
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            
            // 1. Image Section - Pass product images if available
            ProductImageSection(
              images: product?.images,
            ),
            
            const SizedBox(height: 16),
            
            // 2. Product Detail Below Image - Pass product data if available
            ProductDetailBelowImage(
              product: product,
              productName: product?.name ?? widget.productName,
            ),
            
            const SizedBox(height: 16),
            
            // 3. Product Description - Pass product description if available
            ProductDescription(
              description: product?.productDescription,
            ),
            
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
            
            // 5. Related Products - Pass product category if available
            if (product?.categoryName != null && product!.categoryName.isNotEmpty)
              RelatedProducts(
                category: product.categoryName,
              ),
            
            const SizedBox(height: 16),
            
            // 6. You Might Also Like
            const YouMightAlsoLike(),
            
            const SizedBox(height: 16),
            
            // 7. Last Viewed Products
            const LastViewedProducts(),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/occasion_gifts/occasion_products_section_title.dart';
import '../widgets/occasion_gifts/occasion_product_grid.dart';
import '../widgets/filter_widget.dart';
import '../models/occasion_category_model.dart';
import '../services/occasion_service.dart';
import 'dart:developer' as developer;

class OccasionGiftsScreen extends StatefulWidget {
  const OccasionGiftsScreen({Key? key}) : super(key: key);

  @override
  _OccasionGiftsScreenState createState() => _OccasionGiftsScreenState();
}

class _OccasionGiftsScreenState extends State<OccasionGiftsScreen> {
  // Add state variable for filter overlay
  bool _showFilterOverlay = false;
  
  // Add state variables for API data
  final OccasionService _occasionService = OccasionService();
  List<OccasionCategory> _occasionCategories = [];
  List<OccasionProduct> _products = [];
  bool _isLoadingCategories = true;
  bool _isLoadingProducts = true;
  String? _categoriesErrorMessage;
  String? _productsErrorMessage;
  int _selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchOccasionCategories();
  }

  // Fetch occasion categories from API
  Future<void> _fetchOccasionCategories() async {
    setState(() {
      _isLoadingCategories = true;
      _categoriesErrorMessage = null;
    });

    try {
      final response = await _occasionService.fetchOccasionCategories();
      
      if (response.success && response.data.isNotEmpty) {
        setState(() {
          _occasionCategories = response.data;
          _isLoadingCategories = false;
        });
        
        // Fetch products for the first category
        _fetchOccasionProducts(_occasionCategories.first.slug);
      } else {
        setState(() {
          _categoriesErrorMessage = response.message;
          _isLoadingCategories = false;
        });
      }
    } catch (e) {
      setState(() {
        _categoriesErrorMessage = 'Failed to load occasion categories: $e';
        _isLoadingCategories = false;
      });
      developer.log('Error fetching occasion categories: $e');
    }
  }

  // Fetch products for a specific occasion category
  Future<void> _fetchOccasionProducts(String slug) async {
    setState(() {
      _isLoadingProducts = true;
      _productsErrorMessage = null;
    });

    try {
      final response = await _occasionService.fetchOccasionProducts(slug);
      
      if (response.success) {
        setState(() {
          _products = response.products;
          _isLoadingProducts = false;
        });
      } else {
        setState(() {
          _productsErrorMessage = response.message;
          _isLoadingProducts = false;
        });
      }
    } catch (e) {
      setState(() {
        _productsErrorMessage = 'Failed to load occasion products: $e';
        _isLoadingProducts = false;
      });
      developer.log('Error fetching occasion products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // Header with green background
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, 0.50),
                      end: Alignment(1.00, 0.50),
                      colors: [Color(0xFF54A801), Color(0xFF214200)],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back button
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      
                      // Title
                      const Text(
                        'Occasion Gifts',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      
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
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                    color: Color(0xFF54A801),
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
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
                
                // Search bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      // Search input field
                      Expanded(
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(25),
                              right: Radius.circular(0),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search "Occasion Gifts"',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                    ),
                                    border: InputBorder.none,
                                    suffixIcon: Icon(Icons.mic, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      // Search button
                      Container(
                        height: 50,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: Color(0xFF54A801),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(0),
                            right: Radius.circular(25),
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Content
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Occasion categories
                        _isLoadingCategories
                            ? _buildLoadingCategoriesState()
                            : _categoriesErrorMessage != null
                                ? _buildErrorCategoriesState()
                                : _buildOccasionCategoriesList(),
                        
                        // Products grid
                        OccasionProductGrid(
                          onFilterPressed: () {
                            setState(() {
                              _showFilterOverlay = true;
                            });
                          },
                          products: _products,
                          isLoading: _isLoadingProducts,
                          errorMessage: _productsErrorMessage,
                          onRetry: () {
                            if (_occasionCategories.isNotEmpty) {
                              _fetchOccasionProducts(_occasionCategories[_selectedCategoryIndex].slug);
                            } else {
                              _fetchOccasionCategories();
                            }
                          },
                        ),
                        
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Filter overlay
          FilterWidget(
            showOverlay: _showFilterOverlay,
            onClose: () {
              setState(() {
                _showFilterOverlay = false;
              });
            },
            onApplyFilters: (filterValues) {
              // Apply filters to the products
              // This is where you would filter your product list based on selected filters
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Filters applied')),
              );
            },
            onClearFilters: () {
              // Clear all filters
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Filters cleared')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingCategoriesState() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 15),
            child: Text(
              'Occasion Categories',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            height: 160,
            child: Center(
              child: CircularProgressIndicator(
                color: Color(0xFF54A801),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorCategoriesState() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 15),
            child: Text(
              'Occasion Categories',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            height: 160,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Failed to load categories',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _fetchOccasionCategories,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF54A801),
                    ),
                    child: Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOccasionCategoriesList() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 15),
            child: Text(
              'Occasion Categories',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            height: 160,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    for (int index = 0; index < _occasionCategories.length; index++)
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: _buildOccasionCategoryCard(
                          _occasionCategories[index],
                          index == _selectedCategoryIndex,
                          () {
                            setState(() {
                              _selectedCategoryIndex = index;
                            });
                            _fetchOccasionProducts(_occasionCategories[index].slug);
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOccasionCategoryCard(OccasionCategory category, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 101,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Category image with error handling
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                border: isSelected ? Border.all(color: Color(0xFF54A801), width: 3) : null,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: Image.network(
                  category.bannerImage,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.grey[600],
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Category title
            SizedBox(
              width: 101,
              child: Text(
                category.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected ? Color(0xFF54A801) : Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  height: 1.2,
                ),
                maxLines: 2,
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
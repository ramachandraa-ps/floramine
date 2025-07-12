import 'package:flutter/material.dart';
import '../widgets/special_day_gifts/gift_products_section_title.dart';
import '../widgets/special_day_gifts/gift_product_grid.dart';
import '../widgets/filter_widget.dart';
import '../models/gift_category_model.dart';
import '../services/gift_service.dart';
import 'dart:developer' as developer;

class SpecialDayGiftsScreen extends StatefulWidget {
  const SpecialDayGiftsScreen({Key? key}) : super(key: key);

  @override
  _SpecialDayGiftsScreenState createState() => _SpecialDayGiftsScreenState();
}

class _SpecialDayGiftsScreenState extends State<SpecialDayGiftsScreen> {
  // Add state variables
  bool _isLoadingCategories = true;
  bool _isLoadingProducts = true;
  String? _errorCategoriesMessage;
  String? _errorProductsMessage;
  List<GiftCategory> _giftCategories = [];
  List<GiftProduct> _giftProducts = [];
  GiftCategory? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _fetchGiftCategories();
  }

  Future<void> _fetchGiftCategories() async {
    try {
      setState(() {
        _isLoadingCategories = true;
        _errorCategoriesMessage = null;
      });

      final response = await GiftService.fetchGiftCategories();
      
      setState(() {
        _giftCategories = response.data;
        _isLoadingCategories = false;
      });
      
      // Log the fetched data for debugging
      developer.log('Fetched ${_giftCategories.length} gift categories');
      for (var category in _giftCategories) {
        developer.log('Category: ${category.name}, Image: ${category.image}');
      }
      
      // If categories were fetched successfully, load products for the first category
      if (_giftCategories.isNotEmpty) {
        _selectCategory(_giftCategories.first);
      }
    } catch (e) {
      developer.log('Error fetching gift categories: $e');
      setState(() {
        _errorCategoriesMessage = e.toString();
        _isLoadingCategories = false;
      });
    }
  }
  
  Future<void> _fetchProductsForCategory(GiftCategory category) async {
    try {
      setState(() {
        _isLoadingProducts = true;
        _errorProductsMessage = null;
      });
      
      developer.log('Fetching products for category: ${category.name} with slug: ${category.slug}');
      final response = await GiftService.fetchGiftCategoryProducts(category.slug);
      
      setState(() {
        _giftProducts = response.products;
        _isLoadingProducts = false;
      });
      
      developer.log('Fetched ${_giftProducts.length} products for category: ${category.name}');
    } catch (e) {
      developer.log('Error fetching products for category ${category.name}: $e');
      setState(() {
        _errorProductsMessage = e.toString();
        _isLoadingProducts = false;
        _giftProducts = [];
      });
    }
  }
  
  void _selectCategory(GiftCategory category) {
    setState(() {
      _selectedCategory = category;
    });
    _fetchProductsForCategory(category);
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
                  color: const Color(0xFF54A801),
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
                        'Special Day Gifts',
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
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(25),
                              right: Radius.circular(0),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search "Indoor Plants"',
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
                        decoration: BoxDecoration(
                          color: const Color(0xFF54A801),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gift categories
                        HorizontalGiftCategoriesList(
                          isLoading: _isLoadingCategories,
                          errorMessage: _errorCategoriesMessage,
                          giftCategories: _giftCategories,
                          onRetry: _fetchGiftCategories,
                          selectedCategory: _selectedCategory,
                          onCategorySelected: _selectCategory,
                        ),
                        
                        // Products section title
                        GiftProductsSectionTitle(
                          title: _selectedCategory != null 
                              ? '${_selectedCategory!.name} Gift Plants' 
                              : 'Special Day Gift Plants',
                          description: 'Perfect plants to celebrate special moments and occasions with your loved ones.',
                        ),
                        
                        // Product grid
                        GiftProductGrid(
                          onFilterPressed: () {},  // This is now handled internally in the GiftProductGrid
                          products: _giftProducts,
                          isLoading: _isLoadingProducts,
                          errorMessage: _errorProductsMessage,
                          onRetry: () {
                            if (_selectedCategory != null) {
                              _fetchProductsForCategory(_selectedCategory!);
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
        ],
      ),
    );
  }
}

// Custom HorizontalProductCard with error handling
class CustomHorizontalProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback? onTap;
  final bool isRounded;
  final bool isAsset;
  final bool isSelected;

  const CustomHorizontalProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.onTap,
    this.isRounded = false,
    this.isAsset = true,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 101,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Product image with error handling
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: isRounded
                    ? BorderRadius.circular(500)
                    : BorderRadius.circular(8),
                border: isSelected
                    ? Border.all(color: Color(0xFF54A801), width: 3)
                    : null,
              ),
              child: ClipRRect(
                borderRadius: isRounded
                    ? BorderRadius.circular(500)
                    : BorderRadius.circular(8),
                child: isAsset
                    ? Image.asset(
                        imageUrl,
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
                      )
                    : Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          developer.log('Error loading image: $imageUrl, error: $error');
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

            // Product title
            SizedBox(
              width: 101,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected ? Color(0xFF54A801) : Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
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

class HorizontalGiftCategoriesList extends StatelessWidget {
  final bool isLoading;
  final String? errorMessage;
  final List<GiftCategory> giftCategories;
  final VoidCallback onRetry;
  final GiftCategory? selectedCategory;
  final Function(GiftCategory) onCategorySelected;

  const HorizontalGiftCategoriesList({
    Key? key,
    required this.isLoading,
    required this.errorMessage,
    required this.giftCategories,
    required this.onRetry,
    this.selectedCategory,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 15),
            child: Text(
              'Gift Categories',
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
            child: isLoading
                ? _buildLoadingState()
                : errorMessage != null
                    ? _buildErrorState(errorMessage!, onRetry)
                    : _buildCategoriesList(giftCategories),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(
        color: Color(0xFF54A801),
      ),
    );
  }

  Widget _buildErrorState(String errorMessage, VoidCallback onRetry) {
    return Center(
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
          Text(
            errorMessage,
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF54A801),
            ),
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesList(List<GiftCategory> categories) {
    if (categories.isEmpty) {
      return Center(
        child: Text(
          'No gift categories available',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            for (var category in categories)
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: CustomHorizontalProductCard(
                  imageUrl: category.image,
                  title: category.name,
                  isRounded: true,
                  isAsset: false,
                  isSelected: selectedCategory?.id == category.id,
                  onTap: () {
                    // Handle tap for each gift category
                    developer.log('Tapped on ${category.name} with ID: ${category.id}');
                    onCategorySelected(category);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Fallback categories in case the API fails
  Widget _buildFallbackCategories() {
    final List<Map<String, dynamic>> fallbackCategories = [
      {
        'title': 'Birthdays',
        'imageUrl': 'assets/images/special_day_gifts/birthdays.png',
        'isRounded': true,
      },
      {
        'title': 'Anniversaries',
        'imageUrl': 'assets/images/special_day_gifts/anniversaries.png',
        'isRounded': true,
      },
      {
        'title': 'Graduations',
        'imageUrl': 'assets/images/special_day_gifts/graduations.png',
        'isRounded': true,
      },
      {
        'title': 'Romantic Surprises',
        'imageUrl': 'assets/images/special_day_gifts/romantic_surprises.png',
        'isRounded': true,
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            for (var category in fallbackCategories)
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: CustomHorizontalProductCard(
                  imageUrl: category['imageUrl'],
                  title: category['title'],
                  isRounded: category['isRounded'],
                  isAsset: true,
                  onTap: () {
                    // Handle tap for each gift category
                    developer.log('Tapped on ${category['title']}');
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

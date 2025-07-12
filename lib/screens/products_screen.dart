import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../providers/product_provider.dart';
import '../widgets/filter_widget.dart';
import '../widgets/product_card.dart';
import '../screens/product_details_screen.dart'; // Added import for ProductDetailsScreen

class ProductsScreen extends StatefulWidget {
  final String? category;
  final String? subCategory;
  final String? initialSearchQuery;

  const ProductsScreen({
    Key? key,
    this.category,
    this.subCategory,
    this.initialSearchQuery,
  }) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool _showFilterOverlay = false;
  String _searchQuery = '';
  String _selectedSortOption = '';
  final ScrollController _scrollController = ScrollController();
  
  @override
  void initState() {
    super.initState();
    
    _searchQuery = widget.initialSearchQuery ?? '';
    
    // Initialize with products based on the passed category or subcategory
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final productProvider = Provider.of<ProductProvider>(context, listen: false);
      
      if (widget.category != null) {
        productProvider.setCategory(widget.category!);
      } else if (widget.subCategory != null) {
        productProvider.setSubCategory(widget.subCategory!);
      } else if (widget.initialSearchQuery != null && widget.initialSearchQuery!.isNotEmpty) {
        productProvider.setSearchQuery(widget.initialSearchQuery!);
      } else {
        productProvider.fetchProducts(page: 1);
      }
      
      // Add scroll listener for pagination
      _scrollController.addListener(_scrollListener);
    });
  }
  
  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
  
  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // User reached the bottom of the list, load more products
      Provider.of<ProductProvider>(context, listen: false).loadMoreProducts();
    }
  }
  
  void _performSearch(String query) {
    setState(() {
      _searchQuery = query;
    });
    
    if (query.isNotEmpty) {
      Provider.of<ProductProvider>(context, listen: false).setSearchQuery(query);
    }
  }
  
  void _applySortOption(String sortOption) {
    setState(() {
      _selectedSortOption = sortOption;
    });
    
    Provider.of<ProductProvider>(context, listen: false).setSortOption(sortOption);
  }
  
  void _applyFilters(Map<String, dynamic> filterValues) {
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    
    // Apply price filter
    if (filterValues['price'] != null) {
      if (filterValues['price']['below_500'] == true) {
        productProvider.setPriceRange('0', '500');
      } else if (filterValues['price']['between_500_1000'] == true) {
        productProvider.setPriceRange('500', '1000');
      } else if (filterValues['price']['above_1000'] == true) {
        productProvider.setPriceRange('1000', '100000');
      }
    }
    
    // Fetch products with applied filters
    productProvider.fetchProducts(page: 1);
  }
  
  // Helper method to build the product grid
  Widget _buildProductGrid(List<Product> products) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.52, // Adjusted for taller product cards with more prominent buttons
        crossAxisSpacing: 16,
        mainAxisSpacing: 20, // Increased spacing between rows
      ),
      itemCount: products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          product: product,
          isFavorite: false, // Replace with actual favorite status
          onTap: () {
            // Navigate to product details with product ID
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(
                  productName: product.name,
                  productId: product.id,
                ),
              ),
            );
          },
          onFavoritePressed: () {
            // Handle favorite button press
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${product.name} added to favorites'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
          onAddToCartPressed: () {
            // Handle add to cart button press
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${product.name} added to cart'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
          onBuyNowPressed: () {
            // Handle buy now button press
            Navigator.pushNamed(context, '/checkout');
          },
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // 1. Header Section with gradient background
              Container(
                width: double.infinity,
                height: 110,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, 0.50),
                    end: Alignment(1.00, 0.50),
                    colors: [Color(0xFF54A801), Color(0xFF214200)],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back button and title
                        Row(
                          children: [
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
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Color(0xFF54A801),
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              widget.category ?? widget.subCategory ?? 'Products',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Cabin',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        
                        // Cart icon with badge
                        Stack(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                                size: 24,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/cart');
                              },
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                width: 18,
                                height: 18,
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF54A801),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.white, width: 1.5),
                                ),
                                child: const Center(
                                  child: Text(
                                    '0',
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
              
              // 2. Search Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(text: _searchQuery),
                          onSubmitted: _performSearch,
                          decoration: InputDecoration(
                            hintText: 'Search Products',
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 14,
                              fontFamily: 'Cabin',
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFF54A801),
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(30),
                          ),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          onPressed: () => _performSearch(_searchQuery),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // 3. Filter and Sort buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Filter button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showFilterOverlay = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Colors.black.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Filter',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(Icons.filter_list, size: 18),
                          ],
                        ),
                      ),
                    ),
                    
                    // Sort By dropdown
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.black.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: DropdownButton<String>(
                        value: _selectedSortOption.isEmpty ? null : _selectedSortOption,
                        hint: Text(
                          'Sort By',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        icon: Icon(Icons.keyboard_arrow_down, size: 18),
                        underline: SizedBox(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            _applySortOption(newValue);
                          }
                        },
                        items: <String>[
                          'date_asc',
                          'date_desc',
                          'price_asc',
                          'price_desc',
                        ].map<DropdownMenuItem<String>>((String value) {
                          String displayText;
                          switch (value) {
                            case 'date_asc':
                              displayText = 'Oldest First';
                              break;
                            case 'date_desc':
                              displayText = 'Newest First';
                              break;
                            case 'price_asc':
                              displayText = 'Price: Low to High';
                              break;
                            case 'price_desc':
                              displayText = 'Price: High to Low';
                              break;
                            default:
                              displayText = value;
                          }
                          
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              displayText,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              
              // 4. Products Grid
              Expanded(
                child: Consumer<ProductProvider>(
                  builder: (context, productProvider, child) {
                    final products = productProvider.products;
                    final isLoading = productProvider.isLoading;
                    final isLoadingMore = productProvider.isLoadingMore;
                    final error = productProvider.error;
                    
                    if (isLoading && products.isEmpty) {
                      // Show loading indicator while fetching initial products
                      return const Center(
                        child: CircularProgressIndicator(color: Color(0xFF54A801)),
                      );
                    }
                    
                    if (error != null && products.isEmpty) {
                      // Show error message if there was an error and no products
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.error_outline, color: Colors.red, size: 48),
                            const SizedBox(height: 16),
                            const Text(
                              'Error loading products',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(error),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                // Retry loading products
                                productProvider.fetchProducts(page: 1);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF54A801),
                              ),
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      );
                    }
                    
                    if (products.isEmpty) {
                      // Show message when no products found
                      return const Center(
                        child: Text(
                          'No products found',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Cabin',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }
                    
                    // Show products grid with pagination
                    return RefreshIndicator(
                      onRefresh: () => productProvider.fetchProducts(page: 1),
                      color: const Color(0xFF54A801),
                      child: ListView(
                        controller: _scrollController,
                        children: [
                          // Products grid
                          _buildProductGrid(products),
                          
                          // Loading indicator for pagination
                          if (isLoadingMore)
                            const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Center(
                                child: CircularProgressIndicator(color: Color(0xFF54A801)),
                              ),
                            ),
                            
                          // Space at the bottom
                          const SizedBox(height: 20),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          
          // Filter overlay
          if (_showFilterOverlay)
            FilterWidget(
              onClose: () {
                setState(() {
                  _showFilterOverlay = false;
                });
              },
              onApply: _applyFilters,
            ),
        ],
      ),
    );
  }
} 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../providers/product_provider.dart';
import '../widgets/product_card.dart';
import '../screens/product_details_screen.dart';

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
      body: Column(
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
          
          // 3. Everything below search bar is now in a single scrollable area
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
                
                // Show products with filter/sort buttons in a single scrollable view
                return RefreshIndicator(
                  onRefresh: () => productProvider.fetchProducts(page: 1),
                  color: const Color(0xFF54A801),
                  child: ListView(
                    controller: _scrollController,
                    children: [
                      // Filter and Sort buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Filter button
                            GestureDetector(
                              onTap: () {
                                _showFilterOptions(context);
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
                            GestureDetector(
                              onTap: () {
                                _showSortOptions(context);
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
                                      _selectedSortOption.isEmpty ? 'Sort By' : _getSortDisplayText(_selectedSortOption),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Icon(Icons.keyboard_arrow_down, size: 18),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Products grid - now we can remove the NeverScrollableScrollPhysics
                      GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.52,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: products.length,
                        shrinkWrap: true,
                        // Remove NeverScrollableScrollPhysics since the parent ListView handles scrolling
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return ProductCard(
                            product: product,
                            isFavorite: false,
                            onTap: () {
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${product.name} added to favorites'),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                            onAddToCartPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${product.name} added to cart'),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                            onBuyNowPressed: () {
                              Navigator.pushNamed(context, '/checkout');
                            },
                          );
                        },
                      ),
                      
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
    );
  }

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  'Sort By',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              ListTile(
                title: const Text('Newest First'),
                onTap: () {
                  _applySortOption('date_desc');
                  Navigator.pop(context);
                },
                trailing: _selectedSortOption == 'date_desc' ? Icon(Icons.check, color: Color(0xFF54A801)) : null,
              ),
              ListTile(
                title: const Text('Oldest First'),
                onTap: () {
                  _applySortOption('date_asc');
                  Navigator.pop(context);
                },
                trailing: _selectedSortOption == 'date_asc' ? Icon(Icons.check, color: Color(0xFF54A801)) : null,
              ),
              ListTile(
                title: const Text('Price: Low to High'),
                onTap: () {
                  _applySortOption('price_asc');
                  Navigator.pop(context);
                },
                trailing: _selectedSortOption == 'price_asc' ? Icon(Icons.check, color: Color(0xFF54A801)) : null,
              ),
              ListTile(
                title: const Text('Price: High to Low'),
                onTap: () {
                  _applySortOption('price_desc');
                  Navigator.pop(context);
                },
                trailing: _selectedSortOption == 'price_desc' ? Icon(Icons.check, color: Color(0xFF54A801)) : null,
              ),
            ],
          ),
        );
      },
    );
  }
  
  String _getSortDisplayText(String sortOption) {
    switch (sortOption) {
      case 'date_asc':
        return 'Oldest First';
      case 'date_desc':
        return 'Newest First';
      case 'price_asc':
        return 'Price: Low to High';
      case 'price_desc':
        return 'Price: High to Low';
      default:
        return 'Sort By';
    }
  }

  // Update to match the inspiration image with more compact layout and less white space
  void _showFilterOptions(BuildContext context) {
    // Filter states
    bool belowFiveHundred = false;
    bool betweenFiveHundredAndThousand = false;
    bool aboveThousand = false;
    bool smallSize = false;
    bool mediumSize = false;
    bool largeSize = false;
    bool redColor = false;
    bool blueColor = false;
    bool greenColor = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              // Reduced height to match inspiration image
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with title and close button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Filters',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close, size: 22),
                      ),
                    ],
                  ),
                  
                  const Divider(),
                  
                  // Scrollable content with reduced spacing
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Price section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Price',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down, size: 20),
                            ],
                          ),
                          // Compact checkboxes with less padding
                          CheckboxListTile(
                            title: const Text(
                              'Below ₹ 500',
                              style: TextStyle(fontSize: 14),
                            ),
                            value: belowFiveHundred,
                            onChanged: (value) {
                              setState(() {
                                belowFiveHundred = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: const Color(0xFF54A801),
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                          ),
                          CheckboxListTile(
                            title: const Text(
                              '₹ 500 - ₹ 1000',
                              style: TextStyle(fontSize: 14),
                            ),
                            value: betweenFiveHundredAndThousand,
                            onChanged: (value) {
                              setState(() {
                                betweenFiveHundredAndThousand = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: const Color(0xFF54A801),
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                          ),
                          CheckboxListTile(
                            title: const Text(
                              '₹ 1000 Above',
                              style: TextStyle(fontSize: 14),
                            ),
                            value: aboveThousand,
                            onChanged: (value) {
                              setState(() {
                                aboveThousand = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: const Color(0xFF54A801),
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                          ),
                          
                          const Divider(),
                          
                          // Size section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Size',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down, size: 20),
                            ],
                          ),
                          CheckboxListTile(
                            title: const Text(
                              'Small',
                              style: TextStyle(fontSize: 14),
                            ),
                            value: smallSize,
                            onChanged: (value) {
                              setState(() {
                                smallSize = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: const Color(0xFF54A801),
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                          ),
                          CheckboxListTile(
                            title: const Text(
                              'Medium',
                              style: TextStyle(fontSize: 14),
                            ),
                            value: mediumSize,
                            onChanged: (value) {
                              setState(() {
                                mediumSize = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: const Color(0xFF54A801),
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                          ),
                          CheckboxListTile(
                            title: const Text(
                              'Large',
                              style: TextStyle(fontSize: 14),
                            ),
                            value: largeSize,
                            onChanged: (value) {
                              setState(() {
                                largeSize = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: const Color(0xFF54A801),
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                          ),
                          
                          const Divider(),
                          
                          // Color section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Colour',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down, size: 20),
                            ],
                          ),
                          CheckboxListTile(
                            title: const Text(
                              'Red',
                              style: TextStyle(fontSize: 14),
                            ),
                            value: redColor,
                            onChanged: (value) {
                              setState(() {
                                redColor = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: const Color(0xFF54A801),
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                          ),
                          CheckboxListTile(
                            title: const Text(
                              'Blue',
                              style: TextStyle(fontSize: 14),
                            ),
                            value: blueColor,
                            onChanged: (value) {
                              setState(() {
                                blueColor = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: const Color(0xFF54A801),
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                          ),
                          CheckboxListTile(
                            title: const Text(
                              'Green',
                              style: TextStyle(fontSize: 14),
                            ),
                            value: greenColor,
                            onChanged: (value) {
                              setState(() {
                                greenColor = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: const Color(0xFF54A801),
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Bottom buttons with less vertical padding
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFF54A801)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                            child: const Text(
                              'Clear',
                              style: TextStyle(
                                color: Color(0xFF54A801),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Apply filters
                              final filterValues = {
                                'price': {
                                  'below_500': belowFiveHundred,
                                  'between_500_1000': betweenFiveHundredAndThousand,
                                  'above_1000': aboveThousand,
                                },
                                'size': {
                                  'small': smallSize,
                                  'medium': mediumSize,
                                  'large': largeSize,
                                },
                                'color': {
                                  'red': redColor,
                                  'blue': blueColor,
                                  'green': greenColor,
                                },
                              };
                              
                              _applyFilters(filterValues);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF54A801),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                            child: const Text(
                              'Apply',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
} 
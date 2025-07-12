import 'package:flutter/material.dart';
import '../../models/gift_category_model.dart';
import 'dart:developer' as developer;
import '../plant_product_card.dart';
import '../../screens/product_details_screen.dart';

class GiftProductGrid extends StatefulWidget {
  final VoidCallback onFilterPressed;
  final List<GiftProduct> products;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onRetry;

  const GiftProductGrid({
    Key? key,
    required this.onFilterPressed,
    required this.products,
    required this.isLoading,
    this.errorMessage,
    required this.onRetry,
  }) : super(key: key);

  @override
  State<GiftProductGrid> createState() => _GiftProductGridState();
}

class _GiftProductGridState extends State<GiftProductGrid> {
  String _selectedSortOption = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Filter and sort section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
        
        // Product grid
        widget.isLoading
            ? _buildLoadingState()
            : widget.errorMessage != null
                ? _buildErrorState(widget.errorMessage!, widget.onRetry)
                : _buildProductGrid(widget.products, context),
      ],
    );
  }

  Widget _buildLoadingState() {
    return Container(
      height: 300,
      child: Center(
        child: CircularProgressIndicator(
          color: Color(0xFF54A801),
        ),
      ),
    );
  }

  Widget _buildErrorState(String errorMessage, VoidCallback onRetry) {
    return Container(
      height: 300,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Failed to load products',
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
      ),
    );
  }

  Widget _buildProductGrid(List<GiftProduct> products, BuildContext context) {
    if (products.isEmpty) {
      return Container(
        height: 200,
        child: Center(
          child: Text(
            'No products available',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.45, // Further decreased from 0.58 to give more vertical space
          crossAxisSpacing: 15,
          mainAxisSpacing: 20, // Increased spacing between rows
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          
          // Extract price values
          double currentPrice = 0.0;
          double originalPrice = 0.0;
          double discountPercentage = 0.0;
          
          try {
            if (product.variations.isNotEmpty) {
              // Get price from first variation
              String currentPriceStr = product.variations.first.defaultSellPrice.replaceAll('₹', '').trim();
              String originalPriceStr = product.variations.first.defaultPrice.replaceAll('₹', '').trim();
              String discountStr = product.variations.first.discount.replaceAll('%', '').trim();
              
              currentPrice = double.tryParse(currentPriceStr) ?? 0.0;
              originalPrice = double.tryParse(originalPriceStr) ?? 0.0;
              discountPercentage = double.tryParse(discountStr) ?? 0.0;
            }
          } catch (e) {
            developer.log('Error parsing product prices: $e');
          }
          
          // Extract USPs
          List<String> usps = [];
          if (product.usps.isNotEmpty) {
            usps = product.usps.map((usp) => '${usp.emoji} ${usp.description}').toList();
          }
          
          return Container(
            margin: EdgeInsets.only(bottom: 10), // Add extra bottom margin
            child: PlantProductCard(
              name: product.name,
              imageUrl: product.displayImage,
              currentPrice: currentPrice,
              originalPrice: originalPrice,
              discountPercentage: discountPercentage,
              usps: usps,
              onTap: () {
                // Navigate to product details screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      productName: product.name,
                      productId: product.id,
                    ),
                  ),
                );
                developer.log('Navigating to product details for: ${product.name} with ID: ${product.id}');
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
              onFavoritePressed: () {
                // Handle favorite button press
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.name} added to favorites'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              onBuyNowPressed: () {
                // Handle buy now button press
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
            ),
          );
        },
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

  void _applySortOption(String sortOption) {
    setState(() {
      _selectedSortOption = sortOption;
    });
    
    // Here you would implement the actual sorting logic
    // For now, just show a snackbar to indicate the action
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sorting by ${_getSortDisplayText(sortOption)}'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _showFilterOptions(BuildContext context) {
    // Filter states
    bool belowFiveHundred = false;
    bool betweenFiveHundredAndThousand = false;
    bool aboveThousand = false;
    bool smallSize = false;
    bool mediumSize = false;
    bool largeSize = false;

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
                        ],
                      ),
                    ),
                  ),
                  
                  const Divider(),
                  
                  // Action buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Clear button
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              belowFiveHundred = false;
                              betweenFiveHundredAndThousand = false;
                              aboveThousand = false;
                              smallSize = false;
                              mediumSize = false;
                              largeSize = false;
                            });
                          },
                          child: const Text(
                            'Clear All',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                      // Apply button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Apply filters and close modal
                            Navigator.pop(context);
                            
                            // Show a snackbar to indicate filters applied
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Filters applied'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF54A801),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            'Apply',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ],
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
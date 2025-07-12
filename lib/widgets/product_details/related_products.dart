import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/plant_product_card.dart';
import '../../providers/product_provider.dart';
import '../../models/product_model.dart';

class RelatedProducts extends StatefulWidget {
  final String? category;
  final List<Product>? apiRelatedProducts; // Add parameter for API related products
  
  const RelatedProducts({
    Key? key, 
    this.category,
    this.apiRelatedProducts,
  }) : super(key: key);

  @override
  State<RelatedProducts> createState() => _RelatedProductsState();
}

class _RelatedProductsState extends State<RelatedProducts> with AutomaticKeepAliveClientMixin {
  bool _isLoading = false;
  List<Product> _relatedProducts = [];
  bool _isActive = true;
  String? _currentCategory;
  String? _currentSubCategory;
  String? _currentType;
  
  @override
  bool get wantKeepAlive => true; // Keep the state alive when scrolling
  
  @override
  void initState() {
    super.initState();
    
    // If API related products are provided, use them
    if (widget.apiRelatedProducts != null && widget.apiRelatedProducts!.isNotEmpty) {
      _relatedProducts = widget.apiRelatedProducts!;
    }
    // Otherwise, fetch products by category if available
    else if (widget.category != null && widget.category!.isNotEmpty) {
      // Use post-frame callback to ensure context is available
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _isActive) {
          _loadRelatedProducts();
        }
      });
    }
  }
  
  @override
  void didUpdateWidget(RelatedProducts oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // If API related products changed, update the list
    if (widget.apiRelatedProducts != oldWidget.apiRelatedProducts &&
        widget.apiRelatedProducts != null && widget.apiRelatedProducts!.isNotEmpty) {
      setState(() {
        _relatedProducts = widget.apiRelatedProducts!;
      });
    }
    // If category changed and no API related products, reload products
    else if (widget.category != oldWidget.category && 
             widget.category != null && 
             widget.category!.isNotEmpty &&
             (widget.apiRelatedProducts == null || widget.apiRelatedProducts!.isEmpty)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _isActive) {
          _loadRelatedProducts();
        }
      });
    }
  }
  
  @override
  void dispose() {
    _isActive = false;
    super.dispose();
  }
  
  Future<void> _loadRelatedProducts() async {
    // Guard against multiple simultaneous calls or calls after dispose
    if (!mounted || !_isActive || _isLoading) return;
    
    try {
      setState(() {
        _isLoading = true;
      });
      
      final productProvider = Provider.of<ProductProvider>(context, listen: false);
      
      // Store current filter state
      _currentCategory = productProvider.currentCategory;
      _currentSubCategory = productProvider.currentSubCategory;
      _currentType = productProvider.currentType;
      
      // Set new category filter
      await productProvider.setCategory(widget.category!);
      
      // Check if widget is still active before updating state
      if (!mounted || !_isActive) return;
      
      // Update related products
      setState(() {
        _relatedProducts = List.from(productProvider.products);
        _isLoading = false;
      });
      
      // Restore previous filter state
      if (!mounted || !_isActive) return;
      
      // Restore original filters without triggering setState
      if (_currentCategory != null) {
        await productProvider.setCategory(_currentCategory!);
      } else if (_currentSubCategory != null) {
        await productProvider.setSubCategory(_currentSubCategory!);
      } else if (_currentType != null) {
        await productProvider.setType(_currentType!);
      }
    } catch (e) {
      if (_isActive && mounted) {
        print('Error fetching related products: $e');
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    
    // If no related products are available, don't render the widget
    if (_relatedProducts.isEmpty && !_isLoading) {
      return const SizedBox.shrink();
    }
    
    return Column(
      children: [
        // Section title
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: const Text(
            'Related Products',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        
        // Horizontal scrollable products
        _isLoading
          ? const SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(color: Color(0xFF54A801)),
              ),
            )
          : _relatedProducts.isEmpty
            ? const SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    'No related products found',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            : SizedBox(
                height: 350, // Height for the product card
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _relatedProducts.length > 6 ? 6 : _relatedProducts.length, // Limit to 6 products
                  itemBuilder: (context, index) {
                    final product = _relatedProducts[index];
                    
                    // Extract price information
                    double currentPrice = 0;
                    double originalPrice = 0;
                    double discountPercentage = 0;
                    
                    if (product.variations.isNotEmpty) {
                      final variation = product.variations.first;
                      
                      // Parse prices
                      try {
                        String currentPriceStr = variation.defaultSellPrice.replaceAll('₹', '').trim();
                        String originalPriceStr = variation.defaultPrice.replaceAll('₹', '').trim();
                        
                        currentPrice = double.tryParse(currentPriceStr) ?? 0;
                        originalPrice = double.tryParse(originalPriceStr) ?? 0;
                        
                        if (originalPrice > 0 && currentPrice > 0 && originalPrice > currentPrice) {
                          discountPercentage = ((originalPrice - currentPrice) / originalPrice) * 100;
                        }
                      } catch (e) {
                        // Handle parsing errors silently
                      }
                    }
                    
                    // Check for tags
                    bool isAirPurifying = product.tags.toLowerCase().contains('air purifying');
                    bool isPerfectGift = product.tags.toLowerCase().contains('perfect gift');
                    
                    // Get image URL
                    String imageUrl = product.images.isNotEmpty
                        ? product.images.first
                        : 'assets/images/jasminum_sambac.png';
                    
                    return Container(
                      width: 180,
                      margin: const EdgeInsets.only(right: 16),
                      child: PlantProductCard(
                        imageUrl: imageUrl,
                        name: product.name,
                        currentPrice: currentPrice,
                        originalPrice: originalPrice,
                        discountPercentage: discountPercentage,
                        isAirPurifying: isAirPurifying,
                        isPerfectGift: isPerfectGift,
                        usps: product.usps, // Pass USPs from API
                        onTap: () {
                          if (mounted) {
                            // Navigate to product details
                            Navigator.pushNamed(
                              context,
                              '/product-details',
                              arguments: {
                                'productId': product.id,
                                'productName': product.name,
                              },
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
        
      ],
    );
  }
}
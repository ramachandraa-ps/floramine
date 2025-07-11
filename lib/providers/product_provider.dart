import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _productService = ProductService();
  
  // Products data
  List<Product> _products = [];
  List<Product> get products => _products;
  
  // Pagination state
  PaginationLinks? _paginationLinks;
  PaginationMeta? _paginationMeta;
  
  PaginationLinks? get paginationLinks => _paginationLinks;
  PaginationMeta? get paginationMeta => _paginationMeta;
  
  // Loading states
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  String? _error;
  String? get error => _error;
  
  // Filter and sort states
  String? _currentCategory;
  String? _currentSubCategory;
  String? _currentSortOption;
  String? _currentSearchQuery;
  String? _currentPriceRange;
  String? _currentType; // featured or new-arrivals
  
  // Getters for current filter and sort states
  String? get currentCategory => _currentCategory;
  String? get currentSubCategory => _currentSubCategory;
  String? get currentSortOption => _currentSortOption;
  String? get currentSearchQuery => _currentSearchQuery;
  String? get currentPriceRange => _currentPriceRange;
  String? get currentType => _currentType;
  
  // Reset all states
  void resetFilters() {
    _currentCategory = null;
    _currentSubCategory = null;
    _currentSortOption = null;
    _currentSearchQuery = null;
    _currentPriceRange = null;
    _currentType = null;
    notifyListeners();
  }
  
  // Fetch products with current filters and sort options
  Future<void> fetchProducts({int? page}) async {
    _setLoading(true);
    _error = null;
    
    try {
      final ProductResponse response = await _productService.getProducts(
        category: _currentCategory,
        subCategory: _currentSubCategory,
        page: page,
        sort: _currentSortOption,
        type: _currentType,
        search: _currentSearchQuery,
        priceRange: _currentPriceRange,
      );
      
      _updateProductsData(response);
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }
  
  // Load more products (next page)
  Future<void> loadMoreProducts() async {
    if (_paginationLinks?.next == null || _isLoading) {
      return;
    }
    
    _setLoading(true);
    
    try {
      final ProductResponse response = await _productService.getNextPage(_paginationLinks!);
      
      // Append products to existing list
      _products.addAll(response.data);
      _paginationLinks = response.links;
      _paginationMeta = response.meta;
      
      notifyListeners();
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }
  
  // Set category and fetch products
  Future<void> setCategory(String category) async {
    _currentCategory = category;
    _currentSubCategory = null; // Reset sub-category when category changes
    await fetchProducts(page: 1); // Reset to first page
  }
  
  // Set sub-category and fetch products
  Future<void> setSubCategory(String subCategory) async {
    _currentSubCategory = subCategory;
    await fetchProducts(page: 1); // Reset to first page
  }
  
  // Set sort option and fetch products
  Future<void> setSortOption(String sortOption) async {
    _currentSortOption = sortOption;
    await fetchProducts(page: 1); // Reset to first page
  }
  
  // Set search query and fetch products
  Future<void> setSearchQuery(String query) async {
    _currentSearchQuery = query;
    await fetchProducts(page: 1); // Reset to first page
  }
  
  // Set price range and fetch products
  Future<void> setPriceRange(String minPrice, String maxPrice) async {
    _currentPriceRange = '$minPrice-$maxPrice';
    await fetchProducts(page: 1); // Reset to first page
  }
  
  // Set type (featured or new-arrivals) and fetch products
  Future<void> setType(String type) async {
    _currentType = type;
    await fetchProducts(page: 1); // Reset to first page
  }
  
  // Fetch featured products
  Future<void> fetchFeaturedProducts() async {
    _currentType = 'featured';
    _currentCategory = null;
    _currentSubCategory = null;
    _currentSortOption = null;
    _currentSearchQuery = null;
    _currentPriceRange = null;
    
    await fetchProducts(page: 1);
  }
  
  // Fetch new arrivals
  Future<void> fetchNewArrivals() async {
    _currentType = 'new-arrivals';
    _currentCategory = null;
    _currentSubCategory = null;
    _currentSortOption = null;
    _currentSearchQuery = null;
    _currentPriceRange = null;
    
    await fetchProducts(page: 1);
  }
  
  // Helper method to update products data
  void _updateProductsData(ProductResponse response) {
    _products = response.data;
    _paginationLinks = response.links;
    _paginationMeta = response.meta;
    notifyListeners();
  }
  
  // Helper method to set loading state
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
} 
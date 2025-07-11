import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductService {
  static const String baseUrl = 'https://erp.floramine.in/api';

  // Fetch products with filtering, sorting, and pagination
  Future<ProductResponse> getProducts({
    String? category,
    String? subCategory,
    int? page,
    String? sort,
    String? type,
    String? search,
    String? priceRange,
  }) async {
    // Build query parameters
    Map<String, String> queryParams = {};
    
    if (category != null) queryParams['category'] = category;
    if (subCategory != null) queryParams['sub_category'] = subCategory;
    if (page != null) queryParams['page'] = page.toString();
    if (sort != null) queryParams['sort'] = sort;
    if (type != null) queryParams['type'] = type;
    if (search != null) queryParams['search'] = search;
    if (priceRange != null) queryParams['price'] = priceRange;

    // Construct the URL
    final uri = Uri.parse('$baseUrl/products').replace(queryParameters: queryParams);
    
    try {
      final response = await http.get(uri);
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return ProductResponse.fromJson(data);
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  // Helper method for pagination - Get next page
  Future<ProductResponse> getNextPage(PaginationLinks links) async {
    if (links.next == null) {
      throw Exception('No next page available');
    }
    
    try {
      final response = await http.get(Uri.parse(links.next!));
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return ProductResponse.fromJson(data);
      } else {
        throw Exception('Failed to load next page: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching next page: $e');
    }
  }

  // Helper method for pagination - Get previous page
  Future<ProductResponse> getPreviousPage(PaginationLinks links) async {
    if (links.prev == null) {
      throw Exception('No previous page available');
    }
    
    try {
      final response = await http.get(Uri.parse(links.prev!));
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return ProductResponse.fromJson(data);
      } else {
        throw Exception('Failed to load previous page: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching previous page: $e');
    }
  }

  // Get featured products
  Future<ProductResponse> getFeaturedProducts() async {
    return getProducts(type: 'featured');
  }

  // Get new arrivals
  Future<ProductResponse> getNewArrivals() async {
    return getProducts(type: 'new-arrivals');
  }

  // Get products by category
  Future<ProductResponse> getProductsByCategory(String category) async {
    return getProducts(category: category);
  }

  // Get products by sub-category
  Future<ProductResponse> getProductsBySubCategory(String subCategory) async {
    return getProducts(subCategory: subCategory);
  }

  // Search products
  Future<ProductResponse> searchProducts(String query) async {
    return getProducts(search: query);
  }

  // Filter products by price range
  Future<ProductResponse> filterByPriceRange(String minPrice, String maxPrice) async {
    return getProducts(priceRange: '$minPrice-$maxPrice');
  }

  // Sort products
  Future<ProductResponse> sortProducts(String sortOption) async {
    // Sort options: date_asc, date_desc, price_asc, price_desc
    return getProducts(sort: sortOption);
  }
} 
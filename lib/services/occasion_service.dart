import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import '../models/occasion_category_model.dart';

class OccasionService {
  static const String baseUrl = 'https://erp.floramine.in/api';

  // Fetch all occasion categories
  Future<OccasionCategoryResponse> fetchOccasionCategories() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/occasions'));
      
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return OccasionCategoryResponse.fromJson(jsonData);
      } else {
        developer.log('Failed to fetch occasion categories: ${response.statusCode}');
        return OccasionCategoryResponse(
          success: false,
          message: 'Failed to fetch occasion categories: ${response.statusCode}',
          data: [],
        );
      }
    } catch (e) {
      developer.log('Error fetching occasion categories: $e');
      return OccasionCategoryResponse(
        success: false,
        message: 'Error fetching occasion categories: $e',
        data: [],
      );
    }
  }

  // Fetch products for a specific occasion category by slug
  Future<OccasionCategoryProductsResponse> fetchOccasionProducts(String slug) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/occasions/$slug'));
      
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return OccasionCategoryProductsResponse.fromJson(jsonData);
      } else {
        developer.log('Failed to fetch occasion products: ${response.statusCode}');
        return OccasionCategoryProductsResponse(
          success: false,
          message: 'Failed to fetch occasion products: ${response.statusCode}',
          occasion: OccasionCategory(id: 0, name: '', slug: '', bannerImage: ''),
          products: [],
          pagination: Pagination(
            total: 0,
            currentPage: 1,
            perPage: 10,
            lastPage: 1,
          ),
        );
      }
    } catch (e) {
      developer.log('Error fetching occasion products: $e');
      return OccasionCategoryProductsResponse(
        success: false,
        message: 'Error fetching occasion products: $e',
        occasion: OccasionCategory(id: 0, name: '', slug: '', bannerImage: ''),
        products: [],
        pagination: Pagination(
          total: 0,
          currentPage: 1,
          perPage: 10,
          lastPage: 1,
        ),
      );
    }
  }
} 
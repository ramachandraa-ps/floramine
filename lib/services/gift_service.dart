import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/gift_category_model.dart';
import 'dart:developer' as developer;

class GiftService {
  static const String baseUrl = 'https://erp.floramine.in/api';

  // Fetch special day gift categories
  static Future<GiftCategoryResponse> fetchGiftCategories() async {
    developer.log('Fetching gift categories from $baseUrl/gifts');
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/gifts'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      
      developer.log('API Response Status Code: ${response.statusCode}');
      developer.log('API Response Body: ${response.body}');
      
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final categoryResponse = GiftCategoryResponse.fromJson(jsonData);
        developer.log('Successfully parsed ${categoryResponse.data.length} categories');
        return categoryResponse;
      } else {
        throw Exception('Failed to load gift categories: ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      developer.log('Error in fetchGiftCategories: $e');
      throw Exception('Failed to load gift categories: $e');
    }
  }
  
  // Fetch products for a specific gift category by slug
  static Future<GiftCategoryProductsResponse> fetchGiftCategoryProducts(String slug) async {
    developer.log('Fetching products for gift category with slug: $slug');
    
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/gifts/$slug'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      
      developer.log('API Response Status Code: ${response.statusCode}');
      developer.log('API Response Body: ${response.body.substring(0, min(500, response.body.length))}...');
      
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final productsResponse = GiftCategoryProductsResponse.fromJson(jsonData);
        developer.log('Successfully parsed ${productsResponse.products.length} products for category: ${productsResponse.gift.name}');
        return productsResponse;
      } else {
        throw Exception('Failed to load gift category products: ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      developer.log('Error in fetchGiftCategoryProducts: $e');
      throw Exception('Failed to load gift category products: $e');
    }
  }
}

// Helper function to avoid importing dart:math
int min(int a, int b) {
  return a < b ? a : b;
} 
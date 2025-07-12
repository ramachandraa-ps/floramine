import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/variation_model.dart';

class VariationService {
  final String baseUrl = 'https://erp.floramine.in/api';
  
  // Fetch all available variations
  Future<VariationResponse> getAllVariations() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/all-variations'));
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return VariationResponse.fromJson(data);
      } else {
        throw Exception('Failed to load variations: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching variations: $e');
    }
  }
  
  // Get variations for a specific product
  Future<VariationResponse> getVariationsForProduct(int productId) async {
    try {
      // This endpoint is hypothetical - you may need to adjust based on actual API
      final response = await http.get(Uri.parse('$baseUrl/product-variations/$productId'));
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return VariationResponse.fromJson(data);
      } else {
        // If product-specific variations fail, fall back to all variations
        return getAllVariations();
      }
    } catch (e) {
      // Fall back to all variations if there's an error
      return getAllVariations();
    }
  }
} 
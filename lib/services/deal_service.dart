import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class DealService {
  static const String baseUrl = 'https://erp.floramine.in/api';
  final http.Client _client;

  // Constructor with optional client parameter for dependency injection
  DealService({http.Client? client}) : _client = client ?? http.Client();

  // Fetch deals of the day information
  Future<Map<String, dynamic>> getDealsOfTheDay() async {
    try {
      final response = await _client.get(Uri.parse('$baseUrl/deals-of-the-day'));
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        print("Deals of the day API Response: ${response.body}");
        return data;
      } else {
        throw Exception('Failed to load deals info: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception in getDealsOfTheDay: $e");
      throw Exception('Error fetching deals info: $e');
    }
  }
  
  // Fetch top deal products
  Future<List<Product>> getTopDealProducts() async {
    try {
      final response = await _client.get(Uri.parse('$baseUrl/deals/top-products'));
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        print("Top deal products API Response: ${response.body}");
        
        if (data['success'] == true) {
          final List<dynamic> productsJson = data['data'];
          List<Product> products = [];
          
          for (var dealProduct in productsJson) {
            if (dealProduct['product'] != null) {
              // Extract the product data from the deal product
              final productJson = dealProduct['product'];
              products.add(Product.fromJson(productJson));
            }
          }
          
          print("Parsed ${products.length} top deal products successfully");
          return products;
        } else {
          throw Exception('API returned success: false - ${data['message']}');
        }
      } else {
        throw Exception('Failed to load top deal products: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception in getTopDealProducts: $e");
      throw Exception('Error fetching top deal products: $e');
    }
  }

  // Fetch exclusive deals products
  Future<List<Product>> getExclusiveDeals() async {
    try {
      final response = await _client.get(Uri.parse('$baseUrl/deals/exclusive-deals-1751982320/products'));
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        
        // Print the API response for debugging
        print("API Response: ${response.body}");
        
        if (data['success'] == true) {
          final List<dynamic> productsJson = data['data'];
          
          // Print the first product for debugging
          if (productsJson.isNotEmpty) {
            print("First product: ${json.encode(productsJson.first)}");
            
            // Check for variations
            if (productsJson.first['variations'] != null && 
                productsJson.first['variations'] is List &&
                productsJson.first['variations'].isNotEmpty) {
              final variation = productsJson.first['variations'].first;
              print("First variation: ${json.encode(variation)}");
              print("Default sell price: ${variation['default_sell_price']}");
              print("Deal offer price: ${variation['deal_offer_price']}");
              print("Is in deal: ${variation['is_in_deal']}");
            }
          }
          
          final products = productsJson.map((json) => Product.fromJson(json)).toList();
          print("Parsed ${products.length} products successfully");
          return products;
        } else {
          throw Exception('API returned success: false - ${data['message']}');
        }
      } else {
        throw Exception('Failed to load deals: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception in getExclusiveDeals: $e");
      throw Exception('Error fetching deals: $e');
    }
  }
  
  // Get mock deal products for offline use or testing
  List<Product> getMockDealProducts() {
    // Return hardcoded deal products similar to the API response structure
    final mockJson = {
      "id": 5,
      "name": "Snake Plant",
      "sku": "0005",
      "tags": null,
      "image": "https://erp.floramine.in/uploads/default-product.png",
      "video": "",
      "product_description": null,
      "category_name": "Plant",
      "sub_category_names": null,
      "brand_name": null,
      "unit_short_name": "Pc(s)",
      "barcode_type": "C128",
      "total_stock": "0",
      "variations": [
        {
          "id": 5,
          "variation_name": "DUMMY",
          "variation_templates": [],
          "variation_values": [],
          "variation_combination": "",
          "sub_sku": "0005",
          "media": [],
          "default_price": "₹ 0.00",
          "default_sell_price": "₹ 25.00",
          "discount": "₹ 0.00",
          "deal_offer_price": "₹ 23.75",
          "deal_discount": "5.00%",
          "deal_tag": "Exclusive Deals",
          "is_in_deal": true,
          "stock": 0
        }
      ],
      "created_at": "2025-05-21"
    };
    
    return [Product.fromJson(mockJson)];
  }
  
  // Clean up resources
  void dispose() {
    _client.close();
  }
} 
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category_model.dart';

class CategoryService {
  // Base API URL - using the provided API endpoint
  static const String _apiUrl = 'https://erp.floramine.in/api/categories';
  
  // Fetch categories from the API
  Future<List<Category>> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse(_apiUrl));
      
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        
        if (jsonResponse['success'] == true) {
          final List<dynamic> data = jsonResponse['data'];
          return data.map((json) => Category.fromJson(json)).toList();
        } else {
          throw Exception('API returned success: false - ${jsonResponse['message']}');
        }
      } else {
        throw Exception('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }
  
  // Mock data for offline use or testing
  List<Category> getMockCategories() {
    return [
      Category(
        id: 9,
        name: 'Plants',
        imageUrl: 'assets/images/Categories/plants.png',
        isRounded: true,
        subCategories: [
          Category(
            id: 10,
            name: 'Indoor Plants',
            imageUrl: 'assets/images/Categories/indoor_plants.png',
            isRounded: true,
          ),
          Category(
            id: 11,
            name: 'Outdoor Plants',
            imageUrl: 'assets/images/Categories/outdoor_plants.png',
            isRounded: true,
          ),
          Category(
            id: 12,
            name: 'Fruit Tree Plants',
            imageUrl: 'assets/images/Categories/flowering_plants.png',
            isRounded: true,
          ),
          Category(
            id: 13,
            name: 'Spice and Herbal Plants',
            imageUrl: 'assets/images/Categories/succulents.png',
            isRounded: true,
          ),
        ],
      ),
      Category(
        id: 16,
        name: 'Premium Seeds',
        imageUrl: 'assets/images/Categories/seeds.png',
        isRounded: true,
      ),
      Category(
        id: 22,
        name: 'Pots & Planters',
        imageUrl: 'assets/images/Categories/pots.png',
        isRounded: true,
      ),
      Category(
        id: 30,
        name: 'Soils & Fertilizer',
        imageUrl: 'assets/images/Categories/soil.png',
        isRounded: true,
      ),
      Category(
        id: 41,
        name: 'Accessories',
        imageUrl: 'assets/images/Categories/accessories.png',
        isRounded: true,
      ),
      Category(
        id: 50,
        name: 'Pebbels',
        imageUrl: 'assets/images/Categories/soil.png',
        isRounded: true,
      ),
      Category(
        id: 56,
        name: 'Gifts',
        imageUrl: 'assets/images/Categories/gifting.png',
        isRounded: true,
      ),
      Category(
        id: 66,
        name: 'Rental Services',
        imageUrl: 'assets/images/Categories/rental.png',
        isRounded: true,
      ),
    ];
  }
} 
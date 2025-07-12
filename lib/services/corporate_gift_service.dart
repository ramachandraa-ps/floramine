import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import '../models/corporate_gift_model.dart';

class CorporateGiftService {
  static const String baseUrl = 'https://erp.floramine.in/api';

  // Fetch all corporate gifts
  Future<CorporateGiftResponse> fetchCorporateGifts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/corporate-gifts'));
      
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return CorporateGiftResponse.fromJson(jsonData);
      } else {
        developer.log('Failed to fetch corporate gifts: ${response.statusCode}');
        return CorporateGiftResponse(
          success: false,
          message: 'Failed to fetch corporate gifts: ${response.statusCode}',
          data: [],
        );
      }
    } catch (e) {
      developer.log('Error fetching corporate gifts: $e');
      return CorporateGiftResponse(
        success: false,
        message: 'Error fetching corporate gifts: $e',
        data: [],
      );
    }
  }
} 
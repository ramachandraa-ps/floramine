import 'dart:developer' as developer;

class CorporateGift {
  final int id;
  final String name;
  final String slug;
  final String? description;
  final String image;
  final String? status;

  CorporateGift({
    required this.id,
    required this.name,
    required this.slug,
    this.description,
    required this.image,
    this.status,
  });

  factory CorporateGift.fromJson(Map<String, dynamic> json) {
    try {
      return CorporateGift(
        id: json['id'],
        name: json['name'] ?? 'Unknown',
        slug: json['slug'] ?? '',
        description: json['description'],
        image: json['image'] ?? '',
        status: json['status'],
      );
    } catch (e) {
      developer.log('Error parsing CorporateGift: $e, json: $json');
      rethrow;
    }
  }
}

class CorporateGiftResponse {
  final bool success;
  final String message;
  final List<CorporateGift> data;

  CorporateGiftResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CorporateGiftResponse.fromJson(Map<String, dynamic> json) {
    try {
      return CorporateGiftResponse(
        success: json['success'] ?? false,
        message: json['message'] ?? 'No message provided',
        data: json.containsKey('data') && json['data'] != null
            ? (json['data'] as List)
                .map((item) => CorporateGift.fromJson(item))
                .toList()
            : [],
      );
    } catch (e) {
      developer.log('Error parsing CorporateGiftResponse: $e, json: $json');
      // Return an empty response instead of throwing an error
      return CorporateGiftResponse(
        success: false,
        message: 'Error parsing response: $e',
        data: [],
      );
    }
  }
} 
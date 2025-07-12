import 'dart:developer' as developer;

class OccasionCategory {
  final int id;
  final String name;
  final String slug;
  final String bannerImage;

  OccasionCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.bannerImage,
  });

  factory OccasionCategory.fromJson(Map<String, dynamic> json) {
    try {
      return OccasionCategory(
        id: json['id'],
        name: json['name'] ?? 'Unknown',
        slug: json['slug'] ?? '',
        bannerImage: json['banner_image'] ?? '',
      );
    } catch (e) {
      developer.log('Error parsing OccasionCategory: $e, json: $json');
      rethrow;
    }
  }
}

class OccasionCategoryResponse {
  final bool success;
  final String message;
  final List<OccasionCategory> data;

  OccasionCategoryResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory OccasionCategoryResponse.fromJson(Map<String, dynamic> json) {
    try {
      return OccasionCategoryResponse(
        success: json['success'] ?? false,
        message: json['message'] ?? 'No message provided',
        data: json.containsKey('data') && json['data'] != null
            ? (json['data'] as List)
                .map((item) => OccasionCategory.fromJson(item))
                .toList()
            : [],
      );
    } catch (e) {
      developer.log('Error parsing OccasionCategoryResponse: $e, json: $json');
      // Return an empty response instead of throwing an error
      return OccasionCategoryResponse(
        success: false,
        message: 'Error parsing response: $e',
        data: [],
      );
    }
  }
}

// Reusing the same product models from gift_category_model.dart
// This is because the product structure is identical

// Product USP model
class ProductUSP {
  final int order;
  final String emoji;
  final String description;

  ProductUSP({
    required this.order,
    required this.emoji,
    required this.description,
  });

  factory ProductUSP.fromJson(Map<String, dynamic> json) {
    return ProductUSP(
      order: json['order'] ?? 0,
      emoji: json['emoji'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

// Variation template model
class VariationTemplate {
  final int id;
  final String name;

  VariationTemplate({
    required this.id,
    required this.name,
  });

  factory VariationTemplate.fromJson(Map<String, dynamic> json) {
    return VariationTemplate(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}

// Variation value model
class VariationValue {
  final int templateId;
  final String templateName;
  final int id;
  final String name;

  VariationValue({
    required this.templateId,
    required this.templateName,
    required this.id,
    required this.name,
  });

  factory VariationValue.fromJson(Map<String, dynamic> json) {
    return VariationValue(
      templateId: json['template_id'] ?? 0,
      templateName: json['template_name'] ?? '',
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}

// Product variation model
class ProductVariation {
  final int id;
  final String variationName;
  final List<VariationTemplate> variationTemplates;
  final List<VariationValue> variationValues;
  final String variationCombination;
  final String subSku;
  final List<String> media;
  final String defaultPrice;
  final String defaultSellPrice;
  final String discount;
  final String? dealOfferPrice;
  final String? dealDiscount;
  final String dealTag;
  final bool isInDeal;
  final int stock;

  ProductVariation({
    required this.id,
    required this.variationName,
    required this.variationTemplates,
    required this.variationValues,
    required this.variationCombination,
    required this.subSku,
    required this.media,
    required this.defaultPrice,
    required this.defaultSellPrice,
    required this.discount,
    this.dealOfferPrice,
    this.dealDiscount,
    required this.dealTag,
    required this.isInDeal,
    required this.stock,
  });

  factory ProductVariation.fromJson(Map<String, dynamic> json) {
    return ProductVariation(
      id: json['id'] ?? 0,
      variationName: json['variation_name'] ?? '',
      variationTemplates: json['variation_templates'] != null
          ? (json['variation_templates'] as List)
              .map((item) => VariationTemplate.fromJson(item))
              .toList()
          : [],
      variationValues: json['variation_values'] != null
          ? (json['variation_values'] as List)
              .map((item) => VariationValue.fromJson(item))
              .toList()
          : [],
      variationCombination: json['variation_combination'] ?? '',
      subSku: json['sub_sku'] ?? '',
      media: json['media'] != null
          ? (json['media'] as List).map((item) => item.toString()).toList()
          : [],
      defaultPrice: json['default_price'] ?? '',
      defaultSellPrice: json['default_sell_price'] ?? '',
      discount: json['discount'] ?? '',
      dealOfferPrice: json['deal_offer_price'],
      dealDiscount: json['deal_discount'],
      dealTag: json['deal_tag'] ?? '',
      isInDeal: json['is_in_deal'] ?? false,
      stock: json['stock'] ?? 0,
    );
  }
}

// Occasion product model
class OccasionProduct {
  final int id;
  final String name;
  final String sku;
  final String tags;
  final String image;
  final String video;
  final String productDescription;
  final String categoryName;
  final String subCategoryNames;
  final String brandName;
  final String unitShortName;
  final String barcodeType;
  final String totalStock;
  final List<ProductUSP> usps;
  final List<ProductVariation> variations;
  final String createdAt;

  OccasionProduct({
    required this.id,
    required this.name,
    required this.sku,
    required this.tags,
    required this.image,
    required this.video,
    required this.productDescription,
    required this.categoryName,
    required this.subCategoryNames,
    required this.brandName,
    required this.unitShortName,
    required this.barcodeType,
    required this.totalStock,
    required this.usps,
    required this.variations,
    required this.createdAt,
  });

  factory OccasionProduct.fromJson(Map<String, dynamic> json) {
    try {
      return OccasionProduct(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        sku: json['sku'] ?? '',
        tags: json['tags'] ?? '',
        image: json['image'] ?? '',
        video: json['video'] ?? '',
        productDescription: json['product_description'] ?? '',
        categoryName: json['category_name'] ?? '',
        subCategoryNames: json['sub_category_names'] ?? '',
        brandName: json['brand_name'] ?? '',
        unitShortName: json['unit_short_name'] ?? '',
        barcodeType: json['barcode_type'] ?? '',
        totalStock: json['total_stock'] ?? '',
        usps: json['usps'] != null
            ? (json['usps'] as List)
                .map((item) => ProductUSP.fromJson(item))
                .toList()
            : [],
        variations: json['variations'] != null
            ? (json['variations'] as List)
                .map((item) => ProductVariation.fromJson(item))
                .toList()
            : [],
        createdAt: json['created_at'] ?? '',
      );
    } catch (e) {
      developer.log('Error parsing OccasionProduct: $e, json: $json');
      rethrow;
    }
  }

  // Get the first variation's sell price or default to empty string
  String get price {
    if (variations.isNotEmpty) {
      return variations.first.defaultSellPrice;
    }
    return '';
  }

  // Get the first variation's discount or default to empty string
  String get discountPercentage {
    if (variations.isNotEmpty) {
      return variations.first.discount;
    }
    return '';
  }

  // Get the first variation's image or default to the product image
  String get displayImage {
    if (variations.isNotEmpty && variations.first.media.isNotEmpty) {
      return variations.first.media.first;
    }
    return image;
  }
}

// Pagination model
class Pagination {
  final int total;
  final int currentPage;
  final int perPage;
  final int lastPage;

  Pagination({
    required this.total,
    required this.currentPage,
    required this.perPage,
    required this.lastPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      total: json['total'] ?? 0,
      currentPage: json['current_page'] ?? 1,
      perPage: json['per_page'] ?? 10,
      lastPage: json['last_page'] ?? 1,
    );
  }
}

// Occasion category products response
class OccasionCategoryProductsResponse {
  final bool success;
  final String message;
  final OccasionCategory occasion;
  final List<OccasionProduct> products;
  final Pagination pagination;

  OccasionCategoryProductsResponse({
    required this.success,
    required this.message,
    required this.occasion,
    required this.products,
    required this.pagination,
  });

  factory OccasionCategoryProductsResponse.fromJson(Map<String, dynamic> json) {
    try {
      final data = json['data'] as Map<String, dynamic>;
      return OccasionCategoryProductsResponse(
        success: json['success'] ?? false,
        message: json['message'] ?? '',
        occasion: OccasionCategory.fromJson(data['gift']),
        products: (data['products'] as List)
            .map((item) => OccasionProduct.fromJson(item))
            .toList(),
        pagination: Pagination.fromJson(data['pagination']),
      );
    } catch (e) {
      developer.log('Error parsing OccasionCategoryProductsResponse: $e, json: $json');
      // Return an empty response instead of throwing
      return OccasionCategoryProductsResponse(
        success: false,
        message: 'Error parsing response: $e',
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
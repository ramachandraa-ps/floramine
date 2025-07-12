class Product {
  final int id;
  final String name;
  final String sku;
  final String tags;
  final List<String> images;
  final String video;
  final String? productDescription;
  final String categoryName;
  final String subCategoryName;
  final String brandName;
  final String unitShortName;
  final String barcodeType;
  final String totalStock;
  final List<ProductVariation> variations;
  final String createdAt;
  final List<String> usps; // Added USPs list

  Product({
    required this.id,
    required this.name,
    required this.sku,
    required this.tags,
    required this.images,
    required this.video,
    this.productDescription,
    required this.categoryName,
    required this.subCategoryName,
    required this.brandName,
    required this.unitShortName,
    required this.barcodeType,
    required this.totalStock,
    required this.variations,
    required this.createdAt,
    required this.usps, // Added USPs parameter
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // Parse image string into a list of image URLs
    List<String> imageList = [];
    if (json['image'] != null && json['image'].toString().isNotEmpty) {
      // Split by comma if multiple images are provided
      if (json['image'].toString().contains(',')) {
        imageList = json['image'].toString().split(',')
            .map((img) => img.trim())
            .where((img) => img.isNotEmpty)
            .toList();
      } else {
        // If image is a single string URL, add it directly to the list
        imageList.add(json['image'].toString());
      }
    }

    // Parse variations
    List<ProductVariation> variationsList = [];
    if (json['variations'] != null && json['variations'] is List) {
      variationsList = (json['variations'] as List)
          .map((variation) => ProductVariation.fromJson(variation))
          .toList();
    }

    // Parse USPs if available
    List<String> uspList = [];
    if (json['usps'] != null && json['usps'] is List) {
      for (var usp in json['usps']) {
        if (usp['emoji'] != null && usp['description'] != null) {
          uspList.add('${usp['emoji']} ${usp['description']}');
        }
      }
    } else {
      // Generate default USPs based on category or tags
      String category = json['category_name'] ?? '';
      String tags = json['tags'] ?? '';
      
      if (category.toLowerCase().contains('plant')) {
        uspList.add('🌿 Plant');
      }
      
      if (tags.toLowerCase().contains('air purifying')) {
        uspList.add('🍃 Air Purifying');
      }
      
      if (tags.toLowerCase().contains('low maintenance')) {
        uspList.add('🌱 Low Maintenance');
      }
    }

    return Product(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      sku: json['sku'] ?? '',
      tags: json['tags'] ?? '',
      images: imageList,
      video: json['video'] ?? '',
      productDescription: json['product_description'],
      categoryName: json['category_name'] ?? '',
      subCategoryName: json['sub_category_name'] ?? '',
      brandName: json['brand_name'] ?? '',
      unitShortName: json['unit_short_name'] ?? '',
      barcodeType: json['barcode_type'] ?? '',
      totalStock: json['total_stock']?.toString() ?? '0',
      variations: variationsList,
      createdAt: json['created_at'] ?? '',
      usps: uspList, // Added USPs to the constructor
    );
  }
}

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
  final int stock;
  
  // Deal-specific fields
  final String? dealOfferPrice;
  final String? dealDiscount;
  final String? dealTag;
  final bool isInDeal;

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
    required this.stock,
    this.dealOfferPrice,
    this.dealDiscount,
    this.dealTag,
    this.isInDeal = false,
  });

  factory ProductVariation.fromJson(Map<String, dynamic> json) {
    // Parse variation templates
    List<VariationTemplate> templatesList = [];
    if (json['variation_templates'] != null && json['variation_templates'] is List) {
      templatesList = (json['variation_templates'] as List)
          .map((template) => VariationTemplate.fromJson(template))
          .toList();
    }

    // Parse variation values
    List<VariationValue> valuesList = [];
    if (json['variation_values'] != null && json['variation_values'] is List) {
      valuesList = (json['variation_values'] as List)
          .map((value) => VariationValue.fromJson(value))
          .toList();
    }

    // Parse media
    List<String> mediaList = [];
    if (json['media'] != null && json['media'] is List) {
      mediaList = (json['media'] as List).map((m) => m.toString()).toList();
    }

    return ProductVariation(
      id: json['id'] ?? 0,
      variationName: json['variation_name'] ?? '',
      variationTemplates: templatesList,
      variationValues: valuesList,
      variationCombination: json['variation_combination'] ?? '',
      subSku: json['sub_sku'] ?? '',
      media: mediaList,
      defaultPrice: json['default_price'] ?? '',
      defaultSellPrice: json['default_sell_price'] ?? '',
      discount: json['discount'] ?? '',
      stock: json['stock'] ?? 0,
      // Deal-specific fields
      dealOfferPrice: json['deal_offer_price'],
      dealDiscount: json['deal_discount'],
      dealTag: json['deal_tag'],
      isInDeal: json['is_in_deal'] ?? false,
    );
  }
}

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

class ProductResponse {
  final List<Product> data;
  final PaginationLinks links;
  final PaginationMeta meta;
  final bool status;
  final String message;

  ProductResponse({
    required this.data,
    required this.links,
    required this.meta,
    required this.status,
    required this.message,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    List<Product> productList = [];
    if (json['data'] != null && json['data'] is List) {
      productList = (json['data'] as List)
          .map((product) => Product.fromJson(product))
          .toList();
    }

    return ProductResponse(
      data: productList,
      links: PaginationLinks.fromJson(json['links'] ?? {}),
      meta: PaginationMeta.fromJson(json['meta'] ?? {}),
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }
}

class PaginationLinks {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  PaginationLinks({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory PaginationLinks.fromJson(Map<String, dynamic> json) {
    return PaginationLinks(
      first: json['first'],
      last: json['last'],
      prev: json['prev'],
      next: json['next'],
    );
  }
}

class PaginationMeta {
  final int currentPage;
  final int? from;
  final int lastPage;
  final List<PageLink> links;
  final String path;
  final int perPage;
  final int? to;
  final int total;

  PaginationMeta({
    required this.currentPage,
    this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    this.to,
    required this.total,
  });

  factory PaginationMeta.fromJson(Map<String, dynamic> json) {
    List<PageLink> linksList = [];
    if (json['links'] != null && json['links'] is List) {
      linksList = (json['links'] as List)
          .map((link) => PageLink.fromJson(link))
          .toList();
    }

    return PaginationMeta(
      currentPage: json['current_page'] ?? 1,
      from: json['from'],
      lastPage: json['last_page'] ?? 1,
      links: linksList,
      path: json['path'] ?? '',
      perPage: json['per_page'] ?? 10,
      to: json['to'],
      total: json['total'] ?? 0,
    );
  }
}

class PageLink {
  final String? url;
  final String label;
  final bool active;

  PageLink({
    this.url,
    required this.label,
    required this.active,
  });

  factory PageLink.fromJson(Map<String, dynamic> json) {
    return PageLink(
      url: json['url'],
      label: json['label'] ?? '',
      active: json['active'] ?? false,
    );
  }
} 

class ProductDetailsResponse {
  final bool success;
  final String message;
  final ProductDetailsData data;

  ProductDetailsResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    return ProductDetailsResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: ProductDetailsData.fromJson(json['data'] ?? {}),
    );
  }
}

class ProductDetailsData {
  final Product product;
  final List<Product> youLike;
  final List<Product> related;
  final List<Product> recentlyViewed;
  final List<Review> reviews;
  final ReviewPagination reviewPagination;
  final ReviewSummary reviewSummary;

  ProductDetailsData({
    required this.product,
    required this.youLike,
    required this.related,
    required this.recentlyViewed,
    required this.reviews,
    required this.reviewPagination,
    required this.reviewSummary,
  });

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) {
    // Parse product
    Product product = Product.fromJson(json['product'] ?? {});
    
    // Parse "you might like" products
    List<Product> youLike = [];
    if (json['you_like'] != null && json['you_like'] is List) {
      youLike = (json['you_like'] as List)
          .map((item) => Product.fromJson(item))
          .toList();
    }
    
    // Parse related products
    List<Product> related = [];
    if (json['related'] != null && json['related'] is List) {
      related = (json['related'] as List)
          .map((item) => Product.fromJson(item))
          .toList();
    }
    
    // Parse recently viewed products
    List<Product> recentlyViewed = [];
    if (json['recently_viewed'] != null && json['recently_viewed'] is List) {
      recentlyViewed = (json['recently_viewed'] as List)
          .map((item) => Product.fromJson(item))
          .toList();
    }
    
    // Parse reviews
    List<Review> reviews = [];
    if (json['reviews'] != null && json['reviews'] is List) {
      reviews = (json['reviews'] as List)
          .map((item) => Review.fromJson(item))
          .toList();
    }
    
    // Parse review summary with correct field name
    ReviewSummary reviewSummary;
    if (json['review_summery'] != null) {
      reviewSummary = ReviewSummary.fromJson(json['review_summery']);
    } else if (json['review_summary'] != null) {
      reviewSummary = ReviewSummary.fromJson(json['review_summary']);
    } else {
      reviewSummary = ReviewSummary.fromJson({});
    }
    
    return ProductDetailsData(
      product: product,
      youLike: youLike,
      related: related,
      recentlyViewed: recentlyViewed,
      reviews: reviews,
      reviewPagination: ReviewPagination.fromJson(json['review_pagination'] ?? {}),
      reviewSummary: reviewSummary,
    );
  }
}

class Review {
  final String contactName;
  final String contactImg;
  final int rating;
  final String comments;
  final List<String> images;
  final String createdAt;

  Review({
    required this.contactName,
    required this.contactImg,
    required this.rating,
    required this.comments,
    required this.images,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    List<String> imagesList = [];
    if (json['images'] != null && json['images'] is List) {
      imagesList = (json['images'] as List).map((item) => item.toString()).toList();
    }

    return Review(
      contactName: json['contact_name'] ?? '',
      contactImg: json['contact_img'] ?? '',
      rating: json['rating'] ?? 0,
      comments: json['comments'] ?? '',
      images: imagesList,
      createdAt: json['created_at'] ?? '',
    );
  }
}

class ReviewPagination {
  final int total;
  final int perPage;
  final int currentPage;

  ReviewPagination({
    required this.total,
    required this.perPage,
    required this.currentPage,
  });

  factory ReviewPagination.fromJson(Map<String, dynamic> json) {
    return ReviewPagination(
      total: json['total'] ?? 0,
      perPage: json['per_page'] ?? 0,
      currentPage: json['current_page'] ?? 0,
    );
  }
}

class ReviewSummary {
  final int totalReviews;
  final double averageRating;
  final Map<String, String> breakdown;

  ReviewSummary({
    required this.totalReviews,
    required this.averageRating,
    required this.breakdown,
  });

  factory ReviewSummary.fromJson(Map<String, dynamic> json) {
    Map<String, String> breakdownMap = {};
    if (json['breakdown'] != null && json['breakdown'] is Map) {
      breakdownMap = (json['breakdown'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, value?.toString() ?? '0'));
    }

    return ReviewSummary(
      totalReviews: json['total_reviews'] ?? 0,
      averageRating: (json['average_rating'] ?? 0).toDouble(),
      breakdown: breakdownMap,
    );
  }
} 
class Category {
  final int id;
  final String name;
  final String imageUrl;
  final bool isRounded;
  final List<Category>? subCategories;

  Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isRounded = false,
    this.subCategories,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    List<Category>? subCategories;
    
    // Parse subcategories if they exist
    if (json['sub_categories'] != null && json['sub_categories'] is List) {
      subCategories = (json['sub_categories'] as List)
          .map((subCat) => Category.fromJson(subCat))
          .toList();
    }
    
    // Extract image URL from the API response
    String imageUrl = '';
    if (json['image_url'] != null && json['image_url'].toString().isNotEmpty) {
      imageUrl = json['image_url'].toString();
    }
    
    return Category(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      imageUrl: imageUrl,
      isRounded: true, // Set all categories to use rounded images
      subCategories: subCategories,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_url': imageUrl,
      'sub_categories': subCategories?.map((subCat) => subCat.toJson()).toList(),
    };
  }
} 
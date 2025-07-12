# Data Models

## Category Model
Located in `lib/models/category_model.dart`

```dart
class Category {
  final int id;
  final String name;
  final String imageUrl;
  final bool isRounded;
  final List<Category>? subCategories;
}
```

The Category model represents product categories in the application. It includes:
- `id`: Unique identifier for the category
- `name`: Display name of the category
- `imageUrl`: Path to the category image
- `isRounded`: Whether the category image should be displayed with rounded corners
- `subCategories`: Optional list of subcategories

The model includes JSON serialization/deserialization methods for API integration.

## Product Model
Located in `lib/models/product_model.dart`

```dart
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
}
```

The Product model represents individual products in the store. It includes:
- Basic product information (id, name, SKU, tags)
- Media (images, video)
- Category information
- Brand and unit information
- Stock information
- Product variations
- Creation timestamp

### Related Models

#### ProductVariation
```dart
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
}
```

Represents different variations of a product (e.g., size, color).

#### VariationTemplate
```dart
class VariationTemplate {
  final int id;
  final String name;
}
```

Defines a template for variations (e.g., "Size", "Color").

#### VariationValue
```dart
class VariationValue {
  final int templateId;
  final String templateName;
  final int id;
  final String name;
}
```

Represents specific values for variation templates (e.g., "Small", "Red").

## API Response Models

### ProductResponse
```dart
class ProductResponse {
  final List<Product> data;
  final PaginationLinks links;
  final PaginationMeta meta;
  final bool status;
  final String message;
}
```

Wraps API responses for product listings, including pagination information.

### PaginationLinks
```dart
class PaginationLinks {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;
}
```

Contains links for pagination navigation.

### PaginationMeta
```dart
class PaginationMeta {
  final int currentPage;
  final int? from;
  final int lastPage;
  final List<PageLink> links;
  final String path;
  final int perPage;
  final int? to;
  final int total;
}
```

Contains metadata about the current pagination state. 
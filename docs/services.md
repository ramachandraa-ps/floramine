# Services

The services in the Floramine app handle API communication and data fetching. They provide a clean separation between the UI and data layers.

## CategoryService
Located in `lib/services/category_service.dart`

```dart
class CategoryService {
  static const String _apiUrl = 'https://erp.floramine.in/api/categories';
  
  Future<List<Category>> fetchCategories() async {
    // Fetches categories from API
  }
  
  List<Category> getMockCategories() {
    // Returns mock data for offline use or testing
  }
}
```

The CategoryService is responsible for:
- Fetching category data from the API
- Providing mock data when offline or for testing
- Handling API errors and exceptions

### Key Methods:
- `fetchCategories()`: Retrieves categories from the API endpoint
- `getMockCategories()`: Returns hardcoded category data for offline use

## ProductService
Located in `lib/services/product_service.dart`

```dart
class ProductService {
  static const String baseUrl = 'https://erp.floramine.in/api';

  Future<ProductResponse> getProducts({
    String? category,
    String? subCategory,
    int? page,
    String? sort,
    String? type,
    String? search,
    String? priceRange,
  }) async {
    // Fetches products with filtering, sorting, and pagination
  }
  
  // Additional methods for pagination and specialized product fetching
}
```

The ProductService is responsible for:
- Fetching product data with various filters and sorting options
- Handling pagination for product listings
- Managing specialized product queries (featured, new arrivals, etc.)
- Error handling for API requests

### Key Methods:
- `getProducts()`: Main method for fetching products with filters
- `getNextPage()`: Fetches the next page of products for pagination
- `getPreviousPage()`: Fetches the previous page of products
- `getFeaturedProducts()`: Fetches featured products
- `getNewArrivals()`: Fetches new arrival products
- `getProductsByCategory()`: Fetches products filtered by category
- `getProductsBySubCategory()`: Fetches products filtered by subcategory
- `searchProducts()`: Searches products by query string
- `filterByPriceRange()`: Filters products by price range
- `sortProducts()`: Sorts products by specified criteria
- `getProductDetailsById()`: Fetches detailed information for a specific product

## DealService
Located in `lib/services/deal_service.dart`

```dart
class DealService {
  static const String baseUrl = 'https://erp.floramine.in/api';
  final http.Client _client;

  // Constructor with optional client parameter for dependency injection
  DealService({http.Client? client}) : _client = client ?? http.Client();
  
  Future<Map<String, dynamic>> getDealsOfTheDay() async {
    // Fetches deals of the day information
  }
  
  // Additional methods for specialized deal fetching
}
```

The DealService is responsible for:
- Fetching various types of deals and promotions
- Providing deal-related product information
- Handling API errors and providing fallback data
- Supporting dependency injection for testability

### Key Methods:
- `getDealsOfTheDay()`: Retrieves current deals of the day information
- `getTopDealProducts()`: Fetches products featured in top deals
- `getExclusiveDeals()`: Retrieves products in exclusive deals
- `getMockDealProducts()`: Returns hardcoded deal products for offline use or testing
- `dispose()`: Cleans up resources when service is no longer needed

## VariationService
Located in `lib/services/variation_service.dart`

```dart
class VariationService {
  final String baseUrl = 'https://erp.floramine.in/api';
  
  Future<VariationResponse> getAllVariations() async {
    // Fetches all available product variations
  }
  
  Future<VariationResponse> getVariationsForProduct(int productId) async {
    // Gets variations for a specific product
  }
}
```

The VariationService is responsible for:
- Fetching product variation data (sizes, colors, etc.)
- Retrieving product-specific variations
- Providing fallback options when specific variations aren't available
- Error handling for variation API requests

### Key Methods:
- `getAllVariations()`: Retrieves all available product variations
- `getVariationsForProduct()`: Gets variations for a specific product ID

## API Communication Pattern

All services follow a similar pattern for API communication:
1. Construct the API URL with query parameters
2. Make an HTTP request using the `http` package
3. Parse the JSON response into model objects
4. Handle errors and exceptions
5. Return the parsed data or throw meaningful exceptions

## Error Handling

The services implement error handling to:
- Catch network exceptions
- Handle API error responses
- Provide fallback data when appropriate
- Propagate meaningful error messages to the UI layer 
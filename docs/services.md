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

## API Communication Pattern

Both services follow a similar pattern for API communication:
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
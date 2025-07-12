# State Management with Providers

The Floramine app uses the Provider pattern for state management, leveraging the `provider` package to manage application state and provide reactive UI updates.

## Provider Architecture

The app follows a structured approach to state management:

1. **Models**: Define the data structures
2. **Services**: Handle API communication
3. **Providers**: Manage state and business logic
4. **Context**: Shared business logic between providers
5. **UI**: Consumes providers for reactive updates

## CategoryProvider
Located in `lib/providers/category_provider.dart`

```dart
class CategoryProvider extends CategoryContext {
  // This class extends CategoryContext and inherits all its functionality
  // Additional provider-specific methods can be added here if needed
}
```

The CategoryProvider extends the CategoryContext class, inheriting its functionality for managing category data. This approach allows for code reuse while maintaining a clean separation of concerns.

### CategoryContext
Located in `lib/context/category_context.dart`

```dart
class CategoryContext extends ChangeNotifier {
  final CategoryService _categoryService = CategoryService();
  
  List<Category>? _categories;
  bool _isLoading = false;
  String? _error;
  bool _hasInternetConnection = true;

  // Getters and methods for category management
}
```

The CategoryContext handles:
- Loading categories from the API
- Caching category data
- Providing fallback to mock data when offline
- Managing loading and error states
- Notifying listeners of state changes

## ProductProvider
Located in `lib/providers/product_provider.dart`

```dart
class ProductProvider extends ChangeNotifier {
  final ProductService _productService = ProductService();
  
  // Products data
  List<Product> _products = [];
  
  // Pagination state
  PaginationLinks? _paginationLinks;
  PaginationMeta? _paginationMeta;
  
  // Loading states
  bool _isLoading = false;
  String? _error;
  
  // Filter and sort states
  String? _currentCategory;
  String? _currentSubCategory;
  String? _currentSortOption;
  String? _currentSearchQuery;
  String? _currentPriceRange;
  String? _currentType;
  
  // Methods for product management
}
```

The ProductProvider is responsible for:
- Fetching and managing product data
- Handling pagination for product listings
- Managing filter and sort options
- Tracking loading and error states
- Notifying listeners of state changes

### Key Methods:
- `fetchProducts()`: Loads products based on current filters
- `loadMoreProducts()`: Handles pagination for product listings
- `setCategory()`, `setSubCategory()`: Filter products by category
- `setSortOption()`: Sort products by different criteria
- `setSearchQuery()`: Search for products
- `setPriceRange()`: Filter products by price range
- `setType()`: Filter by product type (featured, new arrivals)

## Provider Setup

In `main.dart`, providers are set up at the application root:

```dart
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
```

This makes the providers available throughout the application, allowing any widget to access and listen to state changes.

## Consuming Providers in UI

Widgets can access providers using:

```dart
// Read provider without listening to changes
final productProvider = Provider.of<ProductProvider>(context, listen: false);

// Read provider and listen to changes
final products = context.watch<ProductProvider>().products;
```

This pattern allows for efficient UI updates when state changes. 
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

## DealProvider
Located in `lib/providers/deal_provider.dart`

```dart
class DealProvider extends ChangeNotifier {
  final DealService _dealService = DealService();
  
  // Deals data
  Map<String, dynamic>? _dealsOfTheDay;
  List<Product> _topDealProducts = [];
  List<Product> _exclusiveDeals = [];
  
  // Loading states
  bool _isLoadingDealsOfTheDay = false;
  bool _isLoadingTopDeals = false;
  bool _isLoadingExclusiveDeals = false;
  String? _error;
  
  // Methods for deal management
}
```

The DealProvider is responsible for:
- Fetching and managing various types of deals
- Tracking loading states for different deal types
- Providing access to promotional product data
- Managing error states
- Notifying listeners of state changes

### Key Methods:
- `fetchDealsOfTheDay()`: Loads current deals of the day
- `fetchTopDealProducts()`: Fetches products featured in top deals
- `fetchExclusiveDeals()`: Retrieves products in exclusive deals
- `refreshDeals()`: Updates all deal data

## VariationProvider
Located in `lib/providers/variation_provider.dart`

```dart
class VariationProvider extends ChangeNotifier {
  final VariationService _variationService = VariationService();
  
  // Variations data
  List<ProductVariation> _allVariations = [];
  Map<int, List<ProductVariation>> _productVariations = {};
  
  // Loading states
  bool _isLoading = false;
  String? _error;
  
  // Methods for variation management
}
```

The VariationProvider is responsible for:
- Fetching and caching product variations
- Managing product-specific variations
- Tracking loading and error states
- Notifying listeners of state changes

### Key Methods:
- `fetchAllVariations()`: Loads all available product variations
- `fetchVariationsForProduct()`: Gets variations for a specific product
- `getVariationById()`: Retrieves a specific variation by ID

## Provider Setup

In `main.dart`, providers are set up at the application root:

```dart
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => DealProvider()),
        ChangeNotifierProvider(create: (_) => VariationProvider()),
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
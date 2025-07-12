# Widgets

The Floramine app uses a variety of reusable widgets to maintain consistency across the UI and improve code reusability. Here's an overview of the key widgets:

## Navigation Widgets

### CustomBottomNavigationBar
Located in `lib/widgets/bottom_navigation_bar.dart`

```dart
class CustomBottomNavigationBar extends StatelessWidget {
  final NavigationItem currentItem;
  final Function(NavigationItem) onItemSelected;
}
```

A custom bottom navigation bar that provides navigation between the main sections of the app:
- Plants (Home)
- Categories
- Cart
- Orders
- Help

Features:
- Visual indicator for the active tab
- Custom styling with green accent color
- Static navigation helper method

## Header Widgets

### HeaderWidget
Located in `lib/widgets/header_widget.dart`

```dart
class HeaderWidget extends StatelessWidget {
  final VoidCallback onNotificationTap;
}
```

A consistent header used across multiple screens with:
- App logo
- Notification bell icon
- Clean white background with shadow

## Search Widgets

### CustomSearchBar
Located in `lib/widgets/search_bar.dart`

```dart
class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final VoidCallback onSearchIconTap;
}
```

A reusable search bar component with:
- Customizable hint text
- Search icon
- Rounded styling with light background
- Tap callback for navigation to search screen

## Product Display Widgets

### ProductCard
Located in `lib/widgets/product_card.dart`

```dart
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final bool showAddToCart;
}
```

Card widget for displaying product information in grids and lists:
- Product image
- Name
- Price
- Optional add to cart button
- Shadow and rounded corners

### PlantProductCard
Located in `lib/widgets/plant_product_card.dart`

```dart
class PlantProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final bool isHorizontal;
}
```

Specialized product card for plant items with:
- Horizontal and vertical layout options
- Plant-specific information display
- Add to cart and favorite buttons

## Category Widgets

### CategoryTile
Located in `lib/widgets/category_tile.dart`

```dart
class CategoryTile extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;
  final bool isSelected;
}
```

Tile for displaying category information:
- Category image (with option for rounded display)
- Category name
- Selection state visual indicator
- Tap handling for navigation

## Home Screen Widgets

Located in `lib/widgets/home_screen/`

### HorizontalProductList
```dart
class HorizontalProductList extends StatelessWidget {
  // Displays a horizontal scrolling list of product categories
}
```

### FeaturedProductsSection
```dart
class FeaturedProductsSection extends StatelessWidget {
  // Displays a section of featured products
}
```

### TrendingProductsSection
```dart
class TrendingProductsSection extends StatelessWidget {
  // Displays a section of trending products
}
```

### OtherProductsSection
```dart
class OtherProductsSection extends StatelessWidget {
  // Displays additional product sections
}
```

### CompanyInformation
```dart
class CompanyInformation extends StatelessWidget {
  // Displays company information banner
}
```

## Filter Widgets

### FilterWidget
Located in `lib/widgets/filter_widget.dart`

```dart
class FilterWidget extends StatefulWidget {
  final Function(String) onCategorySelected;
  final Function(String) onSortOptionSelected;
  final Function(String, String) onPriceRangeSelected;
}
```

A comprehensive filter panel for product listings:
- Category filters
- Sort options (price, date, etc.)
- Price range slider
- Apply and reset buttons

## Feedback Widgets

### ToastWidget
Located in `lib/widgets/toast_widget.dart`

```dart
class ToastWidget extends StatelessWidget {
  final String message;
  final ToastType type;
}
```

A customizable toast notification widget:
- Success, error, info, and warning types
- Auto-dismissing behavior
- Custom styling for each type
- Animation for smooth appearance/disappearance

## Feature-Specific Widgets

The app includes specialized widget collections for specific features:

- `lib/widgets/product_details/` - Widgets for the product details screen
- `lib/widgets/cart/` - Cart-related widgets
- `lib/widgets/checkout/` - Checkout process widgets
- `lib/widgets/payment_methods/` - Payment method management widgets
- `lib/widgets/order_details/` - Order information widgets
- `lib/widgets/gifting/` - Gift-related widgets
- `lib/widgets/bundles/` - Product bundle widgets
- `lib/widgets/deal_of_the_day/` - Special deals widgets

Each of these specialized widget collections maintains consistent styling while providing feature-specific functionality. 
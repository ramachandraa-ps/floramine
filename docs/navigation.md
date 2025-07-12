# Navigation System

The Floramine app implements a comprehensive navigation system that combines several Flutter navigation approaches to create a smooth user experience.

## Navigation Structure

The app uses a hierarchical navigation structure:

1. **Initial Flow**: Splash Screen → Login/Register → Home Screen
2. **Main Navigation**: Bottom navigation bar for primary sections
3. **Secondary Navigation**: Named routes for specific features
4. **Tertiary Navigation**: Push/pop for detail screens and temporary views

## Bottom Navigation Bar

Located in `lib/widgets/bottom_navigation_bar.dart`

The custom bottom navigation bar provides access to the five main sections of the app:

```dart
enum NavigationItem {
  plants,
  categories,
  cart,
  orders,
  help
}
```

The navigation bar includes:
- Visual indicators for the active tab
- Custom styling with the app's primary green color
- A static navigation helper method for consistent navigation

### Navigation Helper Method

```dart
static void navigateTo(BuildContext context, NavigationItem item) {
  // Get the current route name to avoid pushing duplicate routes
  final String? currentRoute = ModalRoute.of(context)?.settings.name;
  
  // Define route names for each navigation item
  String routeName;
  
  switch (item) {
    case NavigationItem.plants:
      routeName = '/plants';
      break;
    case NavigationItem.categories:
      routeName = '/categories';
      break;
    case NavigationItem.cart:
      routeName = '/cart';
      break;
    case NavigationItem.orders:
      routeName = '/orders';
      break;
    case NavigationItem.help:
      routeName = '/help';
      break;
  }
  
  // If we're already on this route, do nothing
  if (currentRoute == routeName) return;
  
  // Navigate to the new route
  Navigator.of(context).pushNamedAndRemoveUntil(
    routeName,
    (route) => false,
  );
}
```

This method ensures consistent navigation behavior by:
- Checking if the user is already on the requested route
- Using `pushNamedAndRemoveUntil` to clear the navigation stack
- Providing a clean navigation experience between main sections

## Named Routes

The app defines named routes in the `main.dart` file for direct navigation to specific screens:

```dart
routes: {
  '/plants': (context) => const HomeScreen(),
  '/categories': (context) => const CategoriesScreen(),
  '/cart': (context) => const CartScreen(),
  '/orders': (context) => const OrderDetailsScreen(),
  '/help': (context) => const HelpScreen(),
  '/notification': (context) => const NotificationScreen(),
  // ... many more routes
}
```

Benefits of named routes:
- Direct navigation to specific screens
- Ability to pass arguments through route settings
- Consistent navigation patterns across the app

### Routes with Parameters

Some routes accept parameters for dynamic content:

```dart
'/blog_details_with_id': (context) {
  final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  return BlogDetailsScreen(blogId: args['blogId']);
},

'/products': (context) {
  final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
  return ProductsScreen(
    category: args?['category'],
    subCategory: args?['subCategory'],
    initialSearchQuery: args?['searchQuery'],
  );
},
```

## Direct Navigation

For temporary screens or detail views, the app uses direct push/pop navigation:

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const ProductDetailsScreen(product: product)),
);
```

And for returning:

```dart
Navigator.pop(context);
```

## Splash Screen Navigation

The app uses a timed navigation from the splash screen to the login screen:

```dart
Timer(const Duration(seconds: 3), () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const LoginScreen()),
  );
});
```

## Authentication Flow

After successful login, the app replaces the current navigation stack with the home screen:

```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => const HomeScreen()),
);
```

This ensures users can't navigate back to the login screen using the back button.

## Navigation Patterns

The app follows these navigation patterns:

1. **Tab-based navigation** for main sections via the bottom navigation bar
2. **Stack-based navigation** for drilling down into content
3. **Modal navigation** for temporary views like filters
4. **Replacement navigation** for auth flows and onboarding

This multi-layered approach creates an intuitive navigation experience that follows mobile design best practices. 
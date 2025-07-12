# Screens

The Floramine app contains numerous screens that provide a comprehensive shopping experience. Here's an overview of the main screens:

## Authentication Screens

### SplashScreen
Located in `lib/splash_screen.dart`

The initial screen shown when the app launches, displaying the app logo and branding for a few seconds before redirecting to the login screen.

### LoginScreen
Located in `lib/screens/login_screen.dart`

Allows users to log in with email and password, with options to remember login credentials and recover forgotten passwords.

### RegisterScreen
Located in `lib/screens/register_screen.dart`

Enables new users to create an account by providing personal information and setting up login credentials.

### ForgotPasswordScreen
Located in `lib/screens/forgot_password_screen.dart`

Provides functionality for users to reset their password via email.

## Main Navigation Screens

### HomeScreen
Located in `lib/screens/home_screen.dart`

The main landing page after login, featuring:
- Header with notification access
- Search bar
- Hero banner
- Category navigation
- Featured products section
- Trending products section
- Other product sections
- Company information

### CategoriesScreen
Located in `lib/screens/categories_screen.dart`

Displays all product categories with images, allowing users to browse products by category.

### CartScreen
Located in `lib/screens/cart_screen.dart`

Shows items added to the shopping cart, with options to:
- Adjust quantities
- Remove items
- View price summary
- Proceed to checkout

### ProfileScreen
Located in `lib/screens/profile_screen.dart`

Displays user profile information and provides access to:
- Personal information management
- Order history
- Payment methods
- Address management
- Communication preferences

### HelpScreen
Located in `lib/screens/help_screen.dart`

Provides customer support options including:
- FAQs
- Support tickets
- Live chat
- Contact information

## Product Screens

### ProductsScreen
Located in `lib/screens/products_screen.dart`

Displays a list of products with:
- Filter options
- Sort options
- Grid/list view toggle
- Pagination controls

### ProductDetailsScreen
Located in `lib/screens/product_details_screen.dart`

Shows detailed information about a specific product:
- Product images/gallery
- Name and description
- Price information
- Variation selection (size, color, etc.)
- Add to cart functionality
- Related products

### SearchScreen
Located in `lib/screens/search_screen.dart`

Dedicated screen for searching products with real-time results and filtering options.

## Deal and Promotion Screens

### DealOfTheDayScreen
Located in `lib/screens/deal_of_the_day_screen.dart`

Showcases special daily deals with:
- Featured deal products
- Limited-time offers
- Countdown timers for deal expiration
- Deal-specific pricing and discounts
- Easy add to cart functionality

### BundlesScreen
Located in `lib/screens/bundles_screen.dart`

Displays product bundles and package deals with:
- Bundle pricing
- Bundle contents
- Bundle images
- Add to cart functionality

## Checkout Process Screens

### CheckoutStep1
Located in `lib/screens/checkout_step1.dart`

First step of the checkout process, handling:
- Delivery address selection
- Shipping method selection

### CheckoutStep2
Located in `lib/screens/checkout_step2.dart`

Second step of the checkout process, handling:
- Payment method selection
- Order summary
- Final confirmation

### OrderSuccessScreen
Located in `lib/screens/order_success_screen.dart`

Confirmation screen shown after successful order placement.

## Special Features Screens

### GiftingScreen
Located in `lib/screens/gifting_screen.dart`

Showcases gifting options for plants and related products.

### RentalServicesScreen
Located in `lib/screens/rental_services_screen.dart`

Provides information and booking options for plant rental services.

### BlogsScreen & BlogDetailsScreen
Located in `lib/screens/blogs_screen.dart` and `lib/screens/blog_details_screen.dart`

Content marketing section with plant care tips and related articles.

## User Account Management Screens

### MyProfileScreen
Located in `lib/screens/my_profile_screen.dart`

Allows users to view and edit their personal information.

### MyAddressesScreen
Located in `lib/screens/my_addresses_screen.dart`

Manages delivery addresses for orders.

### PaymentMethodsScreen
Located in `lib/screens/payment_methods_screen.dart`

Manages saved payment methods.

### OrderDetailsScreen
Located in `lib/screens/order_details_screen.dart`

Shows detailed information about past orders.

## Support Screens

### SupportTicketScreen
Located in `lib/screens/support_ticket_screen.dart`

Lists user's support tickets and their status.

### CreateTicketScreen
Located in `lib/screens/create_ticket_screen.dart`

Allows users to create new support tickets.

### ChatWithUsScreen
Located in `lib/screens/chat_with_us.dart`

Provides a chat interface for direct customer support.

### FAQScreen
Located in `lib/screens/faq_screen.dart`

Displays frequently asked questions and answers. 
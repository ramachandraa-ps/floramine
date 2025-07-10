import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/header_widget.dart';
import '../widgets/search_bar.dart';
import '../widgets/home_screen/horizontal_product_card.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../models/category_model.dart';
import '../context/category_context.dart';
import '../widgets/category_tile.dart';
import '../providers/category_provider.dart';
import 'home_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';
import 'notification_screen.dart';
import 'plants_screen.dart';
import 'rental_services_screen.dart';
import 'bundles_screen.dart';
import 'subcategory_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    // Load categories when screen initializes if not already loaded
    Future.microtask(() => 
      Provider.of<CategoryProvider>(context, listen: false).loadCategories(forceRefresh: true)
    );
  }

  @override
  Widget build(BuildContext context) {
    // Fallback category data in case API fails
    final List<Map<String, dynamic>> fallbackCategories = [
      {
        'title': 'Plants',
        'imageUrl': 'assets/images/Categories/plants.png',
        'isRounded': true,
      },
      {
        'title': 'Gifting',
        'imageUrl': 'assets/images/Categories/gifting.png',
        'isRounded': true,
      },
      {
        'title': 'Rental Services',
        'imageUrl': 'assets/images/Categories/rental.png',
        'isRounded': true,
      },
      {
        'title': 'Bundles',
        'imageUrl': 'assets/images/Categories/bundles.png',
        'isRounded': true,
      },
      {
        'title': 'Pots',
        'imageUrl': 'assets/images/Categories/pots.png',
        'isRounded': true,
      },
      {
        'title': 'Soil & Fertilizers',
        'imageUrl': 'assets/images/Categories/soil.png',
        'isRounded': true,
      },
      {
        'title': 'Tools',
        'imageUrl': 'assets/images/Categories/tools.png',
        'isRounded': true,
      },
      {
        'title': 'Seeds',
        'imageUrl': 'assets/images/Categories/seeds.png',
        'isRounded': true,
      },
      {
        'title': 'Accessories',
        'imageUrl': 'assets/images/Categories/accessories.png',
        'isRounded': true,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFEEF6E6),
      body: SafeArea(
        child: Column(
          children: [
            // 1. Header
            HeaderWidget(
              onNotificationTap: () {
                NotificationScreen.navigateTo(context);
              },
              onProfileTap: () {
                // Navigate to profile screen
                Navigator.of(context).pushNamed('/profile');
              },
            ),
            
            // 2. Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: CustomSearchBar(
                onSearchIconTap: () {
                  Navigator.pushNamed(context, '/search');
                },
              ),
            ),
            
            // 3. Title with refresh button
            Consumer<CategoryProvider>(
              builder: (context, categoryProvider, child) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All Categories',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.refresh, color: Theme.of(context).primaryColor),
                        onPressed: () => categoryProvider.loadCategories(forceRefresh: true),
                        tooltip: 'Refresh categories',
                      ),
                    ],
                  ),
                );
              },
            ),
            
            // 4. Content Section - 3x3 Grid with API data
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Consumer<CategoryProvider>(
                  builder: (context, categoryProvider, child) {
                    if (categoryProvider.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (!categoryProvider.hasInternetConnection) {
                      // Show no internet connection message with fallback grid
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('No internet connection. Using offline data.'),
                            duration: Duration(seconds: 3),
                            action: SnackBarAction(
                              label: 'Retry',
                              onPressed: () => categoryProvider.loadCategories(forceRefresh: true),
                            ),
                          ),
                        );
                      });
                      return _buildFallbackGrid(context, fallbackCategories);
                    } else if (categoryProvider.error != null || !categoryProvider.hasData) {
                      // Show error message with fallback grid
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (categoryProvider.error != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error: ${categoryProvider.error}'),
                              duration: Duration(seconds: 3),
                              action: SnackBarAction(
                                label: 'Retry',
                                onPressed: () => categoryProvider.loadCategories(forceRefresh: true),
                              ),
                            ),
                          );
                        }
                      });
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Using offline data',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 8),
                          Expanded(child: _buildFallbackGrid(context, fallbackCategories)),
                        ],
                      );
                    } else {
                      // Show API data
                      return _buildCategoryGrid(context, categoryProvider.categories!);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentItem: NavigationItem.categories,
        onItemSelected: (item) {
          switch (item) {
            case NavigationItem.plants:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
              break;
            case NavigationItem.categories:
              // Already on Categories
              break;
            case NavigationItem.cart:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
              break;
            case NavigationItem.orders:
              Navigator.pushNamed(context, '/orders');
              break;
            case NavigationItem.help:
              Navigator.pushNamed(context, '/help');
              break;
          }
        },
      ),
    );
  }

  // Build grid with API data
  Widget _buildCategoryGrid(BuildContext context, List<Category> categories) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        childAspectRatio: 0.67,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        
        return CategoryTile(
          category: category,
          useCircularImage: true, // Use circular images for all categories
          onTap: () {
            // Check if the category has subcategories
            if (category.subCategories != null && category.subCategories!.isNotEmpty) {
              // Navigate to subcategory screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubcategoryScreen(
                    parentCategory: category,
                  ),
                ),
              );
            } else {
              // If no subcategories, use the previous navigation logic
              _navigateBasedOnCategory(context, category.name);
            }
          },
        );
      },
    );
  }

  // Build grid with fallback data
  Widget _buildFallbackGrid(BuildContext context, List<Map<String, dynamic>> categories) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        childAspectRatio: 0.67,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        // Create a temporary Category object from the fallback data
        final fallbackCategory = Category(
          id: index,
          name: categories[index]['title'],
          imageUrl: categories[index]['imageUrl'],
          isRounded: categories[index]['isRounded'],
        );
        
        // Use CategoryTile for consistency with circular images
        return CategoryTile(
          category: fallbackCategory,
          useAsset: true,
          useCircularImage: true, // Use circular images for fallback categories too
          onTap: () {
            _navigateBasedOnCategory(context, fallbackCategory.name);
          },
        );
      },
    );
  }

  // Helper method to navigate based on category name
  void _navigateBasedOnCategory(BuildContext context, String categoryName) {
    switch (categoryName) {
      case 'Plants':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PlantsScreen()),
        );
        break;
      case 'Gifting':
      case 'Gifts':
        Navigator.pushNamed(context, '/gifting');
        break;
      case 'Rental Services':
        Navigator.pushNamed(context, '/rental_services');
        break;
      case 'Bundles':
        Navigator.pushNamed(context, '/bundles');
        break;
      default:
        // Handle other category taps
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$categoryName category selected'),
            duration: const Duration(seconds: 1),
          ),
        );
        break;
    }
  }
}

import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/header_widget.dart';
import '../widgets/search_bar.dart';
import '../widgets/home_screen/horizontal_product_list.dart';
import '../widgets/home_screen/featured_products_section.dart';
import '../widgets/home_screen/trending_products_section.dart';
import '../widgets/home_screen/other_products_section.dart';
import '../widgets/home_screen/company_information.dart';
import 'plants_screen.dart';
import 'categories_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  final NavigationItem initialNavigationItem;
  
  const HomeScreen({
    Key? key,
    this.initialNavigationItem = NavigationItem.plants,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NavigationItem _currentItem;
  
  @override
  void initState() {
    super.initState();
    _currentItem = widget.initialNavigationItem;
  }

  @override
  Widget build(BuildContext context) {
    // If categories is selected, navigate to the categories screen
    if (_currentItem == NavigationItem.categories) {
      // Use Future.microtask to avoid build errors when navigating during build
      Future.microtask(() {
        CustomBottomNavigationBar.navigateTo(context, NavigationItem.categories);
      });
      return const SizedBox(); // Return empty widget while navigating
    }
    
    // If cart is selected, navigate to the cart screen
    if (_currentItem == NavigationItem.cart) {
      // Use Future.microtask to avoid build errors when navigating during build
      Future.microtask(() {
        CustomBottomNavigationBar.navigateTo(context, NavigationItem.cart);
      });
      return const SizedBox(); // Return empty widget while navigating
    }
    
    // If orders is selected
    if (_currentItem == NavigationItem.orders) {
      // Use Future.microtask to avoid build errors when navigating during build
      Future.microtask(() {
        CustomBottomNavigationBar.navigateTo(context, NavigationItem.orders);
      });
      return const SizedBox(); // Return empty widget while navigating
    }
    
    // If help is selected
    if (_currentItem == NavigationItem.help) {
      // Use Future.microtask to avoid build errors when navigating during build
      Future.microtask(() {
        CustomBottomNavigationBar.navigateTo(context, NavigationItem.help);
      });
      return const SizedBox(); // Return empty widget while navigating
    }

    return Scaffold(
      backgroundColor: const Color(0xFFEEF6E6),
      body: SafeArea(
        child: Column(
          children: [
            // Header widget
            HeaderWidget(
              onNotificationTap: () {
                // Handle notification tap
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Notifications tapped')),
                );
              },
              onProfileTap: () {
                // Handle profile tap
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profile tapped')),
                );
              },
            ),
            
            // Main content area with scroll
            Expanded(
              child: _buildPlantsScreen(),
            ),
            
            // Bottom navigation bar
            CustomBottomNavigationBar(
              currentItem: _currentItem,
              onItemSelected: (item) {
                if (item != _currentItem) {
                  CustomBottomNavigationBar.navigateTo(context, item);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlantsScreen() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search bar
                CustomSearchBar(
                  hintText: 'Indoor Plants',
                  onSearchIconTap: () {
                    // Handle search
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Search tapped')),
                    );
                  },
                ),
                
                const SizedBox(height: 16),
                
                // Hero banner
                Container(
                  height: 182,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/home_screen/hero.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Categories title
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                
                const SizedBox(height: 16),
              ],
            ),
          ),
          
          // Horizontal product list
          const HorizontalProductList(),
          
          const SizedBox(height: 16),
          
          // Featured products section
          const FeaturedProductsSection(),
          
          const SizedBox(height: 16),
          
          // Trending products section
          const TrendingProductsSection(),
          
          const SizedBox(height: 16),
          
          // Other products section
          const OtherProductsSection(),
          
          // Company information banner
          const CompanyInformation(),
          
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildPlaceholderScreen(String title, Color backgroundColor) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
} 
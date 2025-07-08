import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/header_widget.dart';
import '../widgets/search_bar.dart';
import '../widgets/home_screen/horizontal_product_list.dart';
import '../widgets/home_screen/featured_products_section.dart';
import '../widgets/home_screen/company_stats_banner.dart';
import 'plants_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NavigationItem _currentItem = NavigationItem.plants;

  @override
  Widget build(BuildContext context) {
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
              child: _buildCurrentScreen(),
            ),
            
            // Bottom navigation bar
            CustomBottomNavigationBar(
              currentItem: _currentItem,
              onItemSelected: (item) {
                setState(() {
                  _currentItem = item;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentScreen() {
    switch (_currentItem) {
      case NavigationItem.plants:
        return _buildPlantsScreen();
      case NavigationItem.categories:
        return _buildPlaceholderScreen('Categories Screen', const Color(0xFFCCE6F9));
      case NavigationItem.cart:
        return _buildPlaceholderScreen('Cart Screen', const Color(0xFFF9E8CC));
      case NavigationItem.orders:
        return _buildPlaceholderScreen('Orders Screen', const Color(0xFFE8CCF9));
      case NavigationItem.help:
        return _buildPlaceholderScreen('Help Screen', const Color(0xFFCCF9F3));
    }
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
          
          // Company stats banner
          const CompanyStatsBanner(),
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
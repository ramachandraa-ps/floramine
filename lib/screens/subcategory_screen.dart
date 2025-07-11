import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../widgets/header_widget.dart';
import '../widgets/category_tile.dart';
import '../widgets/bottom_navigation_bar.dart';
import 'home_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';
import 'notification_screen.dart';

class SubcategoryScreen extends StatelessWidget {
  final Category parentCategory;

  const SubcategoryScreen({
    Key? key,
    required this.parentCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF6E6),
      body: SafeArea(
        child: Column(
          children: [
            // 1. Header with back button
            _buildHeaderWithBackButton(context),
            
            // 2. Parent Category Card
            _buildParentCategoryCard(context),
            
            // 3. Title
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Subcategories',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            
            // 4. Content Section - Subcategories Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: _buildSubcategoriesGrid(context),
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

  // Build parent category card
  Widget _buildParentCategoryCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Category image
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              border: Border.all(
                color: Theme.of(context).primaryColor.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: _buildCategoryImage(context),
            ),
          ),
          const SizedBox(width: 20),
          
          // Category details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  parentCategory.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (parentCategory.subCategories != null)
                  Text(
                    '${parentCategory.subCategories!.length} Subcategories',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build the category image
  Widget _buildCategoryImage(BuildContext context) {
    if (parentCategory.imageUrl.startsWith('http')) {
      return Image.network(
        parentCategory.imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _buildPlaceholderIcon(context),
      );
    } else {
      return _buildPlaceholderIcon(context);
    }
  }

  // Placeholder icon for parent category
  Widget _buildPlaceholderIcon(BuildContext context) {
    IconData iconData;
    
    // Choose appropriate icon based on category name
    if (parentCategory.name.toLowerCase().contains('plant')) {
      iconData = Icons.spa;
    } else if (parentCategory.name.toLowerCase().contains('seed')) {
      iconData = Icons.grain;
    } else if (parentCategory.name.toLowerCase().contains('pot')) {
      iconData = Icons.crop_portrait;
    } else if (parentCategory.name.toLowerCase().contains('soil') || 
               parentCategory.name.toLowerCase().contains('fertil')) {
      iconData = Icons.landscape;
    } else if (parentCategory.name.toLowerCase().contains('accessories')) {
      iconData = Icons.category;
    } else if (parentCategory.name.toLowerCase().contains('pebbel') || 
               parentCategory.name.toLowerCase().contains('stone')) {
      iconData = Icons.circle;
    } else if (parentCategory.name.toLowerCase().contains('gift')) {
      iconData = Icons.card_giftcard;
    } else if (parentCategory.name.toLowerCase().contains('rental')) {
      iconData = Icons.home_work;
    } else {
      iconData = Icons.eco;
    }
    
    return Container(
      color: Colors.grey[100],
      child: Center(
        child: Icon(
          iconData,
          color: Theme.of(context).primaryColor,
          size: 40,
        ),
      ),
    );
  }

  // Custom header with back button
  Widget _buildHeaderWithBackButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Back button and logo section
          Row(
            children: [
              // Back button
              IconButton(
                icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
                onPressed: () => Navigator.pop(context),
              ),
              
              // Logo
              Container(
                height: 40,
                child: Image.asset(
                  'assets/images/floramine_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          
          // Notification and Profile section
          Row(
            children: [
              // Notification bell
              GestureDetector(
                onTap: () {
                  NotificationScreen.navigateTo(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/header/notification_bell.png',
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              
              // Profile icon
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/profile');
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF54A801),
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/header/user.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Build subcategories grid
  Widget _buildSubcategoriesGrid(BuildContext context) {
    // If no subcategories, show a message
    if (parentCategory.subCategories == null || parentCategory.subCategories!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.category_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
            SizedBox(height: 16),
            Text(
              'No subcategories available',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    // Show subcategories in a grid
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        childAspectRatio: 0.67, // Adjusted for the card's fixed height
      ),
      itemCount: parentCategory.subCategories!.length,
      itemBuilder: (context, index) {
        final subcategory = parentCategory.subCategories![index];
        
        return CategoryTile(
          category: subcategory,
          useCircularImage: true, // Using circular images for consistency
          onTap: () {
            // Navigate to products screen with subcategory filter
            Navigator.pushNamed(
              context,
              '/products',
              arguments: {
                'subCategory': subcategory.name.toLowerCase().replaceAll(' ', '-'),
                'category': parentCategory.name,
              },
            );
          },
        );
      },
    );
  }
} 
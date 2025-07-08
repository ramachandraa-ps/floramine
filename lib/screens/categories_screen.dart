import 'package:flutter/material.dart';
import '../widgets/header_widget.dart';
import '../widgets/search_bar.dart';
import '../widgets/home_screen/horizontal_product_card.dart';
import '../widgets/bottom_navigation_bar.dart';
import 'home_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Category data
    final List<Map<String, dynamic>> categories = [
      {
        'title': 'Plants',
        'imageUrl': 'assets/images/categories/plants.png',
        'isRounded': false,
      },
      {
        'title': 'Premium Seeds',
        'imageUrl': 'assets/images/categories/seeds.png',
        'isRounded': false,
      },
      {
        'title': 'Pots & Planters',
        'imageUrl': 'assets/images/categories/pots.png',
        'isRounded': false,
      },
      {
        'title': 'Soil & Fertilizers',
        'imageUrl': 'assets/images/categories/soil.png',
        'isRounded': false,
      },
      {
        'title': 'Accessories',
        'imageUrl': 'assets/images/categories/accessories.png',
        'isRounded': false,
      },
      {
        'title': 'Pebbles',
        'imageUrl': 'assets/images/categories/pebbles.png',
        'isRounded': true,
      },
      {
        'title': 'Gifting',
        'imageUrl': 'assets/images/categories/gifting.png',
        'isRounded': false,
      },
      {
        'title': 'Rental Services',
        'imageUrl': 'assets/images/categories/rental.png',
        'isRounded': true,
      },
      {
        'title': 'Bundles',
        'imageUrl': 'assets/images/categories/bundles.png',
        'isRounded': true,
      },
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.50, -0.00),
            end: Alignment(0.50, 1.00),
            colors: [Color(0x3354A801), Colors.white],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // 1. Header Widget
              HeaderWidget(
                onNotificationTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Notifications tapped')),
                  );
                },
                onProfileTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profile tapped')),
                  );
                },
              ),
              
              // 2. Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: CustomSearchBar(
                  hintText: 'Indoor Plants',
                  onSearchIconTap: () {
                    // Handle search
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Search tapped')),
                    );
                  },
                ),
              ),
              
              // 3. Title
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'All Categories',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              
              // 4. Content Section - 3x3 Grid
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return HorizontalProductCard(
                        title: categories[index]['title'],
                        imageUrl: categories[index]['imageUrl'],
                        isRounded: categories[index]['isRounded'],
                        onTap: () {
                          // Handle category tap
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${categories[index]['title']} category selected'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              
              // 5. Bottom Navigation Bar
              CustomBottomNavigationBar(
                currentItem: NavigationItem.categories,
                onItemSelected: (item) {
                  // Handle navigation to other screens
                  if (item != NavigationItem.categories) {
                    // Navigate to HomeScreen with the selected item
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

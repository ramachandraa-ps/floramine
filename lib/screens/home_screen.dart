import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/header_widget.dart';
import '../widgets/search_bar.dart';
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
      child: Padding(
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
            
            const SizedBox(height: 20),
            
            // Featured plants title
            const Text(
              'Featured Plants',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Plant products grid
            _buildPlantProductsGrid(),
          ],
        ),
      ),
    );
  }
  
  Widget _buildPlantProductsGrid() {
    List<Map<String, dynamic>> plantProducts = [
      {
        'imageAsset': 'assets/images/jasminum_sambac.png',
        'name': 'Jasminum sambac, Mogra, Arabian Jasmine - Plant',
        'currentPrice': 299.0,
        'originalPrice': 350.0,
        'discountPercentage': 15.0,
        'isAirPurifying': true,
        'isPerfectGift': true,
        'isFavorite': false,
      },
      {
        'imageAsset': 'assets/images/jasminum_sambac.png',
        'name': 'Money Plant Golden, Pothos, Epipremnum Aureum - Plant',
        'currentPrice': 249.0,
        'originalPrice': 299.0,
        'discountPercentage': 17.0,
        'isAirPurifying': true,
        'isPerfectGift': false,
        'isFavorite': true,
      },
    ];
    
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.55,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: plantProducts.length,
      itemBuilder: (context, index) {
        return PlantCard(product: plantProducts[index]);
      },
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

class PlantCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const PlantCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with discount badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  product['imageAsset'],
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              
              // Discount badge
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: const BoxDecoration(
                    color: Color(0xFF54A801),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                  child: Text(
                    'Save ${product['discountPercentage'].toInt()}%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              
              // Favorite button
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    product['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                    color: product['isFavorite'] ? Colors.red : Colors.grey,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          
          // Product details
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  product['name'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                
                const SizedBox(height: 4),
                
                // Price
                Row(
                  children: [
                    Text(
                      '₹${product['currentPrice'].toInt()}',
                      style: const TextStyle(
                        color: Color(0xFF316300),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '₹${product['originalPrice'].toInt()}',
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 4),
                
                // Action buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF316300),
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 
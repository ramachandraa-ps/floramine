import 'package:flutter/material.dart';
import '../widgets/search_bar.dart';
import '../widgets/plant_product_card.dart';
import '../widgets/filter_widget.dart';

class PlantsScreen extends StatefulWidget {
  const PlantsScreen({Key? key}) : super(key: key);

  @override
  _PlantsScreenState createState() => _PlantsScreenState();
}

class _PlantsScreenState extends State<PlantsScreen> {
  // Sample plant product data
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
      'name': 'Miniature Rose, Button Rose (Any Color) - Plant',
      'currentPrice': 299.0,
      'originalPrice': 350.0,
      'discountPercentage': 15.0,
      'isAirPurifying': true,
      'isPerfectGift': true,
      'isFavorite': true,
    },
    {
      'imageAsset': 'assets/images/jasminum_sambac.png',
      'name': 'Money Plant Golden, Pothos, Epipremnum Aureum - Plant',
      'currentPrice': 249.0,
      'originalPrice': 299.0,
      'discountPercentage': 17.0,
      'isAirPurifying': true,
      'isPerfectGift': false,
      'isFavorite': false,
    },
    {
      'imageAsset': 'assets/images/jasminum_sambac.png',
      'name': 'Syngonium Pink, Arrowhead Plant - Plant',
      'currentPrice': 349.0,
      'originalPrice': 399.0,
      'discountPercentage': 12.0,
      'isAirPurifying': true,
      'isPerfectGift': true,
      'isFavorite': false,
    },
  ];

  // New section plant product data
  List<Map<String, dynamic>> trendingPlants = [
    {
      'imageAsset': 'assets/images/jasminum_sambac.png',
      'name': 'Jade Plant, Money Plant, Crassula Ovata - Plant',
      'currentPrice': 399.0,
      'originalPrice': 450.0,
      'discountPercentage': 11.0,
      'isAirPurifying': true,
      'isPerfectGift': true,
      'isFavorite': false,
    },
    {
      'imageAsset': 'assets/images/jasminum_sambac.png',
      'name': 'Peace Lily, Spathiphyllum - Plant',
      'currentPrice': 349.0,
      'originalPrice': 399.0,
      'discountPercentage': 12.0,
      'isAirPurifying': true,
      'isPerfectGift': false,
      'isFavorite': true,
    },
    {
      'imageAsset': 'assets/images/jasminum_sambac.png',
      'name': 'Snake Plant, Sansevieria Trifasciata - Plant',
      'currentPrice': 299.0,
      'originalPrice': 350.0,
      'discountPercentage': 15.0,
      'isAirPurifying': true,
      'isPerfectGift': true,
      'isFavorite': false,
    },
    {
      'imageAsset': 'assets/images/jasminum_sambac.png',
      'name': 'Aloe Vera - Plant',
      'currentPrice': 199.0,
      'originalPrice': 250.0,
      'discountPercentage': 20.0,
      'isAirPurifying': false,
      'isPerfectGift': true,
      'isFavorite': false,
    },
  ];

  // Added state variable for filter overlay
  bool _showFilterOverlay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // 1. Header Section with gradient background
              Container(
                width: double.infinity,
                height: 110,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, 0.50),
                    end: Alignment(1.00, 0.50),
                    colors: [Color(0xFF54A801), Color(0xFF214200)],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back button and title
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      width: 1,
                                      color: Color(0xFFE4E4E4),
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Color(0xFF54A801),
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            const Text(
                              'Plants',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Cabin',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        
                        // Cart icon with badge
                        Stack(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                                size: 24,
                              ),
                              onPressed: () {
                                // Show cart notification
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Cart tapped')),
                                );
                              },
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                width: 18,
                                height: 18,
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF54A801),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.white, width: 1.5),
                                ),
                                child: const Center(
                                  child: Text(
                                    '0',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              // 2. Search Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomSearchBar(
                  hintText: 'Indoor Plants',
                  onSearchIconTap: () {
                    // Handle search
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Searching for plants...')),
                    );
                  },
                ),
              ),
              
              // 3. Scrollable content area (everything after search bar)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Plant Categories Horizontal List
                      Container(
                        height: 120,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          children: [
                            _buildCategoryItem('Indoor Plants', 'assets/images/categories/plants.png', false),
                            _buildCategoryItem('Outdoor Plants', 'assets/images/categories/plants.png', true),
                            _buildCategoryItem('Fruit Trees', 'assets/images/categories/plants.png', true),
                            _buildCategoryItem('Herbs', 'assets/images/categories/plants.png', true),
                            _buildCategoryItem('Holy', 'assets/images/categories/plants.png', true),
                          ],
                        ),
                      ),
                      
                      // Filter and Sort buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Filter button
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showFilterOverlay = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(width: 1, color: Colors.black.withOpacity(0.3)),
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Filter',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Icon(Icons.keyboard_arrow_down, size: 18),
                                  ],
                                ),
                              ),
                            ),
                            
                            // Sort By button
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1, color: Colors.black.withOpacity(0.3)),
                                  borderRadius: BorderRadius.circular(26),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Sort By',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(Icons.keyboard_arrow_down, size: 18),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Featured Plants Section Title
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 5.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Featured Plants',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Cabin',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      
                      // Plant Products Grid (2x2)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.52,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 24,
                          ),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: plantProducts.length,
                          itemBuilder: (context, index) {
                            final product = plantProducts[index];
                            return PlantProductCard(
                              imageAsset: product['imageAsset'],
                              name: product['name'],
                              currentPrice: product['currentPrice'],
                              originalPrice: product['originalPrice'],
                              discountPercentage: product['discountPercentage'],
                              isAirPurifying: product['isAirPurifying'],
                              isPerfectGift: product['isPerfectGift'],
                              isFavorite: product['isFavorite'],
                              onFavoritePressed: () {
                                setState(() {
                                  product['isFavorite'] = !product['isFavorite'];
                                });
                              },
                              onBuyNowPressed: () {
                                // Handle buy now
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Buy Now: ${product['name']}')),
                                );
                              },
                              onAddToCartPressed: () {
                                // Handle add to cart
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Added to cart: ${product['name']}')),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      
                      // New Section: Trending Plants Title
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0, bottom: 5.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Trending Plants',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Cabin',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      
                      // New Section: Trending Plants Grid (2x2)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.52,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 24,
                          ),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: trendingPlants.length,
                          itemBuilder: (context, index) {
                            final product = trendingPlants[index];
                            return PlantProductCard(
                              imageAsset: product['imageAsset'],
                              name: product['name'],
                              currentPrice: product['currentPrice'],
                              originalPrice: product['originalPrice'],
                              discountPercentage: product['discountPercentage'],
                              isAirPurifying: product['isAirPurifying'],
                              isPerfectGift: product['isPerfectGift'],
                              isFavorite: product['isFavorite'],
                              onFavoritePressed: () {
                                setState(() {
                                  product['isFavorite'] = !product['isFavorite'];
                                });
                              },
                              onBuyNowPressed: () {
                                // Handle buy now
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Buy Now: ${product['name']}')),
                                );
                              },
                              onAddToCartPressed: () {
                                // Handle add to cart
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Added to cart: ${product['name']}')),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      
                      // Add some padding at the bottom
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          // Filter overlay
          FilterWidget(
            showOverlay: _showFilterOverlay,
            onClose: () {
              setState(() {
                _showFilterOverlay = false;
              });
            },
            onApplyFilters: (filterValues) {
              // Apply filters to the products
              // This is where you would filter your product list based on selected filters
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Filters applied')),
              );
            },
            onClearFilters: () {
              // Clear all filters
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Filters cleared')),
              );
            },
          ),
        ],
      ),
    );
  }
  
  // Helper method to build category items
  Widget _buildCategoryItem(String title, String imageUrl, bool isRounded) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: isRounded ? BorderRadius.circular(100) : BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 36,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
} 
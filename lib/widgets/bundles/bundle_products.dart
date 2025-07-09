import 'package:flutter/material.dart';
import 'bundle_product_card.dart';

class BundleProducts extends StatefulWidget {
  const BundleProducts({Key? key}) : super(key: key);

  @override
  State<BundleProducts> createState() => _BundleProductsState();
}

class _BundleProductsState extends State<BundleProducts> {
  int currentPage = 1;
  final int totalPages = 7;
  
  // Sample bundle data
  final List<Map<String, dynamic>> bundleProducts = [
    {
      'title': 'Jasminum sambac, Mogra, Arabian Jasmine - Plant With Pot',
      'imageUrl': 'assets/images/jasminum_sambac.png',
      'currentPrice': '₹299',
      'originalPrice': '₹350',
      'tags': ['Air Purifying', 'Perfect Gift'],
      'hasDiscount': true,
      'discountText': 'Save upto 15%'
    },
    {
      'title': 'Miniature Rose, Button Rose (Any Color) - Plant With Pot',
      'imageUrl': 'assets/images/cart/miniature_rose.png',
      'currentPrice': '₹299',
      'originalPrice': '₹350',
      'tags': ['Air Purifying', 'Perfect Gift'],
      'hasDiscount': true,
      'discountText': 'Save upto 15%'
    },
    {
      'title': 'Peace Lily, Spathiphyllum - Plant With Pot',
      'imageUrl': 'assets/images/rental_services/peace_lilly.png',
      'currentPrice': '₹399',
      'originalPrice': '₹450',
      'tags': ['Air Purifying', 'Low Maintenance'],
      'hasDiscount': true,
      'discountText': 'Save upto 10%'
    },
    {
      'title': 'Money Plant Golden, Devil\'s Ivy - Plant With Pot',
      'imageUrl': 'assets/images/plant1.jpg',
      'currentPrice': '₹249',
      'originalPrice': '₹299',
      'tags': ['Air Purifying', 'Indoor Plant'],
      'hasDiscount': true,
      'discountText': 'Save upto 15%'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bundle Products',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          
          // Filter and Sort buttons
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Filter button
                OutlinedButton.icon(
                  onPressed: () {
                    // Show filter options
                    print('Filter button pressed');
                  },
                  icon: const Icon(Icons.filter_list, size: 18),
                  label: const Text('Filter'),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  ),
                ),
                
                // Sort By button
                OutlinedButton.icon(
                  onPressed: () {
                    // Show sort options
                    print('Sort button pressed');
                  },
                  icon: const Icon(Icons.sort, size: 18),
                  label: const Text('Sort By'),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  ),
                ),
              ],
            ),
          ),
          
          // Product grid with improved spacing
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 15,
              mainAxisSpacing: 25,
            ),
            itemCount: bundleProducts.length,
            itemBuilder: (context, index) {
              final product = bundleProducts[index];
              return BundleProductCard(
                title: product['title'],
                imageUrl: product['imageUrl'],
                currentPrice: product['currentPrice'],
                originalPrice: product['originalPrice'],
                tags: List<String>.from(product['tags']),
                hasDiscount: product['hasDiscount'],
                discountText: product['discountText'],
              );
            },
          ),
          
          // Pagination controls with more spacing
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Previous page button
                IconButton(
                  onPressed: currentPage > 1 
                      ? () {
                          setState(() {
                            currentPage--;
                          });
                        } 
                      : null,
                  icon: const Icon(Icons.chevron_left),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.1),
                    shape: const CircleBorder(),
                    disabledBackgroundColor: Colors.black.withOpacity(0.05),
                  ),
                ),
                
                // Page numbers
                Row(
                  children: List.generate(totalPages, (index) {
                    final pageNumber = index + 1;
                    final isCurrentPage = pageNumber == currentPage;
                    
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentPage = pageNumber;
                        });
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: isCurrentPage ? const Color(0xFF54A801) : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            '$pageNumber',
                            style: TextStyle(
                              color: isCurrentPage ? Colors.white : Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                
                // Next page button
                IconButton(
                  onPressed: currentPage < totalPages 
                      ? () {
                          setState(() {
                            currentPage++;
                          });
                        } 
                      : null,
                  icon: const Icon(Icons.chevron_right),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.1),
                    shape: const CircleBorder(),
                    disabledBackgroundColor: Colors.black.withOpacity(0.05),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 
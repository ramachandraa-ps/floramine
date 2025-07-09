import 'package:flutter/material.dart';
import './bundle_product_card.dart';
import './pagination_slider.dart';

class BundleProductGrid extends StatefulWidget {
  const BundleProductGrid({Key? key}) : super(key: key);

  @override
  State<BundleProductGrid> createState() => _BundleProductGridState();
}

class _BundleProductGridState extends State<BundleProductGrid> {
  int currentPage = 1;
  final int totalPages = 7;

  @override
  Widget build(BuildContext context) {
    // Sample bundle product data
    final List<Map<String, dynamic>> bundleProducts = [
      {
        'title': 'Jasminum sambac, Mogra, Arabian Jasmine - Plant With Pot',
        'imageUrl': 'assets/images/jasminum_sambac.png',
        'currentPrice': '₹299',
        'originalPrice': '₹350',
        'tags': ['Air Purifying', 'Perfect Gift'],
        'hasDiscount': true,
        'discountText': 'Save upto 15%',
      },
      {
        'title': 'Miniature Rose, Button Rose (Any Color) - Plant With Pot',
        'imageUrl': 'assets/images/cart/miniature_rose.png',
        'currentPrice': '₹299',
        'originalPrice': '₹350',
        'tags': ['Air Purifying', 'Perfect Gift'],
        'hasDiscount': true,
        'discountText': 'Save upto 15%',
      },
      {
        'title': 'Peace Lily, Spathiphyllum - Plant With Pot',
        'imageUrl': 'assets/images/rental_services/peace_lilly.png',
        'currentPrice': '₹399',
        'originalPrice': '₹450',
        'tags': ['Air Purifying', 'Low Maintenance'],
        'hasDiscount': true,
        'discountText': 'Save upto 10%',
      },
      {
        'title': 'Money Plant Golden, Devil\'s Ivy - Plant With Pot',
        'imageUrl': 'assets/images/plant1.jpg',
        'currentPrice': '₹249',
        'originalPrice': '₹299',
        'tags': ['Air Purifying', 'Indoor Plant'],
        'hasDiscount': true,
        'discountText': 'Save upto 15%',
      },
    ];

    return Column(
      children: [
        // Filter and Sort options
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Filter button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                    SizedBox(width: 5),
                    Icon(Icons.filter_list, size: 16),
                  ],
                ),
              ),
              
              // Sort by button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                    SizedBox(width: 5),
                    Icon(Icons.arrow_drop_down, size: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        // Product grid
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: [
                  for (var i = 0; i < bundleProducts.length; i += 2)
                    SizedBox(
                      width: constraints.maxWidth,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // First product in row
                          Expanded(
                            child: BundleProductCard(
                              title: bundleProducts[i]['title'],
                              imageUrl: bundleProducts[i]['imageUrl'],
                              currentPrice: bundleProducts[i]['currentPrice'],
                              originalPrice: bundleProducts[i]['originalPrice'],
                              tags: List<String>.from(bundleProducts[i]['tags']),
                              hasDiscount: bundleProducts[i]['hasDiscount'],
                              discountText: bundleProducts[i]['discountText'],
                              onTap: () {
                                Navigator.pushNamed(context, '/product_details');
                              },
                            ),
                          ),
                          SizedBox(width: 10), // Reduced spacing between cards
                          
                          // Second product in row (if available)
                          if (i + 1 < bundleProducts.length)
                            Expanded(
                              child: BundleProductCard(
                                title: bundleProducts[i + 1]['title'],
                                imageUrl: bundleProducts[i + 1]['imageUrl'],
                                currentPrice: bundleProducts[i + 1]['currentPrice'],
                                originalPrice: bundleProducts[i + 1]['originalPrice'],
                                tags: List<String>.from(bundleProducts[i + 1]['tags']),
                                hasDiscount: bundleProducts[i + 1]['hasDiscount'],
                                discountText: bundleProducts[i + 1]['discountText'],
                                onTap: () {
                                  Navigator.pushNamed(context, '/product_details');
                                },
                              ),
                            )
                          else
                            Expanded(child: SizedBox()), // Empty space if odd number of products
                        ],
                      ),
                    ),
                ],
              );
            }
          ),
        ),
        
        // Pagination slider
        Center(
          child: PaginationSlider(
            currentPage: currentPage,
            totalPages: totalPages,
            onPageChanged: (page) {
              setState(() {
                currentPage = page;
              });
              // In a real app, you would load products for the selected page here
              print('Navigated to page: $page');
            },
          ),
        ),
      ],
    );
  }
} 
import 'package:flutter/material.dart';
import './gift_product_card.dart';
import './pagination_slider.dart';

class GiftProductGrid extends StatefulWidget {
  const GiftProductGrid({Key? key}) : super(key: key);

  @override
  State<GiftProductGrid> createState() => _GiftProductGridState();
}

class _GiftProductGridState extends State<GiftProductGrid> {
  int currentPage = 1;
  final int totalPages = 7;

  @override
  Widget build(BuildContext context) {
    // Sample gift product data
    final List<Map<String, dynamic>> giftProducts = [
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
        'title': 'Peace Lily, Spathiphyllum - Air Purifying Plant With Pot',
        'imageUrl': 'assets/images/plants/plant_3.png',
        'currentPrice': '₹349',
        'originalPrice': '₹400',
        'tags': ['Air Purifying', 'Perfect Gift'],
        'hasDiscount': true,
        'discountText': 'Save upto 12%',
      },
      {
        'title': 'Snake Plant, Mother-in-law\'s Tongue - Plant With Pot',
        'imageUrl': 'assets/images/plants/plant_4.png',
        'currentPrice': '₹399',
        'originalPrice': '₹450',
        'tags': ['Air Purifying', 'Low Maintenance'],
        'hasDiscount': true,
        'discountText': 'Save upto 10%',
      },
      {
        'title': 'Jade Plant (Crassula ovata) - Plant With Decorative Pot',
        'imageUrl': 'assets/images/plants/plant_1.png',
        'currentPrice': '₹349',
        'originalPrice': '₹399',
        'tags': ['Low Maintenance', 'Perfect Gift'],
        'hasDiscount': true,
        'discountText': 'Save upto 12%',
      },
      {
        'title': 'Money Plant Golden - Plant With Hanging Pot',
        'imageUrl': 'assets/images/plants/plant_2.png',
        'currentPrice': '₹249',
        'originalPrice': '₹299',
        'tags': ['Air Purifying', 'Indoor Plant'],
        'hasDiscount': true,
        'discountText': 'Save upto 16%',
      },
      {
        'title': 'Bonsai Ficus - Decorative Indoor Plant',
        'imageUrl': 'assets/images/jasminum_sambac.png',
        'currentPrice': '₹499',
        'originalPrice': '₹599',
        'tags': ['Decorative', 'Perfect Gift'],
        'hasDiscount': true,
        'discountText': 'Save upto 16%',
      },
      {
        'title': 'Aloe Vera - Medicinal Plant With Ceramic Pot',
        'imageUrl': 'assets/images/cart/miniature_rose.png',
        'currentPrice': '₹249',
        'originalPrice': '₹299',
        'tags': ['Medicinal', 'Low Maintenance'],
        'hasDiscount': true,
        'discountText': 'Save upto 16%',
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
          child: Column(
            children: [
              // First row (products 0-1)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First product
                  Expanded(
                    child: GiftProductCard(
                      title: giftProducts[0]['title'],
                      imageUrl: giftProducts[0]['imageUrl'],
                      currentPrice: giftProducts[0]['currentPrice'],
                      originalPrice: giftProducts[0]['originalPrice'],
                      tags: List<String>.from(giftProducts[0]['tags']),
                      hasDiscount: giftProducts[0]['hasDiscount'],
                      discountText: giftProducts[0]['discountText'],
                      onTap: () {
                        Navigator.pushNamed(context, '/product_details');
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  
                  // Second product
                  Expanded(
                    child: GiftProductCard(
                      title: giftProducts[1]['title'],
                      imageUrl: giftProducts[1]['imageUrl'],
                      currentPrice: giftProducts[1]['currentPrice'],
                      originalPrice: giftProducts[1]['originalPrice'],
                      tags: List<String>.from(giftProducts[1]['tags']),
                      hasDiscount: giftProducts[1]['hasDiscount'],
                      discountText: giftProducts[1]['discountText'],
                      onTap: () {
                        Navigator.pushNamed(context, '/product_details');
                      },
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 20),
              
              // Second row (products 2-3)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Third product
                  Expanded(
                    child: GiftProductCard(
                      title: giftProducts[2]['title'],
                      imageUrl: giftProducts[2]['imageUrl'],
                      currentPrice: giftProducts[2]['currentPrice'],
                      originalPrice: giftProducts[2]['originalPrice'],
                      tags: List<String>.from(giftProducts[2]['tags']),
                      hasDiscount: giftProducts[2]['hasDiscount'],
                      discountText: giftProducts[2]['discountText'],
                      onTap: () {
                        Navigator.pushNamed(context, '/product_details');
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  
                  // Fourth product
                  Expanded(
                    child: GiftProductCard(
                      title: giftProducts[3]['title'],
                      imageUrl: giftProducts[3]['imageUrl'],
                      currentPrice: giftProducts[3]['currentPrice'],
                      originalPrice: giftProducts[3]['originalPrice'],
                      tags: List<String>.from(giftProducts[3]['tags']),
                      hasDiscount: giftProducts[3]['hasDiscount'],
                      discountText: giftProducts[3]['discountText'],
                      onTap: () {
                        Navigator.pushNamed(context, '/product_details');
                      },
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 20),
              
              // Third row (products 4-5)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Fifth product
                  Expanded(
                    child: GiftProductCard(
                      title: giftProducts[4]['title'],
                      imageUrl: giftProducts[4]['imageUrl'],
                      currentPrice: giftProducts[4]['currentPrice'],
                      originalPrice: giftProducts[4]['originalPrice'],
                      tags: List<String>.from(giftProducts[4]['tags']),
                      hasDiscount: giftProducts[4]['hasDiscount'],
                      discountText: giftProducts[4]['discountText'],
                      onTap: () {
                        Navigator.pushNamed(context, '/product_details');
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  
                  // Sixth product
                  Expanded(
                    child: GiftProductCard(
                      title: giftProducts[5]['title'],
                      imageUrl: giftProducts[5]['imageUrl'],
                      currentPrice: giftProducts[5]['currentPrice'],
                      originalPrice: giftProducts[5]['originalPrice'],
                      tags: List<String>.from(giftProducts[5]['tags']),
                      hasDiscount: giftProducts[5]['hasDiscount'],
                      discountText: giftProducts[5]['discountText'],
                      onTap: () {
                        Navigator.pushNamed(context, '/product_details');
                      },
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 20),
              
              // Fourth row (products 6-7)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Seventh product
                  Expanded(
                    child: GiftProductCard(
                      title: giftProducts[6]['title'],
                      imageUrl: giftProducts[6]['imageUrl'],
                      currentPrice: giftProducts[6]['currentPrice'],
                      originalPrice: giftProducts[6]['originalPrice'],
                      tags: List<String>.from(giftProducts[6]['tags']),
                      hasDiscount: giftProducts[6]['hasDiscount'],
                      discountText: giftProducts[6]['discountText'],
                      onTap: () {
                        Navigator.pushNamed(context, '/product_details');
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  
                  // Eighth product
                  Expanded(
                    child: GiftProductCard(
                      title: giftProducts[7]['title'],
                      imageUrl: giftProducts[7]['imageUrl'],
                      currentPrice: giftProducts[7]['currentPrice'],
                      originalPrice: giftProducts[7]['originalPrice'],
                      tags: List<String>.from(giftProducts[7]['tags']),
                      hasDiscount: giftProducts[7]['hasDiscount'],
                      discountText: giftProducts[7]['discountText'],
                      onTap: () {
                        Navigator.pushNamed(context, '/product_details');
                      },
                    ),
                  ),
                ],
              ),
            ],
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
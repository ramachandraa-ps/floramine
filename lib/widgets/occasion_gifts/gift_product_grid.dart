import 'package:flutter/material.dart';

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
    // Sample product data for the grid
    final List<Map<String, dynamic>> products = [
      {
        'imageUrl': 'assets/images/plants/jasmine.png',
        'title': 'Jasminum sambac, Mogra, Arabian Jasmine - Plant With Pot',
        'price': '299',
        'originalPrice': '350',
      },
      {
        'imageUrl': 'assets/images/plants/rose.png',
        'title': 'Miniature Rose, Button Rose (Any Color) - Plant With Pot',
        'price': '299',
        'originalPrice': '350',
      },
      {
        'imageUrl': 'assets/images/plants/plant_1.png',
        'title': 'Jade Plant (Crassula ovata) - Plant With Decorative Pot',
        'price': '299',
        'originalPrice': '350',
      },
      {
        'imageUrl': 'assets/images/plants/plant_2.png',
        'title': 'Money Plant Golden - Plant With Hanging Pot',
        'price': '299',
        'originalPrice': '350',
      },
      {
        'imageUrl': 'assets/images/plants/plant_3.png',
        'title': 'Peace Lily (Spathiphyllum) - Air Purifying Plant',
        'price': '299',
        'originalPrice': '350',
      },
      {
        'imageUrl': 'assets/images/plants/plant_4.png',
        'title': 'Lucky Bamboo Arrangement - Feng Shui Plant',
        'price': '299',
        'originalPrice': '350',
      },
      {
        'imageUrl': 'assets/images/plants/jasmine.png',
        'title': 'Bonsai Ficus - Decorative Indoor Plant',
        'price': '499',
        'originalPrice': '599',
      },
      {
        'imageUrl': 'assets/images/plants/rose.png',
        'title': 'Aloe Vera - Medicinal Plant With Ceramic Pot',
        'price': '249',
        'originalPrice': '299',
      },
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // First row of products (0-1)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ProductCard(
                      imageUrl: products[0]['imageUrl'],
                      title: products[0]['title'],
                      price: products[0]['price'],
                      originalPrice: products[0]['originalPrice'],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ProductCard(
                      imageUrl: products[1]['imageUrl'],
                      title: products[1]['title'],
                      price: products[1]['price'],
                      originalPrice: products[1]['originalPrice'],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              
              // Second row of products (2-3)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ProductCard(
                      imageUrl: products[2]['imageUrl'],
                      title: products[2]['title'],
                      price: products[2]['price'],
                      originalPrice: products[2]['originalPrice'],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ProductCard(
                      imageUrl: products[3]['imageUrl'],
                      title: products[3]['title'],
                      price: products[3]['price'],
                      originalPrice: products[3]['originalPrice'],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              
              // Third row of products (4-5)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ProductCard(
                      imageUrl: products[4]['imageUrl'],
                      title: products[4]['title'],
                      price: products[4]['price'],
                      originalPrice: products[4]['originalPrice'],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ProductCard(
                      imageUrl: products[5]['imageUrl'],
                      title: products[5]['title'],
                      price: products[5]['price'],
                      originalPrice: products[5]['originalPrice'],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              
              // Fourth row of products (6-7)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ProductCard(
                      imageUrl: products[6]['imageUrl'],
                      title: products[6]['title'],
                      price: products[6]['price'],
                      originalPrice: products[6]['originalPrice'],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ProductCard(
                      imageUrl: products[7]['imageUrl'],
                      title: products[7]['title'],
                      price: products[7]['price'],
                      originalPrice: products[7]['originalPrice'],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        // Pagination slider
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Previous page button
                  GestureDetector(
                    onTap: currentPage > 1 
                        ? () => setState(() => currentPage -= 1)
                        : null,
                    child: Container(
                      width: 24,
                      height: 24,
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
                      decoration: ShapeDecoration(
                        color: Colors.black.withOpacity(0.10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Icon(
                        Icons.chevron_left,
                        size: 12,
                        color: currentPage > 1 ? Colors.black : Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: 6),
                  
                  // Page numbers
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _buildPageNumbers(),
                    ),
                  ),
                  
                  const SizedBox(width: 6),
                  
                  // Next page button
                  GestureDetector(
                    onTap: currentPage < totalPages 
                        ? () => setState(() => currentPage += 1)
                        : null,
                    child: Container(
                      width: 24,
                      height: 24,
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
                      decoration: ShapeDecoration(
                        color: Colors.black.withOpacity(0.10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Icon(
                        Icons.chevron_right,
                        size: 12,
                        color: currentPage < totalPages ? Colors.black : Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  List<Widget> _buildPageNumbers() {
    List<Widget> pageNumbers = [];
    
    for (int i = 1; i <= totalPages; i++) {
      if (i == currentPage) {
        // Current page (highlighted)
        pageNumbers.add(
          Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
            decoration: ShapeDecoration(
              color: const Color(0xFF54A801),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Center(
              child: Text(
                '$i',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      } else {
        // Other pages
        pageNumbers.add(
          GestureDetector(
            onTap: () => setState(() => currentPage = i),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: SizedBox(
                width: 14,
                child: Text(
                  '$i',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }
    
    return pageNumbers;
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String originalPrice;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.originalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product image with save tag
        Stack(
          children: [
            Container(
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.grey[600],
                        size: 50,
                      ),
                    );
                  },
                ),
              ),
            ),
            
            // Save tag
            Positioned(
              right: 6,
              top: 6,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.favorite_border,
                  size: 14,
                  color: Colors.black54,
                ),
              ),
            ),
            
            // Discount tag
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 20,
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                decoration: const BoxDecoration(
                  color: Color(0xFF54A801),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: const Text(
                  'Save upto 15%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 10),
        
        // Product title
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Cabin',
            fontWeight: FontWeight.w600,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        
        const SizedBox(height: 10),
        
        // Size and color selection
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        'Select Size',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 9,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Icon(Icons.keyboard_arrow_down, size: 12),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        'Select Colour',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 9,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Icon(Icons.keyboard_arrow_down, size: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 10),
        
        // Price section
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '₹ $price',
              style: const TextStyle(
                color: Color(0xFF316300),
                fontSize: 18,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              '₹ $originalPrice',
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 12,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 10),
        
        // Tags - Make it scrollable to prevent overflow
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              Container(
                height: 20,
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0x7F27DBE5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '🍃 Air Purifying',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 8,
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 7),
              Container(
                height: 20,
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0x7FE5D827),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '🎁 Perfect Gift',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 8,
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 10),
        
        // Buy Now and Add to Cart buttons
        Row(
          children: [
            Container(
              width: 68,
              height: 34,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: const Color(0xFF316300),
                ),
                borderRadius: BorderRadius.circular(26),
              ),
              child: const Center(
                child: Text(
                  'Buy Now',
                  style: TextStyle(
                    color: Color(0xFF316300),
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Container(
                height: 34,
                decoration: BoxDecoration(
                  color: const Color(0xFF316300),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 14,
                      color: Colors.white,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
} 
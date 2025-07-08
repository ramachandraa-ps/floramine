import 'package:flutter/material.dart';

class CartItem {
  final String title;
  final String imageUrl;
  final String size;
  final String color;
  final int quantity;
  final String currentPrice;
  final String originalPrice;

  const CartItem({
    required this.title,
    required this.imageUrl,
    required this.size,
    required this.color,
    required this.quantity,
    required this.currentPrice,
    required this.originalPrice,
  });
}

class CartDetailsSection extends StatelessWidget {
  final List<CartItem> items;
  final String netPrice;
  final String deliveryFee;
  final String discount;
  final String discountReason;
  final String totalPrice;

  const CartDetailsSection({
    Key? key,
    this.items = const [
      CartItem(
        title: 'Miniature Rose, Button Rose (Any Color) - Plant',
        imageUrl: 'assets/images/cart/miniature_rose.png',
        size: 'M',
        color: 'Red',
        quantity: 1,
        currentPrice: '₹ 299',
        originalPrice: '₹ 350',
      ),
    ],
    this.netPrice = '₹299',
    this.deliveryFee = 'FREE',
    this.discount = '₹29',
    this.discountReason = 'PLANT20 Coupon Applied',
    this.totalPrice = '₹270',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive sizing
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cart Details Title
        SizedBox(
          width: double.infinity,
          child: Text(
            'Cart Details',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 20),
        
        // Divider
        Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: Colors.black.withOpacity(0.10),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        
        // Cart Items
        ...items.map((item) => Column(
          children: [
            Container(
              width: double.infinity,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Calculate maximum width for product details to avoid overflow
                  double maxProductWidth = constraints.maxWidth - 60 - 30 - 80; // image width + spacing + price column
                  
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Product image and details
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Product image
                          Container(
                            width: 50,
                            height: 50,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Image.asset(
                              item.imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey.shade200,
                                  child: Icon(Icons.image_not_supported, color: Colors.grey),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Product title and attributes with constrained width
                          Container(
                            width: maxProductWidth,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      item.size,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.50),
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      item.color,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.50),
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                      // Quantity
                      Text(
                        item.quantity.toString(),
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.50),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      
                      // Price details
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            item.currentPrice,
                            style: TextStyle(
                              color: const Color(0xFF316300),
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            item.originalPrice,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.50),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
              ),
            ),
            const SizedBox(height: 20),
            // Divider after each item
            Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Colors.black.withOpacity(0.10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        )),
        
        // Price breakdown
        Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: 350,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Net Price
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Net Price ',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.50),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '(Exclusive of shipping)',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.50),
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Cabin',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      netPrice,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 9),
              
              // Delivery Fee
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Delivery Fee',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.50),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      deliveryFee,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 9),
              
              // Discount
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Discount ',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.50),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '($discountReason)',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.50),
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Cabin',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      discount,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 9),
              
              // Total
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 138,
                      child: Text(
                        'Total',
                        style: TextStyle(
                          color: const Color(0xFF54A801),
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      totalPrice,
                      style: TextStyle(
                        color: const Color(0xFF54A801),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 
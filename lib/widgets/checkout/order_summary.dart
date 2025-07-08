import 'package:flutter/material.dart';
import 'checkout_product_card.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 30,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Title and Gift Wrapping
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Order Summary',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0x33D4D4D4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            decoration: ShapeDecoration(
                              color: const Color(0x1954A801),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(37),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.card_giftcard,
                                  size: 14,
                                  color: Color(0xFF54A801),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Gift Wrapping',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // First Product Card
              CheckoutProductCard(
                productName: 'Miniature Rose, Button Rose (Any Color) - Plant',
                size: 'M',
                imageUrl: 'assets/images/cart/miniature_rose.png',
                currentPrice: '₹ 299',
                originalPrice: '₹ 350',
                quantity: 1,
                onQuantityDecrement: () {
                  // Handle quantity decrement
                },
                onQuantityIncrement: () {
                  // Handle quantity increment
                },
                onDelete: () {
                  // Handle delete
                },
              ),
              const SizedBox(height: 20),

              // Second Product Card
              CheckoutProductCard(
                productName: 'Miniature Rose, Button Rose (Any Color) - Plant',
                size: 'M',
                imageUrl: 'assets/images/cart/miniature_rose.png',
                currentPrice: '₹ 299',
                originalPrice: '₹ 350',
                quantity: 1,
                onQuantityDecrement: () {
                  // Handle quantity decrement
                },
                onQuantityIncrement: () {
                  // Handle quantity increment
                },
                onDelete: () {
                  // Handle delete
                },
              ),
              const SizedBox(height: 20),

              // Delivery Summary
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: ShapeDecoration(
                  color: const Color(0x1954A801),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery by Tue May 13',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.80),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Free Delivery',
                      style: TextStyle(
                        color: const Color(0xFF54A801),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
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

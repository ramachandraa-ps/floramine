import 'package:flutter/material.dart';

class ProductActionBar extends StatelessWidget {
  final VoidCallback? onAddToCartPressed;
  final VoidCallback? onBuyNowPressed;

  const ProductActionBar({
    Key? key,
    this.onAddToCartPressed,
    this.onBuyNowPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Color(0x33000000), // 20% opacity black
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000), // 10% opacity black
            blurRadius: 7,
            offset: Offset(0, 0),
            spreadRadius: 6,
          )
        ],
      ),
      child: Row(
        children: [
          // Add to Cart button
          Expanded(
            child: GestureDetector(
              onTap: onAddToCartPressed,
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: ShapeDecoration(
                  color: const Color(0xFF622700),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 19,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          const SizedBox(width: 16),
          
          // Buy Now button
          Expanded(
            child: GestureDetector(
              onTap: onBuyNowPressed,
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFF622700),
                    ),
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                      color: Color(0xFF622700),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 
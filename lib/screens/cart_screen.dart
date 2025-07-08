import 'package:flutter/material.dart';
import '../widgets/cart/product_details_in_cart.dart';
import '../widgets/cart/amount_payable_section.dart';
import '../widgets/cart/saved_item_in_cart.dart';
import '../widgets/bottom_navigation_bar.dart';
// Remove the import for checkout.dart as we'll use named routes instead

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Main content with scroll
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Title
                      const SizedBox(height: 20),
                      const Text(
                        'My Cart (2)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontFamily: 'Cabin',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      // 2. Product Details in Cart (multiple items)
                      ProductDetailsInCart(),
                      const SizedBox(height: 20),
                      ProductDetailsInCart(),
                      const SizedBox(height: 20),
                      
                      // Divider
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.black.withOpacity(0.1),
                      ),
                      const SizedBox(height: 20),
                      
                      // 3. Amount Payable Section
                      AmountPayableSection(),
                      const SizedBox(height: 20),
                      
                      // 4. Saved Items in Cart
                      SavedItemInCart(),
                      const SizedBox(height: 80), // Extra space for bottom bar
                    ],
                  ),
                ),
              ),
            ),
            
            // Bottom Navigation Bar will be added outside this column
          ],
        ),
      ),
      // Bottom fixed section for total and proceed
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Total and Proceed button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Total amount
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          '₹2,770',
                          style: TextStyle(
                            color: Color(0xFF54A801),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          '₹29',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          Icons.info_outline,
                          size: 16,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ],
                ),
                
                // Proceed button
                GestureDetector(
                  onTap: () {
                    // Navigate to checkout step 1 using named route
                    Navigator.pushNamed(context, '/checkout');
                  },
                  child: Container(
                    width: 147,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF316300),
                      borderRadius: BorderRadius.circular(26),
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
                          'Proceed',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
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
          ),
          
          // Bottom Navigation Bar
          CustomBottomNavigationBar(
            currentItem: NavigationItem.cart,
            onItemSelected: (item) {
              if (item != NavigationItem.cart) {
                CustomBottomNavigationBar.navigateTo(context, item);
              }
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My Cart (0)',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            
            // Empty cart content
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Empty cart image or icon
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 100,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // No product text
                    const Text(
                      'No Product',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    
                    // Suggestion text
                    const Text(
                      'Go find the products you like',
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 40),
                    
                    // Continue shopping button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to the home screen
                          Navigator.pushReplacementNamed(context, '/plants');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF316300),
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Continue Shopping',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Bottom navigation bar
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
      ),
    );
  }
}

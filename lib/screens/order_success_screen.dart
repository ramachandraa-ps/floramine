import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.50, 0.00),
            end: Alignment(0.50, 1.00),
            colors: [Color(0xFF54A801), Color(0xFF214200)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        
                        // Order success image
                        Center(
                          child: Image.asset(
                            'assets/images/order_success.png',
                            width: 252,
                            height: 252,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        // Order success title
                        const Text(
                          'Order Placed Successfully!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        // Order ID
                        const Text(
                          'Order ID : #FM12A2154',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        
                        // Thank you message
                        const Text(
                          'Thank you for your order!\nYour request has been successfully placed. We\'ll start preparing your plants with care and will update you once your order is ready for delivery.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 50),
                        
                        // Go to Orders button
                        GestureDetector(
                          onTap: () {
                            // Navigate to orders screen
                            Navigator.pushNamed(context, '/orders');
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(26),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Go to Orders',
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
                        const SizedBox(height: 20),
                        
                        // Continue Shopping button
                        GestureDetector(
                          onTap: () {
                            // Navigate to home screen
                            Navigator.pushNamedAndRemoveUntil(
                              context, 
                              '/plants', 
                              (route) => false
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(26),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Color(0xFF316300),
                                  size: 19,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Continue Shopping',
                                  style: TextStyle(
                                    color: Color(0xFF316300),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

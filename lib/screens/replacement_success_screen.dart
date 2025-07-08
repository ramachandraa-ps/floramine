import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';

class ReplacementSuccessScreen extends StatelessWidget {
  const ReplacementSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.5, 0.0),
            end: Alignment(0.5, 1.0),
            colors: [Color(0xFF54A801), Color(0xFF214200)],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Decorative lines
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Success image and text
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Success image
                      Image.asset(
                        'assets/images/replacement_success.png',
                        width: 252,
                        height: 252,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 40),
                      
                      // Success title
                      const Text(
                        'Replacement submitted',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      // Success message
                      const Text(
                        'We\'ll update you once your replacement is approved',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 60),
                      
                      // Go to Orders button
                      GestureDetector(
                        onTap: () {
                          // Navigate to Orders screen
                          CustomBottomNavigationBar.navigateTo(context, NavigationItem.orders);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Go to Orders',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
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
    );
  }
}

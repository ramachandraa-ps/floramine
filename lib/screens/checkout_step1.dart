import 'package:flutter/material.dart';
import '../widgets/checkout/shipping_address.dart';
import 'checkout_step2.dart';

class CheckoutStep1Screen extends StatelessWidget {
  const CheckoutStep1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header with gradient background
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, 0.50),
                end: Alignment(1.00, 0.50),
                colors: [Color(0xFF54A801), Color(0xFF214200)],
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Back button
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: Color(0xFFE4E4E4),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: Color(0xFF54A801),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    
                    // Title
                    const Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Progress indicator
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Step 1 - Address (Active)
                _buildStepIndicator(
                  number: '1',
                  label: 'Address',
                  isActive: true,
                  width: 70,
                ),
                
                // Divider line
                Container(
                  width: 50,
                  height: 1,
                  color: Colors.black.withOpacity(0.10),
                ),
                
                // Step 2 - Order Summary (Inactive)
                _buildStepIndicator(
                  number: '2',
                  label: 'Summary',
                  isActive: false,
                  width: 70,
                ),
                
                // Divider line
                Container(
                  width: 50,
                  height: 1,
                  color: Colors.black.withOpacity(0.10),
                ),
                
                // Step 3 - Payment (Inactive)
                _buildStepIndicator(
                  number: '3',
                  label: 'Payment',
                  isActive: false,
                  width: 70,
                ),
              ],
            ),
          ),
          
          // Content - Shipping Address
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ShippingAddress(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }
  
  Widget _buildStepIndicator({
    required String number,
    required String label,
    required bool isActive,
    required double width,
  }) {
    return Container(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circle with number
          Container(
            width: 24,
            height: 24,
            padding: const EdgeInsets.all(2),
            decoration: ShapeDecoration(
              color: isActive ? const Color(0xFF54A801) : Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: isActive ? const Color(0xFF54A801) : Colors.black,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Center(
              child: Text(
                number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.black,
                  fontSize: 14,
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          
          // Label
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      width: double.infinity,
      // Increase the height to accommodate all content
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Color(0x33000000),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 7,
            offset: Offset(0, 0),
            spreadRadius: 6,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Total price section
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.50),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
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
                      color: Colors.black.withOpacity(0.50),
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
          
          // Next button
          GestureDetector(
            onTap: () {
              // Navigate to step 2
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CheckoutStep2Screen()),
              );
            },
            child: Container(
              width: 147,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: ShapeDecoration(
                color: const Color(0xFF316300),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

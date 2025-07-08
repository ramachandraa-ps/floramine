import 'package:flutter/material.dart';
import '../widgets/checkout/order_summary.dart';

class CheckoutStep2Screen extends StatelessWidget {
  const CheckoutStep2Screen({Key? key}) : super(key: key);

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
                // Step 1 - Address (Completed)
                _buildStepIndicator(
                  number: '1',
                  label: 'Address',
                  isActive: true,
                  isCompleted: true,
                  width: 82,
                ),
                
                // Divider line (completed)
                Container(
                  width: 77,
                  height: 1,
                  color: const Color(0xFF54A801),
                ),
                
                // Step 2 - Order Summary (Active)
                _buildStepIndicator(
                  number: '2',
                  label: 'Order Summary',
                  isActive: true,
                  isCompleted: false,
                  width: null,
                ),
                
                // Divider line
                Container(
                  width: 77,
                  height: 1,
                  color: Colors.black.withOpacity(0.10),
                ),
                
                // Step 3 - Payment (Inactive)
                _buildStepIndicator(
                  number: '3',
                  label: 'Payment',
                  isActive: false,
                  isCompleted: false,
                  width: 82,
                ),
              ],
            ),
          ),
          
          // Content - Order Summary
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  
                  // Order Summary section
                  const Text(
                    'Order Summary',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Delivery/Pickup options
                  Row(
                    children: [
                      // Delivery option (selected)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: const Color(0xFF54A801), width: 2),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF54A801),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Delivery',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      
                      // Pickup option (not selected)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black.withOpacity(0.3), width: 2),
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Pickup',
                              style: TextStyle(
                                color: Colors.black,
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
                  const SizedBox(height: 16),
                  
                  // Gift wrapping option
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0x33D4D4D4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                          decoration: ShapeDecoration(
                            color: const Color(0x1954A801),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(37),
                            ),
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.card_giftcard,
                                size: 14,
                                color: Color(0xFF54A801),
                              ),
                              SizedBox(width: 6),
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
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Order summary widget
                  const OrderSummary(),
                  
                  // Savings info
                  Container(
                    width: double.infinity,
                    height: 30,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFDFFFC1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'You\'ve saved ₹2,420 with this order',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  
                  // Price breakdown
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        // Net Price
                        Padding(
                          padding: const EdgeInsets.only(bottom: 9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
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
                              ),
                              const Text(
                                '₹299',
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
                        
                        // Discount
                        Padding(
                          padding: const EdgeInsets.only(bottom: 9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Discount',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.50),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Text(
                                '₹29',
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
                        
                        // Delivery Fee
                        Padding(
                          padding: const EdgeInsets.only(bottom: 9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              const Text(
                                'FREE',
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
                        
                        // Total
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Total',
                              style: TextStyle(
                                color: Color(0xFF54A801),
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '₹270',
                              style: TextStyle(
                                color: Color(0xFF54A801),
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                ],
              ),
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
    required bool isCompleted,
    double? width,
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
              fontSize: 14,
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
          
          // Proceed & Pay button
          GestureDetector(
            onTap: () {
              // Navigate to payment step
              // TODO: Implement navigation to payment step
            },
            child: Container(
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
                    'Proceed & Pay',
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

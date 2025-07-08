import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [
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
          // Title
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
          
          // Order items will be shown in step 2
          const Text(
            'Order items will be shown in step 2',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Continue button
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to step 2
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF54A801),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 
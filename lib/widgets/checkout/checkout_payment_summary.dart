import 'package:flutter/material.dart';

class CheckoutPaymentSummary extends StatelessWidget {
  const CheckoutPaymentSummary({Key? key}) : super(key: key);

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
            'Payment Summary',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          
          // Price details
          _buildPriceRow('Subtotal', '₹2,400'),
          const SizedBox(height: 8),
          _buildPriceRow('Shipping', '₹50'),
          const SizedBox(height: 8),
          _buildPriceRow('Tax', '₹120'),
          
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Divider(height: 1, color: Colors.black12),
          ),
          
          // Total
          _buildPriceRow('Total', '₹2,570', isTotal: true),
          
          const SizedBox(height: 20),
          
          // Proceed to payment button
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to payment screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF54A801),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: const Text(
                'Proceed to Payment',
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
  
  Widget _buildPriceRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: isTotal ? 18 : 14,
            fontFamily: 'Poppins',
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: isTotal ? const Color(0xFF54A801) : Colors.black,
            fontSize: isTotal ? 18 : 14,
            fontFamily: 'Poppins',
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
} 
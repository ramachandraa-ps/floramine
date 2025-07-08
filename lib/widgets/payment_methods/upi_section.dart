import 'package:flutter/material.dart';
import 'upi_item.dart';

class UpiSection extends StatelessWidget {
  const UpiSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        const Text(
          'UPI',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        
        const SizedBox(height: 20),
        
        // UPI items
        Column(
          children: const [
            // SBI UPI
            UpiItem(
              upiId: 'sarathkumar25@oksbi',
              bankLogoAsset: 'assets/images/payment_methods/upi_logo.png',
            ),
            
            SizedBox(height: 19),
            
            // ICICI UPI
            UpiItem(
              upiId: 'sarathkumar25@okicici',
              bankLogoAsset: 'assets/images/payment_methods/upi_logo.png',
            ),
          ],
        ),
      ],
    );
  }
} 
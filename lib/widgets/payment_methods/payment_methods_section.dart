import 'package:flutter/material.dart';
import 'card_section.dart';
import 'upi_section.dart';

class PaymentMethodsSection extends StatelessWidget {
  const PaymentMethodsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          // Cards section
          CardSection(),
          
          // Divider
          SizedBox(height: 20),
          Divider(color: Color(0x4D000000)), // 30% black opacity
          SizedBox(height: 20),
          
          // UPI section
          UpiSection(),
          
          SizedBox(height: 30),
        ],
      ),
    );
  }
} 
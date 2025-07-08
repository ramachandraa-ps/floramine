import 'package:flutter/material.dart';
import 'card_item.dart';

class CardSection extends StatelessWidget {
  const CardSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        const Text(
          'Cards',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Card items
        Column(
          children: const [
            // Debit card
            CardItem(
              cardNumber: '**** **** **** 9856',
              cardHolderName: 'SARATH KUMAR V',
              expiryDate: '05 / 2024',
              cardType: 'Debit',
              cardLogoAsset: 'assets/images/payment_methods/visa_logo.png',
            ),
            
            SizedBox(height: 19),
            
            // Credit card
            CardItem(
              cardNumber: '**** **** **** 9856',
              cardHolderName: 'SARATH KUMAR V',
              expiryDate: '05 / 2024',
              cardType: 'Credit',
              cardLogoAsset: 'assets/images/payment_methods/visa_logo.png',
            ),
          ],
        ),
      ],
    );
  }
} 
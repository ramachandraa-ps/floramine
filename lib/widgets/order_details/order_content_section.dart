import 'package:flutter/material.dart';
import 'shipping_details_section.dart';
import 'track_history_section.dart';
import 'cart_details_section.dart';
import 'order_actions_section.dart';

class OrderContentSection extends StatelessWidget {
  const OrderContentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get device width to set constraints
    double screenWidth = MediaQuery.of(context).size.width;
    double contentWidth = screenWidth > 500 ? 441 : screenWidth - 20;

    return Container(
      width: contentWidth,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      constraints: BoxConstraints(
        maxWidth: 441,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Shipping Details and Payment Section
                ShippingDetailsSection(),
                
                const SizedBox(height: 19),
                
                // Track History Section
                TrackHistorySection(),
                
                const SizedBox(height: 30),
                
                // Cart Details Section with Cart Items and Price Breakdown
                CartDetailsSection(),
                
                const SizedBox(height: 30),
                
                // Order Actions Section (Download Invoice, Review, Replacement)
                Center(child: OrderActionsSection()),
                
                // Add bottom padding for better spacing
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 
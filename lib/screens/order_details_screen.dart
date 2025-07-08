import 'package:flutter/material.dart';
import '../widgets/order_details/shipping_details_section.dart';
import '../widgets/order_details/track_history_section.dart';
import '../widgets/order_details/cart_details_section.dart';
import '../widgets/order_details/order_actions_section.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../screens/view_review_screen.dart';
import '../screens/replacement_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;

  const OrderDetailsScreen({
    Key? key,
    this.orderId = '#ABC4578984321',
  }) : super(key: key);
  
  // Static method to navigate to this screen
  static void navigateTo(BuildContext context, {String orderId = '#ABC4578984321'}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderDetailsScreen(orderId: orderId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // 1. Header with gradient and back button
                  _buildHeader(context),
                  
                  // 2. Order ID section
                  _buildOrderIdSection(),
                  
                  // 3. Main content
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        
                        // 4. Shipping Details Section
                        const ShippingDetailsSection(),
                        const SizedBox(height: 30),
                        
                        // 5. Track History Section
                        const TrackHistorySection(
                          trackingHistory: [
                            TrackingStatus(
                              status: 'Order Placed',
                              time: '11:40 am',
                              date: '24.04.2025',
                              isCompleted: true,
                            ),
                            TrackingStatus(
                              status: 'Order Shipped',
                              time: '11:40 am',
                              date: '24.04.2025',
                              isCompleted: false,
                            ),
                            TrackingStatus(
                              status: 'Out For Delivery',
                              time: '11:40 am',
                              date: '24.04.2025',
                              isCompleted: false,
                            ),
                            TrackingStatus(
                              status: 'Delivered',
                              time: '11:40 am',
                              date: '24.04.2025',
                              isCompleted: false,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        
                        // 6. Cart Details Section
                        const CartDetailsSection(),
                        const SizedBox(height: 30),
                        
                        // 7. Order Actions Section
                        Center(
                          child: OrderActionsSection(
                            onDownloadInvoice: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Downloading invoice...')),
                              );
                            },
                            onGiveReview: () {
                              // Navigate to the review screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ViewReviewScreen()),
                              );
                            },
                            onReplacement: () {
                              // Navigate to the replacement screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ReplacementScreen()),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Bottom Navigation Bar
          CustomBottomNavigationBar(
            currentItem: NavigationItem.orders,
            onItemSelected: (item) {
              if (item != NavigationItem.orders) {
                CustomBottomNavigationBar.navigateTo(context, item);
              }
            },
          ),
        ],
      ),
    );
  }

  // Header with gradient background and back button
  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF54A801), Color(0xFF214200)],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              // Back button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 40,
                  height: 40,
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
                    color: Color(0xFF54A801),
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              
              // Title
              const Text(
                'Order Details',
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
    );
  }

  // Order ID section
  Widget _buildOrderIdSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.20),
          ),
        ),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Order Details ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w700,
              ),
            ),
            TextSpan(
              text: orderId,
              style: const TextStyle(
                color: Color(0xFF54A801),
                fontSize: 24,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

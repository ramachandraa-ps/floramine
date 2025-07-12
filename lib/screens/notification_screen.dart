import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import 'deal_of_the_day_screen.dart';
import '../providers/deal_provider.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  // Static method to navigate to this screen
  static void navigateTo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotificationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Load deal information when the screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DealProvider>(context, listen: false).loadDealProducts();
    });

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAF0), // Light cream background
      body: Column(
        children: [
          // Header with gradient background and back button
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
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
                      'Notification',
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
          
          // Notification list - Expanded to take remaining space
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Deal of the Day Card
                Consumer<DealProvider>(
                  builder: (context, dealProvider, child) {
                    return _buildDealOfTheDayCard(context, dealProvider);
                  },
                ),
                
                // Regular notifications section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Regular notifications
                      for (int i = 0; i < 5; i++) ...[
                        _buildNotificationItem(
                          'Your Item is delivered. It will be delivered soon',
                          'Mar 25, 2025',
                          'assets/images/jasminum_sambac.png',
                        ),
                        if (i < 4) const Divider(color: Color(0x1A000000), height: 1),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Bottom Navigation Bar
          CustomBottomNavigationBar(
            currentItem: NavigationItem.plants,
            onItemSelected: (item) {
              if (item != NavigationItem.plants) {
                CustomBottomNavigationBar.navigateTo(context, item);
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
  
  // Completely reimplemented Deal of the Day Card
  Widget _buildDealOfTheDayCard(BuildContext context, DealProvider dealProvider) {
    // Extract deal data
    final dealInfo = dealProvider.dealInfo;
    final isLoading = dealProvider.isLoading;
    
    // Default values
    String dealName = "Best Deals";
    String? bannerImage;
    int hours = 0;
    int minutes = 0;
    int seconds = 0;
    
    // Update with actual data if available
    if (dealInfo != null) {
      dealName = dealInfo['name'] ?? "Best Deals";
      
      if (dealInfo['banner_image'] != null) {
        bannerImage = 'https://erp.floramine.in/${dealInfo['banner_image']}';
      }
      
      // Calculate remaining time if end date is available
      if (dealInfo['end_date'] != null) {
        final endDate = DateTime.parse(dealInfo['end_date']);
        final now = DateTime.now();
        final difference = endDate.difference(now);
        
        if (!difference.isNegative) {
          hours = difference.inHours;
          minutes = difference.inMinutes.remainder(60);
          seconds = difference.inSeconds.remainder(60);
        }
      }
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => const DealOfTheDayScreen())
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: isLoading 
          ? const SizedBox(
              height: 100,
              child: Center(child: CircularProgressIndicator(color: Color(0xFF54A801))),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Content row with image and timer
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image on left - using actual deal image or placeholder
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: bannerImage != null
                            ? Image.network(
                                bannerImage,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/deal_of_the_day/deal_of_the_day.png',
                                    fit: BoxFit.cover,
                                  );
                                },
                              )
                            : Image.asset(
                                'assets/images/deal_of_the_day/deal_of_the_day.png',
                                fit: BoxFit.cover,
                              ),
                        ),
                      ),
                      
                      const SizedBox(width: 16),
                      
                      // Timer with green background - matching screenshot
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF54A801),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Hours
                              _buildTimerBlock(hours, "h"),
                              _buildTimerDot(),
                              
                              // Minutes
                              _buildTimerBlock(minutes, "m"),
                              _buildTimerDot(),
                              
                              // Seconds
                              _buildTimerBlock(seconds, "s"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Deal name text
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      dealName,
                      style: const TextStyle(
                        color: Color(0xFF316300),
                        fontSize: 18,
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                
                // Yellow strip at bottom
                Container(
                  height: 4,
                  color: const Color(0xFFFFEE08),
                ),
              ],
            ),
      ),
    );
  }
  
  // Helper method to build timer block with value and label
  Widget _buildTimerBlock(int value, String label) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value.toString().padLeft(2, '0'),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              height: 1.0,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
  
  // Helper method to build timer dot separator
  Widget _buildTimerDot() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Text(
        ".",
        style: TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.w700,
          height: 0.5,
        ),
      ),
    );
  }
  
  // Helper method to build a notification item
  Widget _buildNotificationItem(String message, String date, String imageAsset) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Notification image
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imageAsset),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          
          // Notification content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

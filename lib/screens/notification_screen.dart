import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import 'deal_of_the_day_screen.dart';

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
    return Scaffold(
      body: Column(
        children: [
          // Header with gradient background and back button
          Container(
            width: double.infinity,
            height: 110,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, 0.50),
                end: Alignment(1.00, 0.50),
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
              padding: const EdgeInsets.all(16.0),
              children: [
                // Deal of the Day Card
                _buildDealOfTheDayCard(context),
                
                const SizedBox(height: 16),
                const Divider(color: Color(0x1A000000), height: 1),
                const SizedBox(height: 8),
                
                // Regular notifications
                for (int i = 0; i < 10; i++) ...[
                  _buildNotificationItem(
                    'Your Item is delivered. It will be delivered soon',
                    'Mar 25, 2025',
                    'assets/images/jasminum_sambac.png',
                  ),
                  if (i < 9) const Divider(color: Color(0x1A000000), height: 1),
                ],
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
  
  // Deal of the Day Card
  Widget _buildDealOfTheDayCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => const DealOfTheDayScreen())
        );
      },
      child: Container(
        width: double.infinity,
        height: 140,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF6ECEC),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background designs
            Positioned(
              right: -30,
              top: -20,
              child: Container(
                width: 120,
                height: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/deal_of_the_day/right_top.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              left: -20,
              bottom: -20,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/deal_of_the_day/left_bottom.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            
            // Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left side - "Deal of the Day" text and image
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/deal_of_the_day/deal_of_the_day.png',
                          width: 120,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Today's Green Highlight",
                          style: TextStyle(
                            color: Color(0xFF316300),
                            fontSize: 14,
                            fontFamily: 'Cabin',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Don't miss out!",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Right side - Countdown timer
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF54A801),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildTimeUnit('24', 'Hrs'),
                          const SizedBox(height: 6),
                          _buildTimeUnit('02', 'Min'),
                          const SizedBox(height: 6),
                          _buildTimeUnit('26', 'Sec'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Arrow indicator
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF54A801),
                  size: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Time unit for Deal of the Day card
  Widget _buildTimeUnit(String value, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
  
  // Helper method to build a notification item
  Widget _buildNotificationItem(String message, String date, String imageAsset) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Notification image
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imageAsset),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          
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
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
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

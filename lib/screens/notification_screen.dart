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
              padding: const EdgeInsets.all(0),
              children: [
                // Deal of the Day Card
                _buildDealOfTheDayCard(context),
                
                const SizedBox(height: 16),
                
                // Regular notifications section with padding
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
    final screenWidth = MediaQuery.of(context).size.width;
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => const DealOfTheDayScreen())
        );
      },
      child: Container(
        width: double.infinity,
        height: 140, // Adjusted height to prevent overflow
        margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        decoration: BoxDecoration(
          color: const Color(0xFFF9F3F3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Left plant decoration
            Positioned(
              left: -8,
              bottom: 0,
              child: Image.asset(
                'assets/images/deal_of_the_day/left_bottom.png',
                width: 70,
                height: 70,
                fit: BoxFit.contain,
              ),
            ),
            
            // Right plant decoration
            Positioned(
              right: -5,
              top: -15,
              child: Image.asset(
                'assets/images/deal_of_the_day/right_top.png',
                width: 70,
                height: 70,
                fit: BoxFit.contain,
              ),
            ),
            
            // Content layout
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left section - Deal of the Day and text
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Logo/text
                        Image.asset(
                          'assets/images/deal_of_the_day/deal_of_the_day.png',
                          width: 140,
                          height: 70,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Today's Green Highlight",
                          style: TextStyle(
                            color: Color(0xFF316300),
                            fontSize: 14,
                            fontFamily: 'Cabin',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(width: 10),
                  
                  // Right side - Timer box
                  Container(
                    width: screenWidth * 0.3,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF54A801),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Hours
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '24',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Hrs',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 4),
                        
                        // Minutes
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '02',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Min',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 4),
                        
                        // Seconds
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '26',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Sec',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Arrow button
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                width: 26,
                height: 26,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Center(
                  child: Icon(
                    Icons.chevron_right,
                    color: Color(0xFF54A801),
                    size: 22,
                  ),
                ),
              ),
            ),
            
            // Yellow strip at bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFEE08),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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

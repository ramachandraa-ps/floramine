import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/header_widget.dart';
import 'about_us_screen.dart';
import 'notification_screen.dart';
import 'rental_services_screen.dart';
import 'bundles_screen.dart';
import 'contact_us_screen.dart';
import 'blogs_screen.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F4D9), // Light green background
      body: SafeArea(
        child: Column(
          children: [
            // Header with logo and profile
            HeaderWidget(
              onNotificationTap: () {
                // Navigate to notification screen
                NotificationScreen.navigateTo(context);
              },
            ),
            
            // Scrollable content area
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Call to action banner
                    _buildCallBanner(),
                    
                    // Help menu options
                    _buildHelpMenu(context),
                    
                    // App version
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        'App Version V2.0',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.50),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Fixed bottom navigation bar
            CustomBottomNavigationBar(
              currentItem: NavigationItem.help,
              onItemSelected: (item) {
                if (item != NavigationItem.help) {
                  CustomBottomNavigationBar.navigateTo(context, item);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
  
  // Call to action banner
  Widget _buildCallBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: double.infinity,
          height: 180,
          child: Stack(
            children: [
              // Image covering the entire container
              Positioned.fill(
                child: Image.asset(
                  'assets/images/help/customer_service.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFF2F6A00),
                    );
                  },
                ),
              ),
              
              // Text overlay
              Positioned(
                left: 20,
                top: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'For Any Queries? Call',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '+91 9876542105',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  // Help menu options
  Widget _buildHelpMenu(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          _buildMenuItem(context, 'Chat with Us', () {
            // Navigate to Chat with Us screen
            Navigator.pushNamed(context, '/chat-with-us');
          }),
          
          _buildMenuItem(context, 'Raise Ticket', () {
            // Navigate to Support Ticket screen
            Navigator.pushNamed(context, '/support-ticket');
          }),
          
          _buildMenuItem(context, 'Frequently Asked Question', () {
            // Navigate to FAQ screen
            Navigator.pushNamed(context, '/faq');
          }),
          
          _buildMenuItem(context, 'Blogs', () {
            // Navigate to Blogs screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BlogsScreen()),
            );
          }),
          
          _buildMenuItem(context, 'Rental Services', () {
            // Navigate to Rental Services screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RentalServicesScreen()),
            );
          }),
          
          _buildMenuItem(context, 'Bundles', () {
            // Navigate to Bundles screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BundlesScreen()),
            );
          }),
          
          _buildMenuItem(context, 'About Us', () {
            // Navigate to About Us screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutUsScreen()),
            );
          }),
          
          _buildMenuItem(context, 'Contact Us', () {
            // Navigate to Contact Us screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContactUsScreen()),
            );
          }),
          
          _buildMenuItem(context, 'Privacy Policy', () {
            // Handle privacy policy action
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Privacy policy coming soon')),
            );
          }),
          
          _buildMenuItem(context, 'Terms & Conditions', () {
            // Handle terms action
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Terms & conditions coming soon')),
            );
          }),
          
          // Newsletter subscription with toggle
          Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.10),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Subscribe Our Newsletter',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Switch(
                  value: true,
                  activeColor: const Color(0xFF54A801),
                  onChanged: (value) {
                    // Handle newsletter subscription toggle
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  // Individual menu item
  Widget _buildMenuItem(BuildContext context, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black.withOpacity(0.10),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Header with gradient background
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Back button
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 40,
                          height: 40,
                          clipBehavior: Clip.antiAlias,
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
                            size: 20,
                            color: Color(0xFF54A801),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      
                      // Title
                      const Text(
                        'Profile',
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
            
            // Profile content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile picture and name section
                      Center(
                        child: Column(
                          children: [
                            // Profile picture
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF54A801),
                                  width: 3,
                                ),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/header/user.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 17),
                            
                            // Name and phone
                            const Column(
                              children: [
                                Text(
                                  'Sarath Kumar',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '+91 9876542210',
                                  style: TextStyle(
                                    color: Color(0x80000000),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      // Divider
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: const Color(0x4D000000),
                      ),
                      const SizedBox(height: 20),
                      
                      // Menu items
                      _buildMenuItem(
                        icon: Icons.person_outline,
                        title: 'My Profile',
                        onTap: () {
                          // Navigate to My Profile screen
                          Navigator.pushNamed(context, '/my-profile');
                        },
                      ),
                      const SizedBox(height: 20),
                      
                      _buildMenuItem(
                        icon: Icons.shopping_basket_outlined,
                        title: 'My Orders',
                        onTap: () {
                          Navigator.pushNamed(context, '/orders');
                        },
                      ),
                      const SizedBox(height: 20),
                      
                      _buildMenuItem(
                        icon: Icons.location_on_outlined,
                        title: 'My Addresses',
                        onTap: () {
                          // Handle My Addresses tap
                        },
                      ),
                      const SizedBox(height: 20),
                      
                      _buildMenuItem(
                        icon: Icons.credit_card,
                        title: 'Payment Methods',
                        onTap: () {
                          // Navigate to Payment Methods screen
                          Navigator.pushNamed(context, '/payment-methods');
                        },
                      ),
                      const SizedBox(height: 20),
                      
                      _buildMenuItem(
                        icon: Icons.chat_outlined,
                        title: 'Communication Preferences',
                        onTap: () {
                          // Navigate to Communication Preferences screen
                          Navigator.pushNamed(context, '/communication-preferences');
                        },
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // Logout button
                      GestureDetector(
                        onTap: () {
                          // Handle logout
                          // Navigate to login screen
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/',
                            (route) => false,
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          decoration: ShapeDecoration(
                            color: const Color(0x1954A801),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.logout,
                                color: Color(0xFF316300),
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Logout',
                                style: TextStyle(
                                  color: Color(0xFF316300),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          // Icon container
          Container(
            width: 24,
            height: 24,
            decoration: ShapeDecoration(
              color: const Color(0x1954A801),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 16,
                color: const Color(0xFF54A801),
              ),
            ),
          ),
          const SizedBox(width: 10),
          
          // Title
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

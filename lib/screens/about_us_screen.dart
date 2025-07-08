import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Main container
            Container(
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(),
              ),
              child: Stack(
                children: [
                  // Content area
                  Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: _buildMainContent(context),
                  ),
                  
                  // Header with gradient
                  _buildHeader(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Header with gradient and back button
  Widget _buildHeader(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      right: 0,
      child: Container(
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  'About Us',
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
    );
  }
  
  // Main content section
  Widget _buildMainContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome text
          RichText(
            textAlign: TextAlign.justify,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Welcome to ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 1.56,
                  ),
                ),
                TextSpan(
                  text: 'FloraMine',
                  style: TextStyle(
                    color: Color(0xFF54A801),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 1.56,
                  ),
                ),
                TextSpan(
                  text: ', where nature meets nurture. Founded with a love for all things green, we are a locally grown nursery dedicated to providing high-quality plants, gardening supplies, and landscaping services for homes and businesses alike. Whether you\'re a seasoned gardener or just starting out, we\'re here to help you grow your perfect green space.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 1.56,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Image
          Container(
            width: double.infinity,
            height: 259,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Image.asset(
              'assets/images/about_us.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Our Mission
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF54A801), Color(0xFF214200)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Our Mission',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'To inspire a deeper connection with nature by offering beautiful, healthy plants and expert garden care, while supporting sustainable and eco-friendly practices.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 1.56,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 30),
          
          // Why Choose Us
          _buildWhyChooseUs(),
          
          const SizedBox(height: 30),
          
          // Follow Us
          _buildFollowUs(),
        ],
      ),
    );
  }
  
  // Why Choose Us section
  Widget _buildWhyChooseUs() {
    return Column(
      children: [
        const Text(
          'Why Choose Us?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: 'Cabin',
            fontWeight: FontWeight.w700,
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Features
        _buildFeatureItem(
          icon: Icons.spa,
          title: 'Healthy Plants Guaranteed',
          description: 'We nurture each plant with care before it reaches your hands',
        ),
        
        const SizedBox(height: 20),
        
        _buildFeatureItem(
          icon: Icons.psychology,
          title: 'Expert Guidance',
          description: 'Our team is passionate, knowledgeable, and ready to help',
        ),
        
        const SizedBox(height: 20),
        
        _buildFeatureItem(
          icon: Icons.eco,
          title: 'Eco-Conscious',
          description: 'We promote sustainable gardening practices and organic solutions',
        ),
        
        const SizedBox(height: 20),
        
        _buildFeatureItem(
          icon: Icons.headset_mic,
          title: 'Customer-Focused',
          description: 'Your satisfaction and green success are our top priorities',
        ),
      ],
    );
  }
  
  // Feature item
  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Column(
      children: [
        // Icon container
        Container(
          width: 70,
          height: 70,
          decoration: ShapeDecoration(
            color: const Color(0x1954A801),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(47),
            ),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF54A801),
            size: 24,
          ),
        ),
        
        const SizedBox(height: 10),
        
        // Title
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        
        const SizedBox(height: 6),
        
        // Description
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
      ],
    );
  }
  
  // Follow Us section
  Widget _buildFollowUs() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: ShapeDecoration(
        color: const Color(0x1954A801),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Follow Us On',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w700,
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Social media icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(Icons.facebook, onTap: () {}),
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.message, onTap: () {}),
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.telegram, onTap: () {}),
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.camera_alt, onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
  
  // Social media icon
  Widget _buildSocialIcon(IconData icon, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: const BoxDecoration(
          color: Color(0xFF54A801),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

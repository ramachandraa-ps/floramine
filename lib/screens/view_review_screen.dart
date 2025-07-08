import 'package:flutter/material.dart';

class ViewReviewScreen extends StatelessWidget {
  const ViewReviewScreen({Key? key}) : super(key: key);

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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                ),
              ),
              child: Stack(
                children: [
                  // Content area
                  Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        
                        // Review title and rating
                        _buildReviewHeader(),
                        
                        const SizedBox(height: 30),
                        
                        // Review content
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: _buildReviewContent(),
                        ),
                        
                        const SizedBox(height: 40),
                      ],
                    ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back button and title
                Row(
                  children: [
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
                    const Text(
                      'View Reviews',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                
                // Share button
                Row(
                  children: [
                    const Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 24,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Share',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  // Review header with title and rating
  Widget _buildReviewHeader() {
    return Column(
      children: [
        const Text(
          'Your Review',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 36,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        
        // Rating display
        Column(
          children: [
            const Text(
              '4.1',
              style: TextStyle(
                color: Color(0xFF54A801),
                fontSize: 72,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            
            // Star rating
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: index < 4 ? Colors.amber : Colors.grey.shade300,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  
  // Review content with user info and review text
  Widget _buildReviewContent() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: ShapeDecoration(
        color: const Color(0xFFF2F2F2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info row
          Row(
            children: [
              // User profile image
              Container(
                width: 70,
                height: 70,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/profile/user_profile.png'),
                    fit: BoxFit.cover,
                  ),
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 2,
                      color: const Color(0xFF54A801),
                    ),
                  ),
                ),
                child: const Icon(Icons.person, color: Colors.transparent), // Placeholder
              ),
              const SizedBox(width: 10),
              
              // User name and date
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Jenny Wilson',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.verified,
                        color: Color(0xFF54A801),
                        size: 14,
                      ),
                    ],
                  ),
                  const Text(
                    'Nov 26, 2025',
                    style: TextStyle(
                      color: Color(0x99000000),
                      fontSize: 12,
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.w400,
                      height: 2.17,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 13),
          
          // Review text
          const Text(
            'Bright, indirect light is best for the Areca Palms. They need to be watered once a week or when the top inch of soil feels dry. Palms prefer evenly moist soil but are susceptible to root rot if overwatered. Thrives in moderate humidity but can adapt to average household levels. Regular misting or using a humidifier can help maintain optimal humidity, especially in drier climates.',
            style: TextStyle(
              color: Color(0x99000000),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 1.75,
            ),
          ),
          const SizedBox(height: 13),
          
          // Review images
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                4,
                (index) => Container(
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.only(right: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/plants/plant_${index + 1}.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade300,
                        child: Icon(Icons.image, color: Colors.grey),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

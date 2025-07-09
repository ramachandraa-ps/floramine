import 'package:flutter/material.dart';

class PersonalizedGiftingSection extends StatelessWidget {
  const PersonalizedGiftingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
      decoration: BoxDecoration(color: const Color(0x1954A801)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title and subtitle
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Making Personalized Gifting Simple',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Make every gift special with personalized plants, custom planters, branded logos, and message cards—uniquely tailored to your vision.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.50),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Steps section
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStepCard(
                  number: '1',
                  title: 'Curated Choices',
                  description: 'Choose from premium plants, planters, and add-ons.',
                ),
                const SizedBox(height: 20),
                _buildStepCard(
                  number: '2',
                  title: 'Branded Touch',
                  description: 'Add your logo and custom packaging.',
                ),
                const SizedBox(height: 20),
                _buildStepCard(
                  number: '3',
                  title: 'Message Cards',
                  description: 'Include personalized notes with every gift.',
                ),
                const SizedBox(height: 20),
                _buildStepCard(
                  number: '4',
                  title: 'Lasting Impact',
                  description: 'Stand out with thoughtful, memorable gifts.',
                ),
              ],
            ),
          ),

          // Benefits section with gradient background
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, 0.50),
                end: Alignment(1.00, 0.50),
                colors: [const Color(0xFF54A801), const Color(0xFF214200)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildBenefitRow(
                  title: 'Pan India Free Delivery',
                  description: 'We deliver across India at no extra cost!',
                  iconData: Icons.local_shipping,
                ),
                const SizedBox(height: 75),
                _buildBenefitRow(
                  title: 'Min. 50 Hamper Orders',
                  description: 'Perfect for corporate & large-scale gifting!',
                  iconData: Icons.inventory_2,
                ),
                const SizedBox(height: 75),
                _buildBenefitRow(
                  title: 'Multi-Location Delivery',
                  description: 'Send gifts to multiple addresses hassle-free!',
                  iconData: Icons.location_on,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepCard({
    required String number,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with number and title
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: const Color(0xFF622700)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFFEE08),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(37),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      number,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          
          // Description
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withOpacity(0.50),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitRow({
    required String title,
    required String description,
    required IconData iconData,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icon container
        Container(
          width: 70,
          height: 70,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.00, 0.12),
              end: Alignment(1.00, 1.00),
              colors: [Colors.white.withOpacity(0.80), Colors.white.withOpacity(0.20)],
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.white.withOpacity(0.60),
              ),
              borderRadius: BorderRadius.circular(47),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x19FFFFFF),
                blurRadius: 20,
                offset: Offset(0, 20),
                spreadRadius: 0,
              )
            ],
          ),
          child: Center(
            child: Icon(
              iconData,
              color: Colors.white,
              size: 37,
            ),
          ),
        ),
        const SizedBox(width: 10),
        // Text content
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: 196,
              child: Text(
                description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
} 
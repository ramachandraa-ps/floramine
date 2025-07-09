import 'package:flutter/material.dart';

class WhatsIncludedSection extends StatelessWidget {
  const WhatsIncludedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 440,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 393,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/gifting/whats_included.png"),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 400,
                  child: Text(
                    'What\'s Included in Every Gift?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 31,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                _buildIncludedItem('Healthy, well-potted plant'),
                const SizedBox(height: 10),
                _buildIncludedItem('Care instruction tag'),
                const SizedBox(height: 10),
                _buildIncludedItem('Occasion-specific packaging'),
                const SizedBox(height: 10),
                _buildIncludedItem('Optional gift card with message'),
                const SizedBox(height: 10),
                _buildIncludedItem('Custom branding (for bulk/corporate orders)'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncludedItem(String text) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
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
            child: const Icon(
              Icons.check,
              size: 18,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black.withOpacity(0.80),
                fontSize: 19,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 
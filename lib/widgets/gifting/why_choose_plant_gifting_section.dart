import 'package:flutter/material.dart';

class WhyChoosePlantGiftingSection extends StatelessWidget {
  const WhyChoosePlantGiftingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 440,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 400,
            child: Text(
              'Why Choose Plant Gifting?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 37,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 1st reason - highlighted
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF54A801),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Icon(
                          Icons.eco_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 360,
                        child: Text(
                          'Long-lasting and eco-friendly',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                
                // 2nd reason
                _buildReasonCard(
                  icon: Icons.favorite_border,
                  text: 'Unique, thoughtful, and memorable',
                ),
                const SizedBox(height: 30),
                
                // 3rd reason
                _buildReasonCard(
                  icon: Icons.event_available_outlined,
                  text: 'Suitable for any occasion or event',
                ),
                const SizedBox(height: 30),
                
                // 4th reason
                _buildReasonCard(
                  icon: Icons.card_giftcard_outlined,
                  text: 'Customizable with pots, cards, and packaging',
                ),
                const SizedBox(height: 30),
                
                // 5th reason
                _buildReasonCard(
                  icon: Icons.trending_up_outlined,
                  text: 'Symbol of positivity, growth & prosperity',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildReasonCard({required IconData icon, required String text}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0x0C54A801),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: const Color(0x7F54A801),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: Icon(
              icon,
              color: const Color(0xFF54A801),
              size: 40,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 360,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 
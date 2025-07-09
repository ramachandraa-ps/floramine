import 'package:flutter/material.dart';

class HowToOrderSection extends StatelessWidget {
  const HowToOrderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 440,
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(color: const Color(0x1954A801)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title and description
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 340,
                  child: Text(
                    'How to Order?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 38,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 340,
                  child: Text(
                    'Make every gift special with personalized plants, custom planters, branded logos, and message cards—uniquely tailored to your vision.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.50),
                      fontSize: 22,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 30),
          
          // Steps container
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Step 1
                _buildOrderStep(
                  number: '1',
                  title: 'Choose a Category',
                  description: 'Corporate, Occasion, or Special gifts',
                ),
                
                const SizedBox(height: 20),
                
                // Step 2
                _buildOrderStep(
                  number: '2',
                  title: 'Pick a Plant or Combo',
                  description: 'Select from our curated collections or customize',
                ),
                
                const SizedBox(height: 20),
                
                // Step 3
                _buildOrderStep(
                  number: '3',
                  title: 'Add Personal Touch',
                  description: 'Choose pots, packaging & add a message',
                ),
                
                const SizedBox(height: 20),
                
                // Step 4
                _buildOrderStep(
                  number: '4',
                  title: 'We Deliver It Fresh & Fast',
                  description: 'Nationwide delivery \nwith care',
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 30),
          
          // Action buttons - using Column for better responsiveness
          LayoutBuilder(
            builder: (context, constraints) {
              // If container width is less than 380px, stack buttons vertically
              if (constraints.maxWidth < 380) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildStartGiftingButton(),
                    const SizedBox(height: 15),
                    _buildTalkToExpertButton(),
                  ],
                );
              } else {
                // Otherwise show buttons in a row
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildStartGiftingButton(),
                    const SizedBox(width: 15),
                    _buildTalkToExpertButton(),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStartGiftingButton() {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFF316300),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Start Gifting',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildTalkToExpertButton() {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.5,
            color: const Color(0xFF316300),
          ),
          borderRadius: BorderRadius.circular(26),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Talk to a Gift Expert',
            style: TextStyle(
              color: const Color(0xFF316300),
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderStep({
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
          // Step header with number and title
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
                Flexible(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          
          // Step description
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.50),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        ],
      ),
    );
  }
} 
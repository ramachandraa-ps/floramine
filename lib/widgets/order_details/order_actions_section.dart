import 'package:flutter/material.dart';
import '../../screens/view_review_screen.dart';
import '../../screens/replacement_expired_screen.dart';

class OrderActionsSection extends StatelessWidget {
  final String validTill;
  final VoidCallback? onDownloadInvoice;
  final VoidCallback? onGiveReview;
  final VoidCallback? onReplacement;
  final VoidCallback? onValidTillTap;
  final bool isExpired;

  const OrderActionsSection({
    Key? key,
    this.validTill = 'Valid Till March 24, 2025',
    this.onDownloadInvoice,
    this.onGiveReview,
    this.onReplacement,
    this.onValidTillTap,
    this.isExpired = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Download Invoice Button
          Container(
            width: double.infinity,
            height: 34,
            margin: EdgeInsets.only(bottom: 19),
            child: ElevatedButton(
              onPressed: onDownloadInvoice,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                backgroundColor: const Color(0x7FE3E3E3),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.50),
                  ),
                  borderRadius: BorderRadius.circular(26),
                ),
                elevation: 0,
              ),
              child: Text(
                'Download Invoice',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          
          // View Review Button
          Container(
            width: double.infinity,
            height: 34,
            margin: EdgeInsets.only(bottom: 19),
            child: ElevatedButton(
              onPressed: onGiveReview ?? () {
                // Navigate to ViewReviewScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ViewReviewScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                backgroundColor: const Color(0xFF622700), // Brown color as shown in the image
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
                elevation: 0,
              ),
              child: Text(
                'View Review',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          
          // Replacement Button
          Container(
            width: double.infinity,
            height: 34,
            margin: EdgeInsets.only(bottom: 19),
            child: OutlinedButton(
              onPressed: onReplacement,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                foregroundColor: const Color(0xFF316300),
                side: BorderSide(
                  width: 1,
                  color: const Color(0xFF316300),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
              child: Text(
                'Replacement',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          
          // Validity Info - Now clickable
          GestureDetector(
            onTap: onValidTillTap ?? () {
              // Show replacement expired dialog when validity text is tapped
              if (isExpired) {
                ReplacementExpiredScreen.show(context);
              }
            },
            behavior: HitTestBehavior.opaque, // Ensures the tap is detected even on transparent areas
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5), // Increased tap area
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center, // Center the text
                children: [
                  Text(
                    validTill,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF54A801),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  // Add a small hint to indicate it's clickable
                  if (isExpired)
                    const Text(
                      "(tap for details)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF54A801),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 
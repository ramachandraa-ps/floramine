import 'package:flutter/material.dart';

class OrderActionsSection extends StatelessWidget {
  final String validTill;
  final VoidCallback? onDownloadInvoice;
  final VoidCallback? onGiveReview;
  final VoidCallback? onReplacement;

  const OrderActionsSection({
    Key? key,
    this.validTill = 'Valid Till March 24, 2025',
    this.onDownloadInvoice,
    this.onGiveReview,
    this.onReplacement,
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
          
          // Give Review Button - Updated color to match the image
          Container(
            width: double.infinity,
            height: 34,
            margin: EdgeInsets.only(bottom: 19),
            child: ElevatedButton(
              onPressed: onGiveReview,
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
          
          // Validity Info
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Text(
                    validTill,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF54A801),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
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
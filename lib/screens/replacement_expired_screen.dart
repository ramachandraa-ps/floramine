import 'package:flutter/material.dart';

class ReplacementExpiredScreen extends StatelessWidget {
  final VoidCallback onClose;

  const ReplacementExpiredScreen({
    Key? key,
    required this.onClose,
  }) : super(key: key);

  // Static method to show this as a dialog
  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => ReplacementExpiredScreen(
        onClose: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        onTap: onClose, // Close when tapping outside
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white.withOpacity(0.2), // Semi-transparent background
          child: Center(
            child: _buildExpiredCard(context),
          ),
        ),
      ),
    );
  }

  // Build the expired card
  Widget _buildExpiredCard(BuildContext context) {
    return Container(
      width: 366,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 58,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Expired image
          Image.asset(
            'assets/images/replacement_expired.png',
            width: 324,
            height: 162,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 324,
                height: 162,
                color: Colors.grey.shade200,
                child: const Center(
                  child: Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.grey,
                    size: 50,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 30),
          
          // Expired message
          const Text(
            'Replacement Expired for this item',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0x80000000),
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 30),
          
          // Close button
          GestureDetector(
            onTap: onClose,
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFF316300),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

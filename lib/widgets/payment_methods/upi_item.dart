import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpiItem extends StatelessWidget {
  final String upiId;
  final String bankLogoUrl;
  final String? bankLogoAsset;

  const UpiItem({
    Key? key,
    required this.upiId,
    this.bankLogoUrl = '',
    this.bankLogoAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 30,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(
        children: [
          // Bank logo
          Container(
            width: 63,
            height: 22.29,
            child: bankLogoAsset != null
                ? Image.asset(
                    bankLogoAsset!,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback for when asset image fails to load
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE3F2FD),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'UPI',
                          style: TextStyle(
                            color: Color(0xFF0D47A1),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      );
                    },
                  )
                : bankLogoUrl.isNotEmpty
                    ? Image.network(
                        bankLogoUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Fallback for when network image fails to load
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE3F2FD),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'UPI',
                              style: TextStyle(
                                color: Color(0xFF0D47A1),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          );
                        },
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE3F2FD),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'UPI',
                          style: TextStyle(
                            color: Color(0xFF0D47A1),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
          ),
          
          // UPI ID
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              upiId,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          
          // Action buttons
          Positioned(
            right: 0,
            top: 10,
            child: Row(
              children: [
                // Copy button
                GestureDetector(
                  onTap: () {
                    // Copy UPI ID to clipboard
                    Clipboard.setData(ClipboardData(text: upiId));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('UPI ID copied to clipboard')),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.copy,
                          size: 16,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Copy',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Delete button
                GestureDetector(
                  onTap: () {
                    // Handle delete action
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_outline,
                          size: 16,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Delete',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
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
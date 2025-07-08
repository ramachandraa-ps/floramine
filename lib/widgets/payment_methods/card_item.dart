import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cardType;
  final String cardLogoUrl;
  final String? cardLogoAsset;

  const CardItem({
    Key? key,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cardType,
    this.cardLogoUrl = '',
    this.cardLogoAsset,
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
          // Main card content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First line: logo + card number
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 48,
                    height: 16,
                    child: cardLogoAsset != null
                        ? Image.asset(
                            cardLogoAsset!,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Text(
                                'VISA',
                                style: TextStyle(
                                  color: Color(0xFF1565C0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              );
                            },
                          )
                        : cardLogoUrl.isNotEmpty
                            ? Image.network(
                                cardLogoUrl,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return Text(
                                    'VISA',
                                    style: TextStyle(
                                      color: Color(0xFF1565C0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  );
                                },
                              )
                            : Text(
                                'VISA',
                                style: TextStyle(
                                  color: Color(0xFF1565C0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    cardNumber,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              // All other details start from here (no logo)
              Text(
                'Name',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                cardHolderName,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Expires on',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                expiryDate,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          // Card type badge
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
              decoration: ShapeDecoration(
                color: const Color(0x7F27DBE5),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
              ),
              child: Text(
                cardType,
                style: const TextStyle(
                  color: Color(0xFF002D61),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          // Delete button
          Positioned(
            right: 0,
            top: 30,
            child: GestureDetector(
              onTap: () {
                // Handle delete action
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.delete_outline,
                      size: 16,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Delete',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 
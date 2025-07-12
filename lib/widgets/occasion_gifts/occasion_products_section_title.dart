import 'package:flutter/material.dart';

class OccasionProductsSectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAllPressed;

  const OccasionProductsSectionTitle({
    Key? key,
    required this.title,
    this.onViewAllPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w700,
            ),
          ),
          if (onViewAllPressed != null)
            GestureDetector(
              onTap: onViewAllPressed,
              child: const Text(
                'View All',
                style: TextStyle(
                  color: Color(0xFF54A801),
                  fontSize: 14,
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
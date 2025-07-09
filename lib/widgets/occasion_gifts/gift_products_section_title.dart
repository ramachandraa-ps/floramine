import 'package:flutter/material.dart';

class GiftProductsSectionTitle extends StatelessWidget {
  final String title;
  final String description;

  const GiftProductsSectionTitle({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
} 
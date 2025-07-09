import 'package:flutter/material.dart';

class GiftProductsSectionTitle extends StatelessWidget {
  final String title;
  final String description;

  const GiftProductsSectionTitle({
    Key? key,
    this.title = 'Featured Gift Plants',
    this.description = 'Explore our curated selection of plant gifts designed to enhance your gifting experience. Each plant is carefully chosen to bring joy and lasting memories.',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              color: Colors.black.withOpacity(0.60),
              fontSize: 16,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
} 
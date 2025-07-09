import 'package:flutter/material.dart';

class BundleProductsSectionTitle extends StatelessWidget {
  final String title;
  final String description;

  const BundleProductsSectionTitle({
    Key? key,
    this.title = 'Featured Bundle Products',
    this.description = 'Explore our curated selection of plant bundles designed to enhance your gardening experience. Each bundle is carefully assembled for optimal plant growth and care.',
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
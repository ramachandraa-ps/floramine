import 'package:flutter/material.dart';
import '../widgets/product_details/no_reviews_widget.dart';

class NoReviewsDemoScreen extends StatelessWidget {
  const NoReviewsDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('No Reviews Demo'),
        backgroundColor: const Color(0xFF54A801),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NoReviewsWidget(
              onWriteReviewPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Write a review button pressed')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
} 
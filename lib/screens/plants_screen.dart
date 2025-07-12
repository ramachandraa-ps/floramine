import 'package:flutter/material.dart';

class PlantsScreen extends StatefulWidget {
  const PlantsScreen({Key? key}) : super(key: key);

  @override
  _PlantsScreenState createState() => _PlantsScreenState();
}

class _PlantsScreenState extends State<PlantsScreen> {
  @override
  void initState() {
    super.initState();
    
    // Redirect to the products screen with plants category
    // Note: The actual UI with scrollable content is in products_screen.dart
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(
        context,
        '/products',
        arguments: {'category': 'plants'},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // This will only show briefly before redirecting
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
} 
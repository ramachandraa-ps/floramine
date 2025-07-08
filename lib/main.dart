import 'package:flutter/material.dart';
import 'dart:async';
import 'splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/order_details_screen.dart';
import 'screens/view_review_screen.dart';
import 'screens/about_us_screen.dart';
import 'screens/help_screen.dart';
import 'screens/notification_screen.dart';
import 'widgets/bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floramine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF54A801)),
        fontFamily: 'Poppins',
      ),
      home: const SplashPage(),
      // Define named routes for navigation
      routes: {
        '/plants': (context) => const HomeScreen(),
        '/categories': (context) => const CategoriesScreen(),
        '/cart': (context) => const CartScreen(),
        '/orders': (context) => const OrderDetailsScreen(),
        '/help': (context) => const HelpScreen(),
        '/notification': (context) => const NotificationScreen(),
      },
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

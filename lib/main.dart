import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'providers/category_provider.dart';
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
import 'screens/toast_demo_screen.dart';
import 'screens/checkout_step1.dart';
import 'screens/order_success_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/communication_preferences_screen.dart';
import 'screens/payment_methods_screen.dart';
import 'screens/my_profile_screen.dart';
import 'screens/my_addresses_screen.dart';
import 'screens/support_ticket_screen.dart';
import 'screens/ticket_details_screen.dart';
import 'screens/create_ticket_screen.dart';
import 'screens/chat_with_us.dart';
import 'screens/faq_screen.dart';
import 'screens/search_screen.dart';
import 'screens/empty_cart_screen.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'screens/blog_details_screen.dart';
import 'screens/gifting_screen.dart';
import 'screens/corporate_gifting_screen.dart';
import 'screens/special_day_gifts_screen.dart';
import 'screens/occasion_gifts_screen.dart';
import 'screens/no_reviews_demo_screen.dart';
import 'screens/rental_services_screen.dart';
import 'screens/bundles_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
        '/toast-demo': (context) => const ToastDemoScreen(),
        '/checkout': (context) => const CheckoutStep1Screen(),
        '/order-success': (context) => const OrderSuccessScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/communication-preferences': (context) => const CommunicationPreferencesScreen(),
        '/payment-methods': (context) => const PaymentMethodsScreen(),
        '/my-profile': (context) => const MyProfileScreen(),
        '/my-addresses': (context) => const MyAddressesScreen(),
        '/support-ticket': (context) => const SupportTicketScreen(),
        '/ticket-details': (context) => const TicketDetailsScreen(),
        '/create-ticket': (context) => const CreateTicketScreen(),
        '/chat-with-us': (context) => const ChatWithUsScreen(),
        '/faq': (context) => const FAQScreen(),
        '/search': (context) => const SearchScreen(),
        '/empty-cart': (context) => const EmptyCartScreen(),
        '/blog_details_with_id': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return BlogDetailsScreen(blogId: args['blogId']);
        },
        '/gifting': (context) => const GiftingScreen(),
        '/corporate_gifting': (context) => const CorporateGiftingScreen(),
        '/special_day_gifts': (context) => const SpecialDayGiftsScreen(),
        '/occasion_gifts': (context) => const OccasionGiftsScreen(),
        '/no_reviews_demo': (context) => const NoReviewsDemoScreen(),
        '/rental_services': (context) => const RentalServicesScreen(),
        '/bundles': (context) => const BundlesScreen(),
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

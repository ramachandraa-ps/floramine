import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NavigationItem _currentItem = NavigationItem.plants;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Floramine',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildCurrentScreen(),
          ),
          CustomBottomNavigationBar(
            currentItem: _currentItem,
            onItemSelected: (item) {
              setState(() {
                _currentItem = item;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentScreen() {
    switch (_currentItem) {
      case NavigationItem.plants:
        return _buildPlaceholderScreen('Plants Screen', const Color(0xFFD8EACF));
      case NavigationItem.categories:
        return _buildPlaceholderScreen('Categories Screen', const Color(0xFFCCE6F9));
      case NavigationItem.cart:
        return _buildPlaceholderScreen('Cart Screen', const Color(0xFFF9E8CC));
      case NavigationItem.orders:
        return _buildPlaceholderScreen('Orders Screen', const Color(0xFFE8CCF9));
      case NavigationItem.help:
        return _buildPlaceholderScreen('Help Screen', const Color(0xFFCCF9F3));
    }
  }

  Widget _buildPlaceholderScreen(String title, Color backgroundColor) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
} 
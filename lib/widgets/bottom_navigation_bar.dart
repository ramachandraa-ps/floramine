import 'package:flutter/material.dart';

enum NavigationItem {
  plants,
  categories,
  cart,
  orders,
  help
}

class CustomBottomNavigationBar extends StatelessWidget {
  final NavigationItem currentItem;
  final Function(NavigationItem) onItemSelected;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentItem,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 7,
            spreadRadius: 3,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(NavigationItem.plants, "Plants", Icons.home_outlined),
              _buildNavItem(NavigationItem.categories, "Categories", Icons.grid_view),
              _buildNavItem(NavigationItem.cart, "Cart", Icons.shopping_cart_outlined),
              _buildNavItem(NavigationItem.orders, "Orders", Icons.local_florist_outlined),
              _buildNavItem(NavigationItem.help, "Help", Icons.help_outline),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(NavigationItem item, String label, IconData icon) {
    final bool isSelected = currentItem == item;
    final Color color = isSelected ? const Color(0xFF54A801) : Colors.black;

    return GestureDetector(
      onTap: () => onItemSelected(item),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Green indicator line at the top when selected
          Container(
            width: 60,
            height: 3,
            color: isSelected ? const Color(0xFF54A801) : Colors.transparent,
            margin: const EdgeInsets.only(bottom: 5),
          ),
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
} 
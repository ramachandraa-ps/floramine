import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;

  const HeaderWidget({
    Key? key,
    this.onNotificationTap,
    this.onProfileTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo section
          Container(
            height: 40,
            child: Image.asset(
              'assets/images/floramine_logo.png',
              fit: BoxFit.contain,
            ),
          ),
          
          // Notification and Profile section
          Row(
            children: [
              // Notification bell with increased tap area
              GestureDetector(
                onTap: () {
                  // Use provided callback if available, otherwise use universal navigation
                  if (onNotificationTap != null) {
                    onNotificationTap!();
                  } else {
                    // Universal navigation to notification screen using named route
                    Navigator.of(context).pushNamed('/notification');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/header/notification_bell.png',
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: onProfileTap,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF54A801),
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/header/user.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 
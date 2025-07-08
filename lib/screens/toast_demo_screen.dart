import 'package:flutter/material.dart';
import '../widgets/toast_widget.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/header_widget.dart';

class ToastDemoScreen extends StatelessWidget {
  const ToastDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            HeaderWidget(
              onNotificationTap: () {
                Navigator.of(context).pushNamed('/notification');
              },
              onProfileTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profile tapped')),
                );
              },
            ),
            
            // Title
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Toast Examples',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cabin',
                ),
              ),
            ),
            
            // Toast examples
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Success toast
                    ToastWidget(
                      title: 'Success Toast',
                      message: 'Your action was completed successfully',
                      actionText: 'Action',
                      onActionPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Success action pressed')),
                        );
                      },
                      toastType: ToastType.success,
                    ),
                    const SizedBox(height: 16),
                    
                    // Info toast
                    ToastWidget(
                      title: 'Info Toast',
                      message: 'Here is some important information',
                      actionText: 'Action',
                      onActionPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Info action pressed')),
                        );
                      },
                      toastType: ToastType.info,
                    ),
                    const SizedBox(height: 16),
                    
                    // Warning toast
                    ToastWidget(
                      title: 'Warning Toast',
                      message: 'Please be careful with this action',
                      actionText: 'Action',
                      onActionPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Warning action pressed')),
                        );
                      },
                      toastType: ToastType.warning,
                    ),
                    const SizedBox(height: 16),
                    
                    // Error toast
                    ToastWidget(
                      title: 'Error Toast',
                      message: 'Something went wrong, please try again',
                      actionText: 'Action',
                      onActionPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Error action pressed')),
                        );
                      },
                      toastType: ToastType.error,
                    ),
                    const SizedBox(height: 32),
                    
                    // Button to show toast as overlay
                    ElevatedButton(
                      onPressed: () {
                        ToastService.showToast(
                          context: context,
                          title: 'Overlay Toast',
                          message: 'This toast appears as an overlay',
                          actionText: 'Dismiss',
                          onActionPressed: () {
                            // This will be handled by the ToastService
                          },
                          toastType: ToastType.success,
                          duration: const Duration(seconds: 5),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF54A801),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: const Text('Show Overlay Toast'),
                    ),
                  ],
                ),
              ),
            ),
            
            // Bottom navigation
            CustomBottomNavigationBar(
              currentItem: NavigationItem.plants,
              onItemSelected: (item) {
                if (item != NavigationItem.plants) {
                  CustomBottomNavigationBar.navigateTo(context, item);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
} 
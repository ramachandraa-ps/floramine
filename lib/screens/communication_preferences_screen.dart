import 'package:flutter/material.dart';

class CommunicationPreferencesScreen extends StatefulWidget {
  const CommunicationPreferencesScreen({Key? key}) : super(key: key);

  @override
  State<CommunicationPreferencesScreen> createState() => _CommunicationPreferencesScreenState();
}

class _CommunicationPreferencesScreenState extends State<CommunicationPreferencesScreen> {
  // Track which communication methods are enabled
  Map<String, bool> preferences = {
    'Email': true,
    'SMS': true,
    'Phone Call': false,
    'App Notification': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header with gradient background
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, 0.50),
                end: Alignment(1.00, 0.50),
                colors: [Color(0xFF54A801), Color(0xFF214200)],
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Back button
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: Color(0xFFE4E4E4),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: Color(0xFF54A801),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    
                    // Title - Reduce font size to prevent overflow
                    const Expanded(
                      child: Text(
                        'Communication Preferences',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Cabin',
                          fontWeight: FontWeight.w700,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    
                    // First row
                    Row(
                      children: [
                        Expanded(
                          child: _buildCommunicationCard(
                            title: 'Email',
                            description: 'Receive updates and offers via your mail',
                            iconData: Icons.email_outlined,
                            isSelected: preferences['Email']!,
                            onTap: () => _togglePreference('Email'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildCommunicationCard(
                            title: 'SMS',
                            description: 'Get Quick Updated on phone',
                            iconData: Icons.chat_bubble_outline,
                            isSelected: preferences['SMS']!,
                            onTap: () => _togglePreference('SMS'),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Second row
                    Row(
                      children: [
                        Expanded(
                          child: _buildCommunicationCard(
                            title: 'Phone Call',
                            description: 'Talk our support team for important updates',
                            iconData: Icons.phone_outlined,
                            isSelected: preferences['Phone Call']!,
                            onTap: () => _togglePreference('Phone Call'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildCommunicationCard(
                            title: 'App Notification',
                            description: 'Stay updated directly through the app',
                            iconData: Icons.notifications_outlined,
                            isSelected: preferences['App Notification']!,
                            onTap: () => _togglePreference('App Notification'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Save button at the bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0, left: 20.0, right: 20.0, top: 8.0),
            child: GestureDetector(
              onTap: _savePreferences,
              child: Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: ShapeDecoration(
                  color: const Color(0xFF316300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildCommunicationCard({
    required String title,
    required String description,
    required IconData iconData,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 30,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon circle - Reduce size
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color(0x1954A801),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      iconData,
                      size: 30,
                      color: const Color(0xFF316300),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                // Description - Ensure it fits by using Expanded
                Expanded(
                  child: Text(
                    description,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
            // Checkbox in top right
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF54A801) : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void _togglePreference(String key) {
    setState(() {
      preferences[key] = !preferences[key]!;
    });
  }
  
  void _savePreferences() {
    // Here you would typically save the preferences to a backend or local storage
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Preferences saved successfully'),
        backgroundColor: Color(0xFF54A801),
      ),
    );
    
    // Navigate back after saving
    Navigator.pop(context);
  }
}

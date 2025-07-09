import 'package:flutter/material.dart';

class EmptyAddressesScreen extends StatelessWidget {
  const EmptyAddressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header with gradient background
          Container(
            width: double.infinity,
            height: 110,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, 0.50),
                end: Alignment(1.00, 0.50),
                colors: [Color(0xFF54A801), Color(0xFF214200)],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    // Back button
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40,
                        height: 40,
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
                    const SizedBox(width: 20),
                    // Screen title
                    const Text(
                      'My Addresses',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Empty addresses content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Map illustration
                  Container(
                    width: double.infinity,
                    height: 261,
                    child: Image.asset(
                      'assets/images/empty_map.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildMapPlaceholder();
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // No address found text
                  Text(
                    'No Address Found !',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  // Additional information text
                  Text(
                    'Add the New a address where you want to deliver',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.3),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 40),
                  
                  // Add new address button
                  InkWell(
                    onTap: () {
                      // Navigate to add address screen (would be implemented in a real app)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Add new address functionality would go here')),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFFFAB9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFEE08),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Text(
                            'Add New Address',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Add floating action button to return to addresses screen
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: const Color(0xFF54A801),
        child: const Icon(Icons.location_on),
        tooltip: 'View Addresses',
      ),
    );
  }

  // Fallback map placeholder if asset is not available
  Widget _buildMapPlaceholder() {
    return Container(
      width: double.infinity,
      height: 261,
      color: Colors.grey[100],
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Simplified map
          Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          
          // Location pin
          Positioned(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey[400]!,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.location_off,
                    color: Colors.grey[500],
                    size: 30,
                  ),
                ),
                
                // Pin pointer
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          
          // Map features - roads
          Positioned(
            left: 50,
            top: 80,
            child: Container(
              width: 100,
              height: 2,
              color: Colors.grey[400],
            ),
          ),
          Positioned(
            right: 50,
            bottom: 60,
            child: Container(
              width: 120,
              height: 2,
              color: Colors.grey[400],
            ),
          ),
          
          // Map features - landmarks
          Positioned(
            left: 80,
            bottom: 40,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          Positioned(
            right: 90,
            top: 50,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 
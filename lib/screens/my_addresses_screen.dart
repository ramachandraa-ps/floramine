import 'package:flutter/material.dart';

class MyAddressesScreen extends StatelessWidget {
  const MyAddressesScreen({Key? key}) : super(key: key);

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
                    const SizedBox(width: 20),
                    
                    // Title
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
          
          // Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Add New Address Button
                  _buildAddNewAddressButton(context),
                  
                  // Address Cards
                  _buildAddressCardsSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Add New Address Button
  Widget _buildAddNewAddressButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: GestureDetector(
        onTap: () {
          // Handle add new address tap
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Add New Address tapped')),
          );
        },
        child: Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: ShapeDecoration(
            color: const Color(0xFFFFFAB9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              const SizedBox(width: 10),
              const Text(
                'Add New Address',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Address Cards Section
  Widget _buildAddressCardsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Address Card (Default)
          _AddressCard(
            name: 'Santhosh',
            addressLine1: '12B/127, Alagar Street Madurai',
            addressLine2: 'Tamil Nadu - 625009',
            phone: '+91 86086 02541',
            type: 'Home',
            isDefault: true,
          ),
          const SizedBox(height: 30),
          // Second Address Card
          _AddressCard(
            name: 'Santhosh',
            addressLine1: '12B/127, Alagar Street, Madurai',
            addressLine2: 'Tamil Nadu - 625009',
            phone: '+91 86086 02541',
            type: 'Work',
            isDefault: false,
          ),
          const SizedBox(height: 30),
          // Divider
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.black.withOpacity(0.10),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  final String name;
  final String addressLine1;
  final String addressLine2;
  final String phone;
  final String type;
  final bool isDefault;

  const _AddressCard({
    Key? key,
    required this.name,
    required this.addressLine1,
    required this.addressLine2,
    required this.phone,
    required this.type,
    this.isDefault = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 30,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 20,
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: ShapeDecoration(
                      color: const Color(0x7FE5D827),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (type == 'Home')
                          const Icon(
                            Icons.home,
                            size: 10,
                            color: Colors.black,
                          ),
                        if (type == 'Work')
                          const Icon(
                            Icons.work,
                            size: 10,
                            color: Colors.black,
                          ),
                        const SizedBox(width: 4),
                        Text(
                          type,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                addressLine1,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                addressLine2,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                phone,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Handle edit address
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Edit address tapped')),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Handle delete address
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Delete address tapped')),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Delete',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (isDefault)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 108,
              height: 31,
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
              decoration: ShapeDecoration(
                color: const Color(0xFF54A801),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'Default',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

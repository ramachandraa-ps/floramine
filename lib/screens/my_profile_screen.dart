import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

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
                      'My Profile',
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name Field
                    _buildFormField(
                      label: 'Name',
                      value: 'Santhosh',
                      hasBorder: true,
                      isHighlighted: true,
                    ),
                    const SizedBox(height: 20),

                    // Phone Number Field
                    _buildFormField(
                      label: 'Phone Number',
                      value: '|',
                      hasBorder: false,
                      isHighlighted: false,
                    ),
                    const SizedBox(height: 20),

                    // Email ID Field
                    _buildFormField(
                      label: 'Email ID',
                      value: '|',
                      hasBorder: false,
                      isHighlighted: false,
                    ),
                    const SizedBox(height: 20),

                    // Change Password Field
                    _buildFormField(
                      label: 'Change Password',
                      value: '*********',
                      hasBorder: false,
                      isHighlighted: false,
                      hasIcon: true,
                      onIconTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      isObscured: !_isPasswordVisible,
                    ),
                    const SizedBox(height: 20),

                    // Confirm Password Field
                    _buildFormField(
                      label: 'Confirm Password',
                      value: '*************',
                      hasBorder: false,
                      isHighlighted: false,
                      hasIcon: true,
                      onIconTap: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                        });
                      },
                      isObscured: !_isConfirmPasswordVisible,
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Save button at the bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0, left: 24.0, right: 24.0),
            child: GestureDetector(
              onTap: _saveProfile,
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
  
  Widget _buildFormField({
    required String label,
    required String value,
    bool hasBorder = false,
    bool isHighlighted = false,
    bool hasIcon = false,
    VoidCallback? onIconTap,
    bool isObscured = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFFF0F0F0),
            shape: RoundedRectangleBorder(
              side: hasBorder
                  ? const BorderSide(
                      width: 1,
                      color: Color(0xFF54A801),
                    )
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child: Row(
            mainAxisAlignment: hasIcon ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: isHighlighted
                      ? const Color(0xFF316300)
                      : Colors.black.withOpacity(0.50),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (hasIcon)
                GestureDetector(
                  onTap: onIconTap,
                  child: Icon(
                    isObscured ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black.withOpacity(0.5),
                    size: 20,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
  
  void _saveProfile() {
    // Here you would typically save the profile data to a backend or local storage
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile saved successfully'),
        backgroundColor: Color(0xFF54A801),
      ),
    );
    
    // Navigate back after saving
    Navigator.pop(context);
  }
}

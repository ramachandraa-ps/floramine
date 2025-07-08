import 'package:flutter/material.dart';

class CreateTicketScreen extends StatefulWidget {
  const CreateTicketScreen({Key? key}) : super(key: key);

  @override
  State<CreateTicketScreen> createState() => _CreateTicketScreenState();
}

class _CreateTicketScreenState extends State<CreateTicketScreen> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _subjectController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      'Create Ticket',
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
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subject field
                    const Text(
                      'Subject',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 50,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF0F0F0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: TextField(
                        controller: _subjectController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Subject',
                          hintStyle: TextStyle(
                            color: Color(0x80000000),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Description field
                    const Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 120,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF0F0F0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: TextField(
                        controller: _descriptionController,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: 'Write Something...',
                          hintStyle: TextStyle(
                            color: Color(0x80000000),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Photo upload
                    const Text(
                      'Photo',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        // Handle photo upload
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Photo upload tapped')),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 170,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF0F0F0),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              style: BorderStyle.solid,
                              color: Color(0xFF54A801),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                color: Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              ),
                              child: const Icon(
                                Icons.image,
                                size: 30,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Drag & Drop or Upload a photo',
                              style: TextStyle(
                                color: Color(0x80000000),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Create button
                    GestureDetector(
                      onTap: () {
                        // Handle create ticket
                        if (_subjectController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please enter a subject')),
                          );
                          return;
                        }
                        
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Ticket created successfully')),
                        );
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF316300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Create',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 24,
                              height: 24,
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 20,
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
          ),
        ],
      ),
    );
  }
}

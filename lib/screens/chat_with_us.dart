import 'package:flutter/material.dart';

class ChatWithUsScreen extends StatefulWidget {
  const ChatWithUsScreen({Key? key}) : super(key: key);

  @override
  State<ChatWithUsScreen> createState() => _ChatWithUsScreenState();
}

class _ChatWithUsScreenState extends State<ChatWithUsScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
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
                    
                    // User profile and name
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: ShapeDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/images/user_profile.png'),
                              fit: BoxFit.cover,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(73),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'Kishor',
                          style: TextStyle(
                            color: Color(0xFFF2F2F7),
                            fontSize: 22,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Timestamp
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: const Text(
              'Wed 6:55 AM',
              style: TextStyle(
                color: Color(0xFFAAAAAA),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          
          // Chat messages
          Expanded(
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                // Admin message
                Align(
                  alignment: Alignment.centerLeft,
                  child: _buildAdminMessage('I would be glad to help'),
                ),
                
                const SizedBox(height: 12),
                
                // User messages
                Align(
                  alignment: Alignment.centerRight,
                  child: _buildUserMessage('Actually there is.'),
                ),
                
                const SizedBox(height: 4),
                
                Align(
                  alignment: Alignment.centerRight,
                  child: _buildUserMessage('I need to know the privacy policy of your business in a very short summary.'),
                ),
                
                const SizedBox(height: 4),
                
                Align(
                  alignment: Alignment.centerRight,
                  child: _buildUserMessage('And one more thing.'),
                ),
                
                // Time indicator
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4, right: 8, bottom: 16),
                    child: Text(
                      'Sent 16h ago',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: const Color(0xFFAAAAAA),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Message input field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Color(0xFFE6E6E6),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                // Add attachment button
                IconButton(
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: Color(0xFF54A801),
                  ),
                  onPressed: () {
                    // Handle add attachment
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 36,
                  ),
                ),
                
                // Add image button
                IconButton(
                  icon: const Icon(
                    Icons.photo_outlined,
                    color: Color(0xFF54A801),
                  ),
                  onPressed: () {
                    // Handle add image
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 36,
                  ),
                ),
                
                // Text input field
                Expanded(
                  child: Container(
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6E6E6),
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Aa',
                        hintStyle: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 14,
                          fontFamily: 'Inter',
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                      ),
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ),
                ),
                
                // Send button
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Color(0xFF54A801),
                  ),
                  onPressed: () {
                    // Handle send message
                    if (_messageController.text.isNotEmpty) {
                      // In a real app, you would send the message to a backend
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Message sent: ${_messageController.text}')),
                      );
                      _messageController.clear();
                      
                      // Scroll to bottom after sending message
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    }
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 36,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  // Admin message bubble
  Widget _buildAdminMessage(String message) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: const ShapeDecoration(
        color: Color(0xFF2D2D2E),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFF444446),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ),
      child: Text(
        message,
        style: const TextStyle(
          color: Color(0xFFF2F2F7),
          fontSize: 15,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
  
  // User message bubble
  Widget _buildUserMessage(String message) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      margin: const EdgeInsets.only(bottom: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: const ShapeDecoration(
        color: Color(0xFF54A801),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
      ),
      child: Text(
        message,
        style: const TextStyle(
          color: Color(0xFFF2F2F7),
          fontSize: 15,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

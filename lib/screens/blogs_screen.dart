import 'package:flutter/material.dart';
import '../screens/blog_details_screen.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  // Sample blog data
  final List<Map<String, dynamic>> _blogs = [
    {
      "id": "1",
      "title": "How Often Should You Water Your Plants?",
      "image": "assets/images/blogs/monsoon_gardening.png",
      "date": "April 15, 2025",
      "description": "Learn the proper watering techniques for different types of plants to keep them healthy and thriving.",
    },
    {
      "id": "2",
      "title": "Indoor Plants That Thrive in Low Light",
      "image": "assets/images/blogs/parijat_tree.png",
      "date": "March 22, 2025",
      "description": "Discover beautiful houseplants that can flourish even in apartments with limited natural light.",
    },
    {
      "id": "3",
      "title": "Natural Pest Control for Your Garden",
      "image": "assets/images/blogs/maghai_pan.png",
      "date": "February 8, 2025",
      "description": "Keep pests away from your garden using these effective and eco-friendly natural methods.",
    },
    {
      "id": "4",
      "title": "Seasonal Gardening: Spring Edition",
      "image": "assets/images/blogs/monsoon_gardening.png",
      "date": "January 30, 2025",
      "description": "Get your garden ready for spring with these essential tips and plant recommendations.",
    },
  ];

  bool _showingMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button and title
            _buildHeader(context),
            
            // Blog content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                children: [
                  // Display blogs
                  ..._blogs.map((blog) => _buildBlogCard(context, blog)).toList(),
                  
                  // Load more button
                  if (!_showingMore)
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 30),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _showingMore = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF54A801),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'Load More',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xFF54A801),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // Back button
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 16,
                color: Colors.black54,
              ),
            ),
          ),
          const SizedBox(width: 16),
          
          // Title
          const Text(
            'Blogs',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlogCard(BuildContext context, Map<String, dynamic> blog) {
    return GestureDetector(
      onTap: () {
        // Navigate to blog details screen
        Navigator.pushNamed(
          context,
          '/blog_details_with_id',
          arguments: {'blogId': blog['id']},
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blog image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                blog['image'],
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.image_not_supported,
                      color: Colors.grey[600],
                      size: 50,
                    ),
                  );
                },
              ),
            ),
            
            // Blog content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date
                  Text(
                    blog['date'],
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Title
                  Text(
                    blog['title'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Description
                  Text(
                    blog['description'],
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  // Read more link
                  Row(
                    children: [
                      Text(
                        'Read More',
                        style: TextStyle(
                          color: const Color(0xFF54A801),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF54A801),
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
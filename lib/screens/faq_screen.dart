import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  // Track expanded state for each FAQ item
  final Map<int, bool> _expandedItems = {0: true}; // First item expanded by default

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
                      'FAQ',
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
          
          // FAQ content
          Expanded(
            child: _buildFAQContent(MediaQuery.of(context).size.width),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQContent(double contentWidth) {
    // FAQ data
    final List<Map<String, String>> faqItems = [
      {
        "question": "What types of plants do you sell?",
        "answer": "We offer a wide variety of indoor and outdoor plants, including flowering plants, succulents, shrubs, trees, herbs, and seasonal blooms. Our stock changes with the seasons to offer the best selections."
      },
      {
        "question": "Do you provide landscaping services?",
        "answer": "Yes, we offer comprehensive landscaping services including design, installation, and maintenance. Our team of experts can help transform your outdoor space with beautiful plant arrangements, hardscaping elements, and ongoing care plans."
      },
      {
        "question": "Can I shop online?",
        "answer": "Absolutely! Our website offers our full inventory for online shopping with detailed plant descriptions, care instructions, and high-quality images. We provide secure checkout and various delivery options for your convenience."
      },
      {
        "question": "Do you deliver plants?",
        "answer": "Yes, we offer delivery services for all our products. Local deliveries are available within a 25-mile radius of our store, while nationwide shipping is available for select plants that can travel well. Delivery fees vary based on distance and order size."
      },
      {
        "question": "How do I take care of the plant I bought?",
        "answer": "Each plant has specific care requirements, which we provide on a care card with every purchase. Generally, consider factors like light exposure, watering frequency, humidity, and temperature. Our staff is always available to provide personalized advice for your specific plants."
      },
      {
        "question": "What if my plant dies shortly after purchase?",
        "answer": "We stand behind the quality of our plants. If your plant dies within 30 days of purchase despite following proper care instructions, please contact us with your receipt and a photo of the plant. We offer replacements or store credit depending on the circumstances."
      },
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // FAQ items
            ...List.generate(faqItems.length, (index) {
              return _buildFAQItem(
                index: index,
                question: faqItems[index]["question"]!,
                answer: faqItems[index]["answer"]!,
                isExpanded: _expandedItems[index] ?? false,
              );
            }),
            
            // Load more button
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: InkWell(
                  onTap: () {
                    // Handle load more action
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Loading more FAQs...')),
                    );
                  },
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Load More +',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem({
    required int index,
    required String question,
    required String answer,
    required bool isExpanded,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.10),
          ),
        ),
        shadows: [
          BoxShadow(
            color: const Color(0x19000000),
            blurRadius: 30,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Question row with expand/collapse functionality
          InkWell(
            onTap: () {
              setState(() {
                _expandedItems[index] = !isExpanded;
              });
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      question,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          
          // Answer - only visible when expanded
          if (isExpanded)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: Text(
                answer,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1.65,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

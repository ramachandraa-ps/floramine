import 'package:flutter/material.dart';

class BlogDetailsScreen extends StatelessWidget {
  final String blogId;
  
  const BlogDetailsScreen({
    Key? key, 
    required this.blogId,
  }) : super(key: key);

  // Static method for navigation
  static void navigateTo(BuildContext context, String blogId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlogDetailsScreen(blogId: blogId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get blog data based on ID
    final blogData = getBlogById(blogId);
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button and title
            _buildHeader(context),
            
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Blog content section
                    BlogContentSection(
                      title: blogData["title"],
                      imageUrl: blogData["image"],
                      content: blogData["content"],
                      author: blogData["author"],
                      authorImage: blogData["authorImage"],
                      date: blogData["date"],
                    ),
                    
                    // Comments section
                    const CommentsSection(),
                    
                    // Related articles section
                    const RelatedArticlesSection(),
                    
                    // Bottom spacing
                    const SizedBox(height: 30),
                  ],
                ),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side - Back button and title
          Row(
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
                'Blogs Details',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          
          // Right side - Share button
          IconButton(
            icon: const Icon(
              Icons.share,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              // Share functionality would go here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Share functionality coming soon'),
                  backgroundColor: Color(0xFF316300),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Map<String, dynamic> getBlogById(String id) {
  // Sample blog data
  final List<Map<String, dynamic>> blogs = [
    {
      "id": "1",
      "title": "How Often Should You Water Your Plants?",
      "image": "assets/images/blogs/monsoon_gardening.png",
      "date": "April 15, 2025",
      "author": "Sarah Johnson",
      "authorImage": "assets/images/testimonials/user1.png",
      "content": "One of the most common questions among new plant owners is, \"How often should I water my plants?\" While it might seem like there should be a straightforward answer, watering needs vary depending on plant species, soil type, indoor conditions, and the time of year. Understanding these factors can help you avoid two of the biggest plant killers: overwatering and underwatering.\n\nTo start, it's essential to know your plant type. Succulents and cacti, for example, store water in their leaves and only need watering once every 10 to 14 days. In contrast, tropical plants like monstera or peace lilies prefer consistently moist soil and generally need to be watered every 5 to 7 days. Plants like ferns, which love moisture, may even need water every 3 to 5 days, especially in dry indoor environments.\n\nInstead of watering on a strict schedule, it's better to check the soil moisture before watering. Insert your finger about an inch into the soil; \nif it feels dry at that depth, it's time to water. If it still feels damp, it's best to wait another day or two. For even more accurate monitoring, consider using a moisture meter.\n\nEnvironmental factors also play a big role. In summer, most plants require more frequent watering due to increased evaporation from heat and sunlight. During winter, many houseplants enter a dormant state and require far less moisture. Humidity levels in your home matter as well—plants in dry air environments may need more frequent watering, while high-humidity conditions help retain soil moisture longer.\n\nHow you water your plants matters, too. Always water deeply so moisture reaches the root zone, and ensure your pots have proper drainage to prevent root rot. Avoid letting water sit in saucers beneath your pots. For sensitive or root-bound plants, bottom watering—placing the pot in a tray of water and letting it soak up from below—can be an effective method.\n\nIt's also important to recognize signs of watering problems. Overwatered plants often develop yellowing leaves, mushy stems, and even moldy soil or root rot. Underwatered plants, on the other hand, may have dry, curling leaves, brown tips, or appear to droop despite sufficient sunlight.\n\nIn conclusion, there's no universal schedule for watering your plants. By observing your plant's behavior, checking the soil regularly, and adjusting to environmental conditions, you'll soon find the right rhythm. With consistent care, your plants will reward you with lush, healthy growth."
    },
    {
      "id": "2",
      "title": "Indoor Plants That Thrive in Low Light",
      "image": "assets/images/blogs/parijat_tree.png",
      "date": "March 22, 2025",
      "author": "Michael Chen",
      "authorImage": "assets/images/testimonials/user2.png",
      "content": "Finding plants that can flourish in low-light conditions can be challenging, but many beautiful houseplants actually prefer indirect or filtered light. These plants are perfect for apartments with limited natural light, north-facing windows, or rooms where bright light is simply not available.\n\nThe ZZ Plant (Zamioculcas zamiifolia) is one of the most resilient low-light plants available. Its glossy, dark green leaves add a touch of elegance to any space, and it can thrive with minimal care. Similarly, the Snake Plant (Sansevieria) is nearly indestructible and can survive in very low light conditions while purifying the air.\n\nPothos (Epipremnum aureum) is another excellent choice with its trailing vines that can brighten up dark corners. Available in varieties like Golden Pothos, Marble Queen, and Neon, these plants adapt well to low light and are perfect for beginners. The Heartleaf Philodendron (Philodendron hederaceum) is equally forgiving and features heart-shaped leaves that cascade beautifully from shelves or hanging baskets.\n\nFor those who prefer plants with more structural interest, the Cast Iron Plant (Aspidistra elatior) lives up to its name with tough, leathery leaves that can withstand neglect and poor lighting conditions. The Chinese Evergreen (Aglaonema) offers attractive variegated foliage in various patterns and colors, making it both decorative and practical for low-light environments.\n\nFerns like the Bird's Nest Fern (Asplenium nidus) and Boston Fern (Nephrolepis exaltata) can adapt to low light, though they prefer higher humidity. The Peace Lily (Spathiphyllum) not only tolerates low light but also produces elegant white blooms even in these conditions.\n\nThe Prayer Plant (Maranta leuconeura) and Calathea varieties display stunning leaf patterns and perform their characteristic leaf movements even in lower light. For larger statement plants, the Rubber Plant (Ficus elastica) and Dracaena varieties can grow tall with minimal light requirements.\n\nWhen caring for low-light plants, remember that \"low light\" doesn't mean \"no light\" – all plants need some light for photosynthesis. Rotate your plants occasionally to ensure even growth, and be careful not to overwater, as plants in lower light conditions typically use less water. With these adaptable plants, you can bring life and greenery to even the darkest corners of your home."
    },
    {
      "id": "3",
      "title": "Natural Pest Control for Your Garden",
      "image": "assets/images/blogs/maghai_pan.png",
      "date": "February 8, 2025",
      "author": "Priya Sharma",
      "authorImage": "assets/images/testimonials/user3.png",
      "content": "Keeping pests at bay doesn't have to involve harsh chemicals that harm beneficial insects and pollinators. Natural pest control methods can be just as effective while being safer for your garden ecosystem, pets, and family.\n\nOne of the most effective natural approaches is companion planting. Certain plants naturally repel specific pests – marigolds deter nematodes, basil repels mosquitoes and flies, and nasturtiums act as trap crops for aphids. Interplanting these protective species throughout your garden creates a natural defense system.\n\nBeneficial insects are your allies in pest management. Ladybugs, lacewings, and praying mantises are voracious predators of common garden pests like aphids, mealybugs, and caterpillars. Attract these helpful insects by planting diverse flowering plants like dill, fennel, and yarrow that provide nectar and pollen.\n\nHomemade sprays can target specific pest problems. A simple solution of water and mild dish soap disrupts the waxy coating on soft-bodied insects like aphids and spider mites. For fungal issues, a baking soda spray (1 tablespoon baking soda, 1 teaspoon mild liquid soap, and 1 gallon of water) can be effective against powdery mildew. Garlic and hot pepper sprays create natural repellents that many pests avoid.\n\nPhysical barriers provide simple but effective protection. Row covers prevent flying insects from reaching vulnerable plants, while copper tape creates a barrier that slugs and snails won't cross. Sticky traps can capture flying pests before they damage plants.\n\nMaintaining healthy soil creates resilient plants that naturally resist pests. Regular addition of compost improves soil structure and introduces beneficial microorganisms that help plants develop stronger natural defenses. Proper watering techniques (watering at the base of plants in the morning) and adequate spacing between plants reduce humidity and prevent many fungal diseases.\n\nCrop rotation disrupts pest life cycles by changing what's planted in each area of your garden each season. This practice prevents pest populations from becoming established in the soil and targeting specific plant families year after year.\n\nFor larger pests like rabbits and deer, physical deterrents such as fencing may be necessary. Alternatively, planting strongly aromatic herbs like lavender and rosemary around the garden perimeter can help deter these animals through their scent.\n\nBy implementing these natural pest control strategies, you can maintain a thriving garden that works with nature rather than against it, creating a balanced ecosystem where plants can flourish without harmful chemical interventions."
    }
  ];
  
  // Find the blog with matching ID or return the first one if not found
  return blogs.firstWhere(
    (blog) => blog["id"] == id, 
    orElse: () => blogs[0]
  );
}

class BlogContentSection extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String content;
  final String author;
  final String authorImage;
  final String date;
  
  const BlogContentSection({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.content,
    required this.author,
    required this.authorImage,
    required this.date,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 19),
            ],
          ),
        ),
        
        // Author information
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(authorImage),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    author,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 384,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      bottom: 0,
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
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
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: Text(
                  content,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 1.56,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              
              // Share and like buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF54A801),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.share, color: Colors.white, size: 18),
                        SizedBox(width: 5),
                        Text(
                          'Share',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF54A801)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.favorite_border, color: Color(0xFF54A801), size: 18),
                        SizedBox(width: 5),
                        Text(
                          'Like',
                          style: TextStyle(
                            color: Color(0xFF54A801),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CommentsSection extends StatefulWidget {
  const CommentsSection({Key? key}) : super(key: key);

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
  final TextEditingController _commentController = TextEditingController();
  
  // Sample comments data
  final List<Map<String, dynamic>> _comments = [
    {
      "name": "Rahul Gupta",
      "image": "assets/images/testimonials/user2.png",
      "date": "April 16, 2025",
      "content": "This article was incredibly helpful! I've been overwatering my plants for years and now I understand why they keep dying. Thank you for the detailed explanation."
    },
    {
      "name": "Anjali Patel",
      "image": "assets/images/testimonials/user3.png",
      "date": "April 17, 2025",
      "content": "I never knew about the finger test for checking soil moisture. Such a simple technique but it makes so much sense. I'm going to start using it right away."
    }
  ];
  
  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Comments header
          const Text(
            'Comments',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          
          // Comment input field
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextField(
                  controller: _commentController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Write your comment...',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: const Color(0xFF54A801),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add comment functionality would go here
                      if (_commentController.text.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Comment submitted!'),
                            backgroundColor: Color(0xFF54A801),
                          ),
                        );
                        _commentController.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF54A801),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Post Comment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          
          // Existing comments
          ..._comments.map((comment) => _buildCommentCard(comment)).toList(),
        ],
      ),
    );
  }
  
  Widget _buildCommentCard(Map<String, dynamic> comment) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Comment header with user info
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(comment["image"]),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment["name"],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    comment["date"],
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          // Comment content
          Text(
            comment["content"],
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          // Reply button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Reply',
                  style: TextStyle(
                    color: Color(0xFF54A801),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
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

class RelatedArticlesSection extends StatelessWidget {
  const RelatedArticlesSection({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Related Articles',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          
          // Horizontal scrolling related articles
          SizedBox(
            height: 280,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRelatedArticleCard(
                  context,
                  id: "2",
                  imageUrl: 'assets/images/blogs/parijat_tree.png',
                  title: 'Indoor Plants That Thrive in Low Light',
                  date: 'March 22, 2025',
                ),
                const SizedBox(width: 16),
                _buildRelatedArticleCard(
                  context,
                  id: "3",
                  imageUrl: 'assets/images/blogs/maghai_pan.png',
                  title: 'Natural Pest Control for Your Garden',
                  date: 'February 8, 2025',
                ),
                const SizedBox(width: 16),
                _buildRelatedArticleCard(
                  context,
                  id: "4",
                  imageUrl: 'assets/images/blogs/monsoon_gardening.png',
                  title: 'Seasonal Gardening: Spring Edition',
                  date: 'January 30, 2025',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildRelatedArticleCard(
    BuildContext context, {
    required String id,
    required String imageUrl,
    required String title,
    required String date,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigate to the related article
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlogDetailsScreen(blogId: id),
          ),
        );
      },
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article image
            Container(
              width: double.infinity,
              height: 150,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date
                  Text(
                    date,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
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
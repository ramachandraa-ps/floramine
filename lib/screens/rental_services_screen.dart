import 'package:flutter/material.dart';
import '../widgets/search_bar.dart';

class RentalServicesScreen extends StatelessWidget {
  const RentalServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with search bar
              Rectangle135(),
              
              // Main content sections
              _buildTitleSection(context),
              const WhyRentFromUsSection(),
              const RentalPlansSection(),
              const HowItWorksSection(),
              const PopularRentalPlantsSection(),
              const RentalTestimonialsSection(),
              
              // Footer spacing
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

 Widget _buildTitleSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth > 600 ? 600.0 : screenWidth * 0.9;
    
    return Container(
      width: contentWidth,
      padding: const EdgeInsets.all(20),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Color(0x1954A801)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 400,
                  child: Text(
                    'Bring Greenery to Your Space with Our Plant Rental Services',
                    style: TextStyle(
                      color: const Color(0xFF316300),
                      fontSize: 39,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 400,
                  child: Text(
                    'Whether it\'s a corporate event, wedding, or office makeover - rent lush, well-maintained indoor and outdoor plants at affordable prices.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w400,
                      height: 1.72,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 130,
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF316300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Get Quote',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.download_rounded,
                            size: 16,
                            color: Colors.black87,
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            'Download Catalog',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
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
          const SizedBox(height: 28),
          Container(
            width: double.infinity,
            height: 400,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/rental_services/rental_service_page.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WhyRentFromUsSection extends StatelessWidget {
  const WhyRentFromUsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth > 600 ? 600.0 : screenWidth * 0.9;
    
    return Container(
      width: contentWidth,
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 400,
            child: Text(
              'Why Rent Plants from Us?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildFeatureCard(
                  title: 'Wide range of indoor & outdoor plants',
                  isHighlighted: true,
                  icon: Icons.eco,
                ),
                const SizedBox(height: 30),
                _buildFeatureCard(
                  title: 'Flexible short-term & long-term rental plans',
                  icon: Icons.calendar_today,
                ),
                const SizedBox(height: 30),
                _buildFeatureCard(
                  title: 'Regular maintenance by our expert team',
                  icon: Icons.people,
                ),
                const SizedBox(height: 30),
                _buildFeatureCard(
                  title: 'Affordable pricing with zero hassle',
                  icon: Icons.attach_money,
                ),
                const SizedBox(height: 30),
                _buildFeatureCard(
                  title: 'Elevate ambience, reduce stress & purify air',
                  icon: Icons.air,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildFeatureCard({
    required String title,
    required IconData icon,
    bool isHighlighted = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: isHighlighted ? const Color(0xFF54A801) : const Color(0x0C54A801),
        shape: RoundedRectangleBorder(
          side: isHighlighted 
              ? BorderSide.none
              : const BorderSide(
                  width: 1,
                  color: Color(0x7F54A801),
                ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isHighlighted ? Colors.white.withOpacity(0.2) : const Color(0x1954A801),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isHighlighted ? Colors.white : const Color(0xFF54A801),
              size: 24,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 360,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isHighlighted ? Colors.white : Colors.black,
                fontSize: 17,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RentalPlansSection extends StatelessWidget {
  const RentalPlansSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth > 600 ? 600.0 : screenWidth * 0.9;
    
    return Container(
      width: contentWidth,
      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: const BoxDecoration(color: Color(0x1954A801)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 400,
            child: Text(
              'Rental Plans & Packages with Pricing',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRentalPackageCard(
                  title: 'Events & Exhibitions',
                  subtitle: 'Perfect for weddings, parties, exhibitions, and photoshoots.',
                  duration: '1–7 Days',
                  includes: 'Setup, pickup, and replacements if needed',
                  options: [
                    'Small Setup (10–15 plants): ₹1,999/day',
                    'Mid Setup (25–30 plants): ₹3,999/day',
                    'Large Setup (50+ plants): ₹6,999/day',
                  ],
                ),
                const SizedBox(height: 20),
                _buildRentalPackageCard(
                  title: 'Corporate & Office Spaces',
                  subtitle: 'Enhance your office decor and work environment with greenery',
                  duration: 'Monthly / Yearly',
                  includes: 'Weekly maintenance, replacements, and plant rotation',
                  options: [
                    'Starter (10 plants): ₹2,499/month',
                    'Growth Plan (25 plants): ₹5,499/month',
                    'Premium (50 plants): ₹9,999/month',
                  ],
                ),
                const SizedBox(height: 20),
                _buildRentalPackageCard(
                  title: 'Home Decor Rentals',
                  subtitle: 'Add a peaceful, natural touch to your living space.',
                  duration: 'Weekly / Monthly',
                  includes: 'Indoor plants, ceramic pots, and installation',
                  options: [
                    'Basic (5 plants): ₹799/week or ₹2,499/month',
                    'Cozy Corner (10 plants): ₹1,299/week or ₹3,999/month',
                    'Full Room (15–20 plants): ₹1,999/week or ₹5,999/month',
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildRentalPackageCard({
    required String title,
    required String subtitle,
    required String duration,
    required String includes,
    required List<String> options,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and subtitle
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 360,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF54A801),
                      fontSize: 22,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                SizedBox(
                  width: 360,
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.50),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          
          // Duration badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: ShapeDecoration(
              color: const Color(0xFF622700),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(27),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  duration,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          
          // What's included
          SizedBox(
            width: 360,
            child: Text(
              'Includes: $includes',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 20),
          
          // Divider
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.black.withOpacity(0.10),
          ),
          const SizedBox(height: 20),
          
          // Options
          ...options.map((option) => Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Color(0x1954A801),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 16,
                    color: Color(0xFF54A801),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    option,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }
}

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth > 600 ? 600.0 : screenWidth * 0.9;
    
    return Container(
      width: contentWidth,
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 400,
                  child: Text(
                    'How It Works',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 400,
                  child: Text(
                    'Simple, seamless, and stress-free — we handle everything so you can enjoy the greenery without the hassle.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.50),
                      fontSize: 22,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: [
              _buildStepCard(
                step: '1',
                title: 'Choose Your Plan',
                description: 'Browse our catalog or chat with our expert for the right picks.',
              ),
              _buildStepCard(
                step: '2',
                title: 'Schedule Delivery',
                description: 'Pick a delivery date and time that works best for you.',
              ),
              _buildStepCard(
                step: '3',
                title: 'We Deliver',
                description: 'We\'ll bring the plants fresh and ready for you to set up as you like.',
              ),
              _buildStepCard(
                step: '4',
                title: 'Care Tips Included',
                description: 'We provide simple care tips to help your plants thrive.',
              ),
              _buildStepCard(
                step: '5',
                title: 'Easy Return or Renewal',
                description: 'Extend your plan or return the plants when you\'re ready.',
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildStepCard({
    required String step,
    required String title,
    required String description,
  }) {
    return Container(
      width: 340,
      height: 160,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.20),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Color(0xFF622700)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFFEE08),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      step,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Center(
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.50),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PopularRentalPlantsSection extends StatelessWidget {
  const PopularRentalPlantsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth > 600 ? 600.0 : screenWidth * 0.9;
    
    // Sample plant data - in a real app, this would come from a backend API
    final List<RentalPlant> popularPlants = [
      RentalPlant(
        name: 'Areca Palm',
        pricePerDay: 250,
        imageUrl: 'assets/images/rental_services/areca_palm.png',
      ),
      RentalPlant(
        name: 'Snake Plant',
        pricePerDay: 300,
        imageUrl: 'assets/images/rental_services/snake_plant.png',
      ),
      RentalPlant(
        name: 'Rubber Plant',
        pricePerDay: 350,
        imageUrl: 'assets/images/rental_services/rubber_plant.png',
      ),
      RentalPlant(
        name: 'Peace Lilly',
        pricePerDay: 250,
        imageUrl: 'assets/images/rental_services/peace_lilly.png',
      ),
    ];
    
    return Container(
      width: contentWidth,
      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: const BoxDecoration(color: Color(0x0C54A801)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 420,
            child: Text(
              'Our Most Popular Rental Plants',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: popularPlants.map((plant) => 
                _buildPlantCard(plant)
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildPlantCard(RentalPlant plant) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 229,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Image.asset(
              plant.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 360,
            child: Text(
              plant.name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '₹ ${plant.pricePerDay}',
                style: const TextStyle(
                  color: Color(0xFF316300),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '/ day',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.50),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Model class for rental plants - makes it easier to work with backend data
class RentalPlant {
  final String name;
  final int pricePerDay;
  final String imageUrl;
  
  RentalPlant({
    required this.name,
    required this.pricePerDay,
    required this.imageUrl,
  });
}

class RentalTestimonialsSection extends StatelessWidget {
  const RentalTestimonialsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth > 600 ? 600.0 : screenWidth * 0.9;
    
    return Container(
      width: contentWidth,
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section title
          const SizedBox(
            width: 400,
            child: Text(
              'What Our Rental Customers Say',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Horizontal scrolling testimonial cards
          SizedBox(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildTestimonialCard(
                  name: 'Sarath Kumar',
                  rating: 5,
                  review:
                      '"The plants transformed our corporate event. Everyone was impressed with the quality and arrangement. The team was professional and punctual."',
                  imageUrl: 'assets/images/testimonials/user1.png',
                ),
                const SizedBox(width: 20),
                _buildTestimonialCard(
                  name: 'Priya Sharma',
                  rating: 5,
                  review:
                      '"We rented plants for our wedding and they were absolutely stunning. The setup was perfect and the plants were healthy and vibrant."',
                  imageUrl: 'assets/images/testimonials/user2.png',
                ),
                const SizedBox(width: 20),
                _buildTestimonialCard(
                  name: 'Rahul Verma',
                  rating: 4,
                  review:
                      '"Great service for our office space. The monthly maintenance keeps everything looking fresh, and they\'re quick to replace any plants that don\'t thrive."',
                  imageUrl: 'assets/images/testimonials/user3.png',
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Write a review button
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            clipBehavior: Clip.antiAlias,
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
                  'Share your experience',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard({
    required String name,
    required int rating,
    required String review,
    required String imageUrl,
  }) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.10),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info row with image, name and rating
          Row(
            children: [
              // User image
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 15),

              // Name and rating column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 5),

                    // Rating with star icon
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: ShapeDecoration(
                        color: Colors.black.withOpacity(0.05),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xFFFFD700), // Gold color for star
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '$rating Star',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.50),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          // Review text
          Text(
            review,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class Rectangle135 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 117,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, 0.50),
              end: Alignment(1.00, 0.50),
              colors: [const Color(0xFF54A801), const Color(0xFF214200)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFFE4E4E4),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new, size: 16),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: CustomSearchBar(
                    hintText: "Indoor Plants",
                  ),
                ),
                SizedBox(width: 20),
                Stack(
                  children: [
                    Icon(Icons.shopping_cart_outlined, size: 30, color: Colors.white),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 12.50,
                        height: 12.50,
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF54A801),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '5',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 7,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
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
        ),
      ],
    );
  }
}

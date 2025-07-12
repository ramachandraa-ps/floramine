import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import '../widgets/plant_product_card.dart';
import '../providers/deal_provider.dart';
import '../models/product_model.dart';

class DealOfTheDayScreen extends StatefulWidget {
  const DealOfTheDayScreen({Key? key}) : super(key: key);

  @override
  State<DealOfTheDayScreen> createState() => _DealOfTheDayScreenState();
}

class _DealOfTheDayScreenState extends State<DealOfTheDayScreen> {
  // Timer values
  int hours = 24;
  int minutes = 02;
  int seconds = 26;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    
    // Load deal products when the screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DealProvider>(context, listen: false).loadDealProducts();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          if (minutes > 0) {
            minutes--;
            seconds = 59;
          } else {
            if (hours > 0) {
              hours--;
              minutes = 59;
              seconds = 59;
            } else {
              _timer.cancel();
            }
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dealProvider = Provider.of<DealProvider>(context);
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      
                      const SizedBox(width: 10),
                      
                      // Search bar
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Row(
                            children: [
                              // Search input field
                              Expanded(
                                child: Container(
                                  height: 40,
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      bottomLeft: Radius.circular(30),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Search ',
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(0.5),
                                                fontSize: 11,
                                                fontFamily: 'Cabin',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '"Indoor Plants"',
                                              style: const TextStyle(
                                                color: Color(0x7F622700),
                                                fontSize: 11,
                                                fontFamily: 'Cabin',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              
                              // Search button
                              Container(
                                width: 50,
                                height: 40,
                                padding: const EdgeInsets.all(13),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF54A801),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      const SizedBox(width: 10),
                      
                      // Cart icon with badge
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Stack(
                          children: [
                            const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                width: 12.5,
                                height: 12.5,
                                padding: const EdgeInsets.symmetric(horizontal: 2),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF54A801),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    '5',
                                    textAlign: TextAlign.center,
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Deal of the Day Content
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: DealOfTheDayContent(
                hours: hours,
                minutes: minutes,
                seconds: seconds,
                screenWidth: screenWidth,
              ),
            ),
            
            // Show loading indicator or error message if needed
            if (dealProvider.isLoading)
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(child: CircularProgressIndicator()),
              )
            else if (dealProvider.error != null)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    'Failed to load deals: ${dealProvider.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              )
            else
              // Top Deals on Plants Section
              _buildProductSection(
                'Top Deals on Plants',
                _buildDealProductCards(dealProvider.dealProducts),
              ),
            
            const SizedBox(height: 10),
            
            _buildViewAllButton(),
            
            // Top Deals on Bulk Gifts Section
            Container(
              width: double.infinity,
              color: const Color(0x0C54A801),
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  const Text(
                    'Top Deals on Bulk Gifts',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: PlantProductCard(
                                imageAsset: 'assets/images/plants/lipstick_plant.png',
                                name: 'Aglaonema Lipstick Plant - Corporate Gift (set of 30)',
                                currentPrice: 22470,
                                originalPrice: 26470,
                                discountPercentage: 15,
                                isAirPurifying: true,
                                isPerfectGift: true,
                                onBuyNowPressed: () {},
                                onAddToCartPressed: () {},
                                onFavoritePressed: () {},
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: PlantProductCard(
                                imageAsset: 'assets/images/plants/lipstick_plant.png',
                                name: 'Aglaonema Lipstick Plant - Corporate Gift (set of 30)',
                                currentPrice: 22470,
                                originalPrice: 26470,
                                discountPercentage: 15,
                                isAirPurifying: true,
                                isPerfectGift: true,
                                onBuyNowPressed: () {},
                                onAddToCartPressed: () {},
                                onFavoritePressed: () {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: PlantProductCard(
                                imageAsset: 'assets/images/plants/lipstick_plant.png',
                                name: 'Aglaonema Lipstick Plant - Corporate Gift (set of 30)',
                                currentPrice: 22470,
                                originalPrice: 26470,
                                discountPercentage: 15,
                                isAirPurifying: true,
                                isPerfectGift: true,
                                onBuyNowPressed: () {},
                                onAddToCartPressed: () {},
                                onFavoritePressed: () {},
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: PlantProductCard(
                                imageAsset: 'assets/images/plants/lipstick_plant.png',
                                name: 'Aglaonema Lipstick Plant - Corporate Gift (set of 30)',
                                currentPrice: 22470,
                                originalPrice: 26470,
                                discountPercentage: 15,
                                isAirPurifying: true,
                                isPerfectGift: true,
                                onBuyNowPressed: () {},
                                onAddToCartPressed: () {},
                                onFavoritePressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildViewAllButton(),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Helper method to build product cards from API data
  List<Widget> _buildDealProductCards(List<Product> products) {
    // If no products, return placeholder cards
    if (products.isEmpty) {
      return [
        PlantProductCard(
          imageAsset: 'assets/images/plants/jasmine.png',
          name: 'Jasminum sambac, Mogra, Arabian Jasmine - Plant',
          currentPrice: 299,
          originalPrice: 350,
          discountPercentage: 15,
          isAirPurifying: true,
          isPerfectGift: true,
          onBuyNowPressed: () {},
          onAddToCartPressed: () {},
          onFavoritePressed: () {},
        ),
        PlantProductCard(
          imageAsset: 'assets/images/plants/rose.png',
          name: 'Miniature Rose, Button Rose (Any Color) - Plant',
          currentPrice: 299,
          originalPrice: 350,
          discountPercentage: 15,
          isAirPurifying: true,
          isPerfectGift: true,
          onBuyNowPressed: () {},
          onAddToCartPressed: () {},
          onFavoritePressed: () {},
        ),
      ];
    }

    // Otherwise, build cards from API data
    return products.map((product) {
      // Extract variation data for price information
      final variation = product.variations.isNotEmpty ? product.variations.first : null;
      
      // Parse prices from the API response
      double currentPrice = 0;
      double originalPrice = 0;
      double discountPercentage = 0;
      
      if (variation != null) {
        try {
          // Extract price strings and remove currency symbol and whitespace
          String defaultPriceStr = variation.defaultPrice.replaceAll('₹', '').trim();
          String defaultSellPriceStr = variation.defaultSellPrice.replaceAll('₹', '').trim();
          
          // Parse prices to double
          double defaultPrice = double.parse(defaultPriceStr);
          double defaultSellPrice = double.parse(defaultSellPriceStr);
          
          print("Raw price values - Default price: $defaultPrice, Default sell price: $defaultSellPrice");
          
          // Set current price to default sell price
          currentPrice = defaultSellPrice;
          
          // For original price:
          // 1. If default_price is available and greater than sell price, use it as original price
          // 2. If default_price is 0 or less than sell price, create a synthetic original price
          if (defaultPrice > 0 && defaultPrice > defaultSellPrice) {
            originalPrice = defaultPrice;
            print("Using actual default_price as original price: $originalPrice");
          } else {
            // If default price is 0 or less than sell price, create a synthetic original price
            originalPrice = defaultSellPrice * 1.05;
            print("Created synthetic original price: $originalPrice (5% above sell price)");
          }
          
          // If the product is in a deal and has a deal offer price, use that instead
          if (variation.isInDeal && variation.dealOfferPrice != null && variation.dealOfferPrice!.isNotEmpty) {
            String dealOfferPriceStr = variation.dealOfferPrice!.replaceAll('₹', '').trim();
            double dealOfferPrice = double.parse(dealOfferPriceStr);
            
            // Only use deal price if it's actually lower than the default sell price
            if (dealOfferPrice < defaultSellPrice) {
              currentPrice = dealOfferPrice;
              originalPrice = defaultSellPrice; // Original price becomes the default sell price
              print("Using deal price: $currentPrice (original was $originalPrice)");
            }
          }
          
          // Debug output to verify values
          print("Product: ${product.name}");
          print("Default price: ${variation.defaultPrice}, Default sell price: ${variation.defaultSellPrice}");
          print("Final prices - Original: $originalPrice, Current: $currentPrice");
          print("Is in deal: ${variation.isInDeal}");
          
          // Parse discount percentage
          if (variation.dealDiscount != null && variation.dealDiscount!.isNotEmpty) {
            String discountStr = variation.dealDiscount!.replaceAll('%', '').trim();
            discountPercentage = double.parse(discountStr);
            print("Using provided discount percentage: $discountPercentage%");
          } else if (originalPrice > 0 && currentPrice > 0 && originalPrice > currentPrice) {
            // Calculate discount if not provided
            discountPercentage = ((originalPrice - currentPrice) / originalPrice) * 100;
            print("Calculated discount percentage: $discountPercentage%");
          }
        } catch (e) {
          print("Error parsing prices for ${product.name}: $e");
          // Fallback values
          originalPrice = 25.0;
          currentPrice = 23.75;
          discountPercentage = 5.0;
        }
      }

      // Get the first image URL or use a placeholder
      String imageUrl = product.images.isNotEmpty 
          ? product.images.first 
          : 'assets/images/plants/default_plant.png';

      // Use local asset if the API image is not available
      bool useLocalImage = !imageUrl.startsWith('http');
      String imageAsset = useLocalImage ? imageUrl : 'assets/images/plants/default_plant.png';

      // Print debug information
      print("Creating PlantProductCard for ${product.name}:");
      print("  - Original Price: $originalPrice");
      print("  - Current Price: $currentPrice");
      print("  - Discount: $discountPercentage%");
      print("  - Image URL: $imageUrl");
      print("  - Using local image: $useLocalImage");

      return PlantProductCard(
        imageUrl: !useLocalImage ? imageUrl : null,
        imageAsset: useLocalImage ? imageAsset : null,
        name: product.name,
        currentPrice: currentPrice,
        originalPrice: originalPrice,
        discountPercentage: discountPercentage,
        // Keep these UI elements as they are not provided by the API
        isAirPurifying: true,
        isPerfectGift: true,
        onBuyNowPressed: () {},
        onAddToCartPressed: () {},
        onFavoritePressed: () {},
      );
    }).toList();
  }

  Widget _buildProductSection(String title, List<Widget> products) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Cabin',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    for (int i = 0; i < products.length && i < 2; i++) ...[
                      if (i > 0) const SizedBox(width: 10),
                      Expanded(child: products[i]),
                    ],
                  ],
                ),
                if (products.length > 2) ...[
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      for (int i = 2; i < products.length && i < 4; i++) ...[
                        if (i > 2) const SizedBox(width: 10),
                        Expanded(child: products[i]),
                      ],
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewAllButton() {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 1, color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30),
        ),
        child: const Text(
          'View All Products',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Cabin',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class DealOfTheDayContent extends StatelessWidget {
  final int hours;
  final int minutes;
  final int seconds;
  final double screenWidth;

  const DealOfTheDayContent({
    Key? key,
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isTablet = screenWidth > 600;
    final containerWidth = isTablet ? 396.0 : screenWidth * 0.9;
    
    return Column(
      children: [
        Container(
          width: containerWidth,
          height: isTablet ? 760 : 680,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFFF6ECEC),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              // Background color
              Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color(0xFFF9F3F3),
              ),
              
              // Left top decorative element (plant image)
              Positioned(
                left: containerWidth * 0.1,
                top: containerWidth * 0.05,
                child: Container(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(0.77),
                  width: containerWidth * 0.5,
                  height: containerWidth * 0.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/deal_of_the_day/left_top.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              
              // Right top decorative element (plant image)
              Positioned(
                right: -containerWidth * 0.1,
                top: -containerWidth * 0.05,
                child: Container(
                  width: containerWidth * 0.6,
                  height: containerWidth * 0.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/deal_of_the_day/right_top.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              
              // Left bottom decorative element
              Positioned(
                left: -containerWidth * 0.05,
                bottom: containerWidth * 0.3,
                child: Container(
                  width: containerWidth * 0.4,
                  height: containerWidth * 0.4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/deal_of_the_day/left_bottom.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              
              // Right bottom decorative element
              Positioned(
                right: containerWidth * 0.1,
                bottom: containerWidth * 0.5,
                child: Container(
                  width: containerWidth * 0.3,
                  height: containerWidth * 0.3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/deal_of_the_day/right_bottom.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              
              // Decorative lines (if needed)
              Positioned(
                left: containerWidth * 0.4,
                top: containerWidth * 0.2,
                child: Container(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                  height: containerWidth * 0.4,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 3,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: const Color(0xFF622700).withOpacity(0.1),
                      ),
                    ),
                  ),
                ),
              ),
              
              // Main Deal of the Day text
              Positioned(
                top: containerWidth * 0.15,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/images/deal_of_the_day/deal_of_the_day.png',
                    width: containerWidth * 0.7,
                  ),
                ),
              ),
              
              // Text content
              Positioned(
                left: 0,
                right: 0,
                bottom: containerWidth * 0.4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Today's Green Highlight",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF316300),
                        fontSize: isTablet ? 28 : 24,
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: containerWidth * 0.1),
                      child: Text(
                        "Just 24 hours to grab this stunner—don't miss out!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF316300),
                          fontSize: isTablet ? 18 : 16,
                          fontFamily: 'Cabin',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Timer container
              Positioned(
                left: containerWidth * 0.05,
                right: containerWidth * 0.05,
                bottom: containerWidth * 0.1,
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF54A801),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Hours
                      _buildTimeUnit(hours.toString().padLeft(2, '0'), 'Hours'),
                      
                      // Minutes
                      _buildTimeUnit(minutes.toString().padLeft(2, '0'), 'Minutes'),
                      
                      // Seconds
                      _buildTimeUnit(seconds.toString().padLeft(2, '0'), 'Seconds'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _buildTimeUnit(String value, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

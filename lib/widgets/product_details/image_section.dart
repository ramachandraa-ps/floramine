import 'package:flutter/material.dart';

class ProductImageSection extends StatelessWidget {
  final String mainImageUrl;
  final List<String> thumbnailImageUrls;

  const ProductImageSection({
    Key? key,
    this.mainImageUrl = 'assets/images/jasminum_sambac.png',
    this.thumbnailImageUrls = const [
      'assets/images/jasminum_sambac.png',
      'assets/images/jasminum_sambac.png',
      'assets/images/jasminum_sambac.png',
      'assets/images/jasminum_sambac.png',
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main product image
        Container(
          width: double.infinity,
          height: 350,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Stack(
            children: [
              // Main product image
              Positioned.fill(
                child: Image.asset(
                  mainImageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(Icons.image_not_supported, size: 50),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Thumbnail images row
        Row(
          children: List.generate(
            thumbnailImageUrls.length,
            (index) => Expanded(
              child: Container(
                height: 70,
                margin: EdgeInsets.only(
                  left: index == 0 ? 0 : 4,
                  right: index == thumbnailImageUrls.length - 1 ? 0 : 4,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Image.asset(
                  thumbnailImageUrls[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Icon(Icons.image_not_supported),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Features section
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: const Color(0x0C622700), // Light brown with opacity
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: Color(0x1954A801), // Green with opacity
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            children: [
              // Feature 1: Plant care support
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.support_agent,
                      size: 20,
                      color: Colors.green[800],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Plant care support',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Feature 2: Free shipping
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_shipping_outlined,
                      size: 20,
                      color: Colors.green[800],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Free shipping above ₹399',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Feature 3: High quality plants
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.verified_outlined,
                      size: 20,
                      color: Colors.green[800],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'High quality plants',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
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
      ],
    );
  }
}
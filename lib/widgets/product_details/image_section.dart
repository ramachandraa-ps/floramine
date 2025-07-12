import 'package:flutter/material.dart';

class ProductImageSection extends StatefulWidget {
  final List<String>? images;

  const ProductImageSection({
    Key? key,
    this.images,
  }) : super(key: key);

  @override
  State<ProductImageSection> createState() => _ProductImageSectionState();
}

class _ProductImageSectionState extends State<ProductImageSection> {
  int _selectedImageIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    // Use the provided images or fall back to default asset
    final List<String> imageUrls = widget.images != null && widget.images!.isNotEmpty
        ? widget.images!
        : ['assets/images/jasminum_sambac.png'];
    
    // Selected image URL
    final String selectedImageUrl = imageUrls[_selectedImageIndex];
    
    // Check if the selected image is a network image
    final bool isNetworkImage = selectedImageUrl.startsWith('http');

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
                child: isNetworkImage
                    ? Image.network(
                        selectedImageUrl,
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                              color: const Color(0xFF54A801),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[200],
                            child: const Center(
                              child: Icon(Icons.image_not_supported, size: 50),
                            ),
                          );
                        },
                      )
                    : Image.asset(
                        selectedImageUrl,
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
              
              // Favorite button
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: Colors.grey,
                    ),
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      // Handle favorite button press
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Thumbnail images row - only show if there are multiple images
        if (imageUrls.length > 1)
          SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                final String thumbnailUrl = imageUrls[index];
                final bool isNetworkThumbnail = thumbnailUrl.startsWith('http');
                
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedImageIndex = index;
                    });
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.only(
                      right: index == imageUrls.length - 1 ? 0 : 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: _selectedImageIndex == index
                          ? Border.all(color: const Color(0xFF54A801), width: 2)
                          : null,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: isNetworkThumbnail
                        ? Image.network(
                            thumbnailUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[200],
                                child: const Icon(Icons.image_not_supported),
                              );
                            },
                          )
                        : Image.asset(
                            thumbnailUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[200],
                                child: const Icon(Icons.image_not_supported),
                              );
                            },
                          ),
                  ),
                );
              },
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
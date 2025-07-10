import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoryTile extends StatelessWidget {
  final Category category;
  final bool useAsset;
  final bool useCircularImage;
  final VoidCallback? onTap;

  const CategoryTile({
    Key? key,
    required this.category,
    this.useAsset = false,
    this.useCircularImage = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 101,
        height: 150, // Fixed height for consistency
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Category image
            _buildCategoryImage(context),
            
            const SizedBox(height: 6), // Spacing between image and text
            
            // Category title
            Expanded(
              child: Container(
                width: 101,
                child: Text(
                  category.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build the image with proper error handling
  Widget _buildCategoryImage(BuildContext context) {
    // Determine if we should use circular or rounded rectangle shape
    final borderRadius = useCircularImage || category.isRounded
        ? BorderRadius.circular(500)  // Fully circular
        : BorderRadius.circular(8);   // Rounded rectangle

    // Create a container with the appropriate border radius
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        color: Colors.grey[100], // Light background color
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: _buildImageContent(context),
      ),
    );
  }
  
  Widget _buildImageContent(BuildContext context) {
    // If using asset image
    if (useAsset) {
      try {
        return Image.asset(
          category.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _buildPlaceholderIcon(context),
        );
      } catch (e) {
        return _buildPlaceholderIcon(context);
      }
    }
    
    // For API images, check if the URL is valid
    if (category.imageUrl.startsWith('http')) {
      // Try to load the network image
      return Image.network(
        category.imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _buildPlaceholderIcon(context),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / 
                    loadingProgress.expectedTotalBytes!
                  : null,
              color: Theme.of(context).primaryColor,
            ),
          );
        },
      );
    }
    
    // Default to placeholder icon
    return _buildPlaceholderIcon(context);
  }

  // Placeholder icon when image fails to load
  Widget _buildPlaceholderIcon(BuildContext context) {
    IconData iconData;
    
    // Choose appropriate icon based on category name
    if (category.name.toLowerCase().contains('plant')) {
      iconData = Icons.spa;
    } else if (category.name.toLowerCase().contains('seed')) {
      iconData = Icons.grain;
    } else if (category.name.toLowerCase().contains('pot')) {
      iconData = Icons.crop_portrait;
    } else if (category.name.toLowerCase().contains('soil') || 
               category.name.toLowerCase().contains('fertil')) {
      iconData = Icons.landscape;
    } else if (category.name.toLowerCase().contains('accessories')) {
      iconData = Icons.category;
    } else if (category.name.toLowerCase().contains('pebbel') || 
               category.name.toLowerCase().contains('stone')) {
      iconData = Icons.circle;
    } else if (category.name.toLowerCase().contains('gift')) {
      iconData = Icons.card_giftcard;
    } else if (category.name.toLowerCase().contains('rental')) {
      iconData = Icons.home_work;
    } else {
      iconData = Icons.eco;
    }
    
    return Container(
      color: Colors.grey[100],
      child: Center(
        child: Icon(
          iconData,
          color: Theme.of(context).primaryColor,
          size: 50,
        ),
      ),
    );
  }
} 
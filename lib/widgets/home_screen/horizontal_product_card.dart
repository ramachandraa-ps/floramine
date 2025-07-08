import 'package:flutter/material.dart';

class HorizontalProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback? onTap;
  final bool isRounded;
  final bool isAsset;

  const HorizontalProductCard({
    Key? key,
    this.imageUrl = "assets/images/home_screen/plants.png",
    this.title = "Plants",
    this.onTap,
    this.isRounded = false,
    this.isAsset = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 101,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Product image
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: isRounded
                    ? BorderRadius.circular(500)
                    : BorderRadius.circular(8),
                image: DecorationImage(
                  image: isAsset
                      ? AssetImage(imageUrl)
                      : NetworkImage(imageUrl) as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 8), // Spacing between image and text

            // Product title - now with multiple lines
            SizedBox(
              width: 101,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 1.2, // Slightly tighter line height
                ),
                maxLines: 2, // Allow up to 2 lines
                overflow: TextOverflow.visible, // Don't truncate with ellipsis
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../screens/search_screen.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String)? onSearch;
  final String hintText;
  final VoidCallback? onSearchIconTap;

  const CustomSearchBar({
    Key? key,
    this.onSearch,
    this.hintText = 'Indoor Plants',
    this.onSearchIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to search screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchScreen(initialQuery: hintText),
          ),
        );
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            // Search input field
            Expanded(
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Search text with placeholder
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Search ',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.50),
                              fontSize: 11,
                              fontFamily: 'Cabin',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: '"$hintText"',
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

                    // Microphone icon (or any other icon you want)
                    const Icon(
                      Icons.mic_none_outlined,
                      size: 18,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            ),

            // Search button
            GestureDetector(
              onTap: () {
                if (onSearchIconTap != null) {
                  onSearchIconTap!();
                } else {
                  // Navigate to search screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(initialQuery: hintText),
                    ),
                  );
                }
              },
              child: Container(
                height: 40,
                width: 50,
                decoration: const BoxDecoration(
                  color: Color(0xFF54A801),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

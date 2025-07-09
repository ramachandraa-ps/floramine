import 'package:flutter/material.dart';

class PaginationSlider extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChanged;

  const PaginationSlider({
    Key? key,
    this.currentPage = 1,
    this.totalPages = 7,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Previous page button
              GestureDetector(
                onTap: currentPage > 1 
                    ? () => onPageChanged(currentPage - 1)
                    : null,
                child: Container(
                  width: 24,
                  height: 24,
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
                  decoration: ShapeDecoration(
                    color: Colors.black.withOpacity(0.10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Icon(
                    Icons.chevron_left,
                    size: 12,
                    color: currentPage > 1 ? Colors.black : Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
              
              const SizedBox(width: 6),
              
              // Page numbers
              Container(
                padding: const EdgeInsets.all(2),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildPageNumbers(),
                ),
              ),
              
              const SizedBox(width: 6),
              
              // Next page button
              GestureDetector(
                onTap: currentPage < totalPages 
                    ? () => onPageChanged(currentPage + 1)
                    : null,
                child: Container(
                  width: 24,
                  height: 24,
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
                  decoration: ShapeDecoration(
                    color: Colors.black.withOpacity(0.10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Icon(
                    Icons.chevron_right,
                    size: 12,
                    color: currentPage < totalPages ? Colors.black : Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageNumbers() {
    List<Widget> pageNumbers = [];
    
    for (int i = 1; i <= totalPages; i++) {
      if (i == currentPage) {
        // Current page (highlighted)
        pageNumbers.add(
          Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
            decoration: ShapeDecoration(
              color: const Color(0xFF54A801),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Center(
              child: Text(
                '$i',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      } else {
        // Other pages
        pageNumbers.add(
          GestureDetector(
            onTap: () => onPageChanged(i),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: SizedBox(
                width: 14,
                child: Text(
                  '$i',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }
    
    return pageNumbers;
  }
} 
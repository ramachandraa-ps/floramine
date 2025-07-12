import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final String? description;
  final String defaultDescription = 'Bright, indirect light is best for this plant. It needs to be watered once a week or when the top inch of soil feels dry. Plants prefer evenly moist soil but are susceptible to root rot if overwatered. Thrives in moderate humidity but can adapt to average household levels. Regular misting or using a humidifier can help maintain optimal humidity, especially in drier climates.';

  const ProductDescription({
    Key? key,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the provided description or fall back to default
    final String displayDescription = description ?? defaultDescription;
    
    return Column(
      children: [
        // Description section
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.black.withOpacity(0.10),
              ),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 30,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Description title
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Description text - simple text rendering
              SizedBox(
                width: double.infinity,
                child: _buildFormattedText(displayDescription),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // What's in the box section
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.black.withOpacity(0.10),
              ),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 30,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'What is in the box?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  // Helper method to build formatted text from potentially HTML content
  Widget _buildFormattedText(String text) {
    // Check if the text contains HTML tags
    bool containsHtml = text.contains('<') && text.contains('>');
    
    if (!containsHtml) {
      // If no HTML, return simple text
      return Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontFamily: 'Cabin',
          fontWeight: FontWeight.w400,
          height: 1.65,
        ),
      );
    }
    
    // Simple HTML parsing for basic formatting
    // Remove HTML tags but preserve paragraph breaks
    String cleanedText = text
        .replaceAll(RegExp(r'<br\s*\/?>|<\/p>'), '\n\n') // Replace <br> and </p> with newlines
        .replaceAll(RegExp(r'<[^>]*>'), '') // Remove all other HTML tags
        .replaceAll('&nbsp;', ' ') // Replace non-breaking spaces
        .replaceAll('&amp;', '&') // Replace ampersand
        .replaceAll('&lt;', '<') // Replace less than
        .replaceAll('&gt;', '>') // Replace greater than
        .replaceAll('&quot;', '"') // Replace quotes
        .replaceAll('&apos;', "'") // Replace apostrophe
        .trim();
    
    // Remove extra newlines
    cleanedText = cleanedText.replaceAll(RegExp(r'\n{3,}'), '\n\n');
    
    return Text(
      cleanedText,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontFamily: 'Cabin',
        fontWeight: FontWeight.w400,
        height: 1.65,
      ),
    );
  }
}

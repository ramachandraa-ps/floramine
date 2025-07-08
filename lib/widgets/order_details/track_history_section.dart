import 'package:flutter/material.dart';

class TrackingStatus {
  final String status;
  final String time;
  final String date;
  final bool isCompleted;

  const TrackingStatus({
    required this.status,
    required this.time,
    required this.date,
    this.isCompleted = false,
  });
}

class TrackHistorySection extends StatelessWidget {
  final List<TrackingStatus> trackingHistory;
  
  // Define constants for layout measurements
  static const double iconSize = 24.0;
  static const double verticalSpacingBetweenItems = 20.0;
  static const double contentHeight = 35.0; // Estimated height of each tracking step

  const TrackHistorySection({
    Key? key,
    this.trackingHistory = const [
      TrackingStatus(
        status: 'Order Placed',
        time: '11:40 am',
        date: '24.04.2025',
        isCompleted: true,
      ),
      TrackingStatus(
        status: 'Order Shipped',
        time: '11:40 am',
        date: '24.04.2025',
        isCompleted: false,
      ),
      TrackingStatus(
        status: 'Out For Delivery',
        time: '11:40 am',
        date: '24.04.2025',
        isCompleted: false,
      ),
      TrackingStatus(
        status: 'Delivered',
        time: '11:40 am',
        date: '24.04.2025',
        isCompleted: false,
      ),
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: ShapeDecoration(
        color: const Color(0x0C54A801), // Light green background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Track History',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Tracking steps with dotted lines between them
          for (int i = 0; i < trackingHistory.length; i++)
            _buildTrackingStepWithConnector(
              trackingHistory[i], 
              isLast: i == trackingHistory.length - 1,
              isFirst: i == 0,
              previousCompleted: i > 0 ? trackingHistory[i-1].isCompleted : false
            ),
          
          // View All button
          Row(
            children: [
              Text(
                'View All',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black.withOpacity(0.5),
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  // Build a tracking step with the connector to the next step
  Widget _buildTrackingStepWithConnector(
    TrackingStatus status, {
    required bool isLast,
    required bool isFirst,
    required bool previousCompleted,
  }) {
    return Stack(
      children: [
        // Main row with step information and icon
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status with icon
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Status circle with check icon
                    Container(
                      width: iconSize,
                      height: iconSize,
                      decoration: BoxDecoration(
                        color: status.isCompleted
                            ? const Color(0xFF54A801)
                            : Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 20),
                    
                    // Status text
                    Text(
                      status.status,
                      style: TextStyle(
                        color: status.isCompleted
                            ? const Color(0xFF54A801)
                            : Colors.black.withOpacity(0.5),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                
                // Time and date
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      status.time,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    
                    const SizedBox(height: 4),
                    
                    Text(
                      status.date,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            // Add spacing between items
            SizedBox(height: isLast ? 10 : 30), // More space for non-last items
          ],
        ),
        
        // Dotted line positioned below the icon
        if (!isLast)
          Positioned(
            left: 12, // Center of the 24px icon
            top: iconSize + 5, // Below the icon
            bottom: 0,
            child: Container(
              width: 1,
              height: 30,
              child: CustomPaint(
                size: Size(1, 30),
                painter: DottedLinePainter(
                  color: status.isCompleted
                      ? const Color(0xFF54A801)
                      : Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// Custom painter for drawing dotted lines
class DottedLinePainter extends CustomPainter {
  final Color color;
  
  DottedLinePainter({
    this.color = Colors.grey,
  });
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    
    const dashHeight = 2.0;
    const dashSpace = 2.0;
    double startY = 0;
    
    while (startY < size.height) {
      // Draw a small dash
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );
      // Move to the next dash
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => 
      oldDelegate is DottedLinePainter && oldDelegate.color != color;
} 
import 'package:flutter/material.dart';

enum ToastType {
  success,
  info,
  warning,
  error,
}

class ToastWidget extends StatelessWidget {
  final String title;
  final String message;
  final String? actionText;
  final VoidCallback? onActionPressed;
  final ToastType toastType;

  const ToastWidget({
    Key? key,
    required this.title,
    required this.message,
    this.actionText,
    this.onActionPressed,
    required this.toastType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: _getBackgroundColor(),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: _getBorderColor(),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon container
                Container(
                  width: 24,
                  height: 24,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(0.50, -0.00),
                      end: const Alignment(0.50, 1.00),
                      colors: _getIconGradient(),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: Center(
                    child: _getIcon(),
                  ),
                ),
                const SizedBox(width: 16),
                
                // Text content
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xFF262F3A),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 1.40,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        message,
                        style: const TextStyle(
                          color: Color(0xFF2F3E52),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.60,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Action button (if provided)
          if (actionText != null && onActionPressed != null)
            GestureDetector(
              onTap: onActionPressed,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFF979FA9),
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(
                  actionText!,
                  style: const TextStyle(
                    color: Color(0xFF2F3F53),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Helper methods to get the appropriate styles based on toast type
  Color _getBackgroundColor() {
    switch (toastType) {
      case ToastType.success:
        return const Color(0xFFF5FFF8);
      case ToastType.info:
        return const Color(0xFFF5F9FF);
      case ToastType.warning:
        return const Color(0xFFFFF8EC);
      case ToastType.error:
        return const Color(0xFFFFF5F3);
    }
  }

  Color _getBorderColor() {
    switch (toastType) {
      case ToastType.success:
        return const Color(0xFF48C1B5);
      case ToastType.info:
        return const Color(0xFF9DC0ED);
      case ToastType.warning:
        return const Color(0xFFF7D9A4);
      case ToastType.error:
        return const Color(0xFFF4AFA1);
    }
  }

  List<Color> _getIconGradient() {
    switch (toastType) {
      case ToastType.success:
        return const [Color(0xFF47C993), Color(0xFF47BAC9)];
      case ToastType.info:
        return const [Color(0xFF4CC9FF), Color(0xFF4DA2DF)];
      case ToastType.warning:
        return const [Color(0xFFDAA948), Color(0xFFFFC36A), Color(0xFFFFA217)];
      case ToastType.error:
        return const [Color(0xFFE78A76), Color(0xFFC94F47)];
    }
  }

  Widget _getIcon() {
    final Color iconColor = Colors.white;
    
    switch (toastType) {
      case ToastType.success:
        return Icon(Icons.check, color: iconColor, size: 16);
      case ToastType.info:
        return Icon(Icons.info_outline, color: iconColor, size: 16);
      case ToastType.warning:
        return Icon(Icons.warning_amber_outlined, color: iconColor, size: 16);
      case ToastType.error:
        return Icon(Icons.close, color: iconColor, size: 16);
    }
  }
}

// Helper class to show toast messages
class ToastService {
  static void showToast({
    required BuildContext context,
    required String title,
    required String message,
    String? actionText,
    VoidCallback? onActionPressed,
    required ToastType toastType,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 20,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: ToastWidget(
            title: title,
            message: message,
            actionText: actionText,
            onActionPressed: onActionPressed,
            toastType: toastType,
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Auto-dismiss after duration
    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
} 
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.50, 0.00),
            end: Alignment(0.50, 1.00),
            colors: [Color(0xFF54A801), Color(0xFF214200)],
          ),
        ),
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Calculate circle size based on the smallest dimension
              final double size = constraints.maxWidth < constraints.maxHeight 
                  ? constraints.maxWidth 
                  : constraints.maxHeight;
              
              return Stack(
                alignment: Alignment.center,
                children: [
                  // Concentric circles
                  Container(
                    width: size * 0.95,
                    height: size * 0.95,
                    decoration: ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.white.withOpacity(0.10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size * 0.85,
                    height: size * 0.85,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.05),
                      shape: const OvalBorder(),
                    ),
                  ),
                  Container(
                    width: size * 0.7,
                    height: size * 0.7,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.05),
                      shape: const OvalBorder(),
                    ),
                  ),
                  Container(
                    width: size * 0.55,
                    height: size * 0.55,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.05),
                      shape: const OvalBorder(),
                    ),
                  ),
                  Container(
                    width: size * 0.42,
                    height: size * 0.42,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.05),
                      shape: const OvalBorder(),
                    ),
                  ),
                  Container(
                    width: size * 0.3,
                    height: size * 0.3,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.05),
                      shape: const OvalBorder(),
                    ),
                  ),
                  // White circle - made larger
                  Container(
                    width: size * 0.28,
                    height: size * 0.28,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                    ),
                  ),
                  // Logo - made larger
                  SizedBox(
                    width: size * 0.22,
                    height: size * 0.22,
                    child: const Image(
                      image: AssetImage("assets/images/floramine_logo.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
} 
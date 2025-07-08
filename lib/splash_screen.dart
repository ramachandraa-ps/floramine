import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment(0.50, 0.00),
                end: Alignment(0.50, 1.00),
                colors: [Color(0xFF54A801), Color(0xFF214200)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: -159,
                  top: 100,
                  child: Container(
                    width: 757,
                    height: 757,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.05),
                      shape: const OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: -205,
                  top: 53,
                  child: Container(
                    width: 850,
                    height: 850,
                    decoration: ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.white.withOpacity(0.10),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -89,
                  top: 169,
                  child: Container(
                    width: 618,
                    height: 618,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.05),
                      shape: const OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: -27,
                  top: 231,
                  child: Container(
                    width: 494,
                    height: 494,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.05),
                      shape: const OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 288,
                  child: Container(
                    width: 380,
                    height: 380,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.05),
                      shape: const OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: 88,
                  top: 347,
                  child: Container(
                    width: 263,
                    height: 263,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.05),
                      shape: const OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: 127,
                  top: 385,
                  child: Container(
                    width: 186,
                    height: 186,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: 154.15,
                  top: 428,
                  child: Container(
                    width: 130.69,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/floramine_logo.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 
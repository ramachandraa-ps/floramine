import 'package:flutter/material.dart';

class CompanyStatsBanner extends StatelessWidget {
  const CompanyStatsBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        color: Color(0xFFEEF6E6),
      ),
      child: Image.asset(
        'assets/images/home_screen/company_stats.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
} 
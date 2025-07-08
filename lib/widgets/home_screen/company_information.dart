import 'package:flutter/material.dart';

class CompanyInformation extends StatelessWidget {
  const CompanyInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 203,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/home_screen/company_information.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
} 
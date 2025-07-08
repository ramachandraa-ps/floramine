import 'package:flutter/material.dart';

class ShippingDetailsSection extends StatelessWidget {
  final String customerName;
  final String address;
  final String phoneNumbers;
  final String paymentMethod;
  final bool isPaid;

  const ShippingDetailsSection({
    Key? key,
    this.customerName = 'Sarath Kumar M S',
    this.address = '123, Andavar Street, Opp to Church,\nMadurai, \nTamilnadu - 625009',
    this.phoneNumbers = '+91 9876543210, +91 78451296320',
    this.paymentMethod = 'UPI Payment',
    this.isPaid = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: [
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
          // Shipping Details Section
          SizedBox(
            width: double.infinity,
            child: Text(
              'Shipping Details',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 19),
          
          // Customer Details
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 353,
                  child: Text(
                    customerName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  address,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.50),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 353,
                  child: Text(
                    phoneNumbers,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.50),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          
          // Payment Method Section
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 353,
                  child: Text(
                    'Payment Method',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  paymentMethod,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.50),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                if (isPaid)
                  Container(
                    width: 100,
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF54A801),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'Paid',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
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
import 'package:flutter/material.dart';
import 'horizontal_product_card.dart';

class HorizontalProductList extends StatelessWidget {
  const HorizontalProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of product data
    final List<Map<String, dynamic>> products = [
      {
        'title': 'Plants',
        'imageUrl': 'assets/images/home_screen/plants.png',
        'isRounded': false,
      },
      {
        'title': 'Premium Seeds',
        'imageUrl': 'assets/images/home_screen/premiumseeds.png',
        'isRounded': false,
      },
      {
        'title': 'Pots & Planters',
        'imageUrl': 'assets/images/home_screen/potsandplanters.png',
        'isRounded': false,
      },
      {
        'title': 'Soil & Fertilizers',
        'imageUrl': 'assets/images/home_screen/soilandfertilizers.png',
        'isRounded': false,
      },
      {
        'title': 'Accessories',
        'imageUrl': 'assets/images/home_screen/accessories.png',
        'isRounded': false,
      },
      {
        'title': 'Pebbles',
        'imageUrl': 'assets/images/home_screen/pebbles.png',
        'isRounded': true,
      },
      {
        'title': 'Gifting',
        'imageUrl': 'assets/images/home_screen/gifting.png',
        'isRounded': false,
      },
      {
        'title': 'Rental Services',
        'imageUrl': 'assets/images/home_screen/rentalservice.png',
        'isRounded': true,
      },
    ];

    return Container(
      height: 160, // Increased height to accommodate two lines of text
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              for (var product in products)
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: HorizontalProductCard(
                    imageUrl: product['imageUrl'],
                    title: product['title'],
                    isRounded: product['isRounded'],
                    isAsset: true, // Using asset images
                    onTap: () {
                      // Handle tap for each product category
                      if (product['title'] == 'Plants') {
                        Navigator.pushNamed(context, '/product_list');
                      } else if (product['title'] == 'Gifting') {
                        Navigator.pushNamed(context, '/gifting');
                      } else if (product['title'] == 'Rental Services') {
                        Navigator.pushNamed(context, '/rental_services');
                      } else {
                        print('Tapped on ${product['title']}');
                      }
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

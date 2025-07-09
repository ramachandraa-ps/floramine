import 'package:flutter/material.dart';
import 'horizontal_product_card.dart';
import '../../screens/categories_screen.dart';
import '../../screens/plants_screen.dart';
import '../../screens/gifting_screen.dart';
import '../../screens/rental_services_screen.dart';
import '../../screens/bundles_screen.dart';

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
      {
        'title': 'Bundles',
        'imageUrl': 'assets/images/home_screen/bundles.png',
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
                      // Navigate based on category
                      switch (product['title']) {
                        case 'Plants':
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PlantsScreen()),
                          );
                          break;
                        case 'Gifting':
                          Navigator.pushNamed(context, '/gifting');
                          break;
                        case 'Rental Services':
                          Navigator.pushNamed(context, '/rental_services');
                          break;
                        case 'Bundles':
                          Navigator.pushNamed(context, '/bundles');
                          break;
                        default:
                          // For other categories, navigate to categories screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CategoriesScreen()),
                          );
                          break;
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

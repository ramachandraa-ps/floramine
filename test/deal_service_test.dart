import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:floramine/services/deal_service.dart';
import 'package:floramine/models/product_model.dart';

void main() {
  group('DealService', () {
    late DealService dealService;
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient((request) async {
        // Check if the request is for the exclusive deals endpoint
        if (request.url.toString() == 'https://erp.floramine.in/api/deals/exclusive-deals-1751982320/products') {
          // Return a successful response with mock data
          return http.Response('''
          {
            "success": true,
            "message": "Deal products fetched successfully",
            "data": [
              {
                "id": 5,
                "name": "snake plant",
                "sku": "0005",
                "tags": null,
                "image": "https://erp.floramine.in/uploads/default-product.png",
                "video": "",
                "product_description": null,
                "category_name": "Plant",
                "sub_category_names": null,
                "brand_name": null,
                "unit_short_name": "Pc(s)",
                "barcode_type": "C128",
                "total_stock": "0",
                "usps": [],
                "variations": [
                  {
                    "id": 5,
                    "variation_name": "DUMMY",
                    "variation_templates": [],
                    "variation_values": [],
                    "variation_combination": "",
                    "sub_sku": "0005",
                    "media": [],
                    "default_price": "₹ 0.00",
                    "default_sell_price": "₹ 25.00",
                    "discount": "₹ 0.00",
                    "deal_offer_price": "₹ 23.75",
                    "deal_discount": "5.00%",
                    "deal_tag": "Exclusive Deals",
                    "is_in_deal": true,
                    "stock": 0
                  }
                ],
                "created_at": "2025-05-21"
              }
            ]
          }
          ''', 200);
        }
        
        // Return 404 for any other request
        return http.Response('Not found', 404);
      });
      
      // Create an instance of DealService with the mock client
      dealService = DealService(client: mockClient);
    });

    tearDown(() {
      dealService.dispose();
    });

    test('getExclusiveDeals returns a list of products on successful API call', () async {
      // Call the method under test
      final products = await dealService.getExclusiveDeals();
      
      // Verify the results
      expect(products, isA<List<Product>>());
      expect(products.length, 1);
      expect(products[0].name, 'snake plant');
      expect(products[0].id, 5);
      
      // Verify variation data
      expect(products[0].variations.length, 1);
      expect(products[0].variations[0].dealOfferPrice, '₹ 23.75');
      expect(products[0].variations[0].dealDiscount, '5.00%');
      expect(products[0].variations[0].isInDeal, true);
    });

    test('getExclusiveDeals throws exception on API error', () async {
      // Create a service with a client that always returns an error
      final errorClient = MockClient((request) async {
        return http.Response('Server error', 500);
      });
      
      final errorService = DealService(client: errorClient);
      
      // Verify that the method throws an exception
      expect(() => errorService.getExclusiveDeals(), throwsException);
      
      // Clean up
      errorService.dispose();
    });
  });
} 
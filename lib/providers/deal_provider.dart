import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/deal_service.dart';

class DealProvider extends ChangeNotifier {
  final DealService _dealService = DealService();
  
  List<Product> _dealProducts = [];
  bool _isLoading = false;
  String? _error;
  bool _hasInternetConnection = true;

  // Getters
  List<Product> get dealProducts => _dealProducts;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasInternetConnection => _hasInternetConnection;
  bool get hasData => _dealProducts.isNotEmpty;

  // Load deal products from API or fallback to mock data
  Future<void> loadDealProducts({bool forceRefresh = false}) async {
    if (_isLoading) return;
    
    if (_dealProducts.isNotEmpty && !forceRefresh) {
      return; // Use cached data if available and no refresh requested
    }
    
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      print("Fetching deal products from API...");
      _dealProducts = await _dealService.getExclusiveDeals();
      _error = null;
      
      // Print debug info
      print("Loaded ${_dealProducts.length} deal products");
      if (_dealProducts.isNotEmpty) {
        final product = _dealProducts.first;
        print("First product: ${product.name}");
        if (product.variations.isNotEmpty) {
          final variation = product.variations.first;
          print("Default price: ${variation.defaultSellPrice}");
          print("Deal price: ${variation.dealOfferPrice ?? 'Not available'}");
          print("Is in deal: ${variation.isInDeal}");
        }
      } else {
        print("No deal products found, using mock data");
        _dealProducts = _dealService.getMockDealProducts();
      }
    } catch (e) {
      _error = e.toString();
      print("Error loading deals: $_error");
      // Fallback to mock data on error
      _dealProducts = _dealService.getMockDealProducts();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  // Refresh data from API
  Future<void> refreshDealProducts() async {
    return loadDealProducts(forceRefresh: true);
  }
  
  // Clean up resources
  @override
  void dispose() {
    _dealService.dispose();
    super.dispose();
  }
} 
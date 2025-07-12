import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/deal_service.dart';

class DealProvider extends ChangeNotifier {
  final DealService _dealService = DealService();
  
  List<Product> _dealProducts = [];
  Map<String, dynamic>? _dealInfo;
  bool _isLoading = false;
  String? _error;
  bool _hasInternetConnection = true;

  // Getters
  List<Product> get dealProducts => _dealProducts;
  Map<String, dynamic>? get dealInfo => _dealInfo;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasInternetConnection => _hasInternetConnection;
  bool get hasData => _dealProducts.isNotEmpty;
  
  // Get formatted end date
  DateTime? get endDate => _dealInfo != null && _dealInfo!['end_date'] != null 
      ? DateTime.parse(_dealInfo!['end_date']) 
      : null;

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
      // First, get the deal information
      print("Fetching deal information from API...");
      final dealInfoResponse = await _dealService.getDealsOfTheDay();
      
      if (dealInfoResponse['success'] == true && dealInfoResponse['data'].isNotEmpty) {
        _dealInfo = dealInfoResponse['data'][0];
        print("Deal info loaded: ${_dealInfo!['name']}");
      }
      
      // Then, get the top deal products
      print("Fetching top deal products from API...");
      _dealProducts = await _dealService.getTopDealProducts();
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
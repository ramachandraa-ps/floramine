import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../services/category_service.dart';

class CategoryContext extends ChangeNotifier {
  final CategoryService _categoryService = CategoryService();
  
  List<Category>? _categories;
  bool _isLoading = false;
  String? _error;
  bool _hasInternetConnection = true;

  // Getters
  List<Category>? get categories => _categories;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasInternetConnection => _hasInternetConnection;
  bool get hasData => _categories != null && _categories!.isNotEmpty;

  // Load categories from API or fallback to mock data
  Future<void> loadCategories({bool forceRefresh = false}) async {
    if (_isLoading) return;
    
    if (_categories != null && !forceRefresh) {
      return; // Use cached data if available and no refresh requested
    }
    
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      // Check for internet connection
      await _checkInternetConnection();
      
      if (_hasInternetConnection) {
        // Try to fetch from API
        _categories = await _categoryService.fetchCategories();
      } else {
        // Use mock data if no internet
        _categories = _categoryService.getMockCategories();
      }
      
      _error = null;
    } catch (e) {
      _error = e.toString();
      // Fallback to mock data on error
      _categories = _categoryService.getMockCategories();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Check for internet connection
  Future<void> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      _hasInternetConnection = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      _hasInternetConnection = false;
    }
  }
} 
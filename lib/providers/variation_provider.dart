import 'package:flutter/material.dart';
import '../models/variation_model.dart';
import '../services/variation_service.dart';

class VariationProvider extends ChangeNotifier {
  final VariationService _variationService = VariationService();
  
  // Available variations
  List<VariationTemplate> _variations = [];
  List<VariationTemplate> get variations => _variations;
  
  // Selected variations
  Map<String, VariationValue> _selectedVariations = {};
  Map<String, VariationValue> get selectedVariations => _selectedVariations;
  
  // Loading states
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  String? _error;
  String? get error => _error;
  
  // Fetch all variations
  Future<void> fetchAllVariations() async {
    _setLoading(true);
    _error = null;
    
    try {
      final VariationResponse response = await _variationService.getAllVariations();
      
      if (response.success) {
        _variations = response.data;
        // Clear selected variations when loading new ones
        _selectedVariations = {};
      } else {
        _error = response.message;
      }
    } catch (e) {
      _error = e.toString();
      print("Error fetching variations: $_error");
    } finally {
      _setLoading(false);
    }
  }
  
  // Fetch variations for a specific product
  Future<void> fetchVariationsForProduct(int productId) async {
    _setLoading(true);
    _error = null;
    
    try {
      final VariationResponse response = await _variationService.getVariationsForProduct(productId);
      
      if (response.success) {
        _variations = response.data;
        // Clear selected variations when loading new ones
        _selectedVariations = {};
      } else {
        _error = response.message;
      }
    } catch (e) {
      _error = e.toString();
      print("Error fetching product variations: $_error");
    } finally {
      _setLoading(false);
    }
  }
  
  // Select a variation value
  void selectVariation(String templateName, VariationValue value) {
    _selectedVariations[templateName] = value;
    notifyListeners();
  }
  
  // Clear selected variations
  void clearSelections() {
    _selectedVariations = {};
    notifyListeners();
  }
  
  // Get available variations by template name
  List<VariationValue> getVariationValuesByTemplateName(String templateName) {
    final template = _variations.firstWhere(
      (template) => template.templateName.toLowerCase() == templateName.toLowerCase(),
      orElse: () => VariationTemplate(templateId: 0, templateName: templateName, values: []),
    );
    
    return template.values;
  }
  
  // Check if a specific variation is selected
  bool isVariationSelected(String templateName, int valueId) {
    if (!_selectedVariations.containsKey(templateName)) {
      return false;
    }
    
    return _selectedVariations[templateName]!.valueId == valueId;
  }
  
  // Helper method to set loading state
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
} 
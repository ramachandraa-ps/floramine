import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/variation_model.dart';
import '../../providers/variation_provider.dart';

class VariationSelector extends StatefulWidget {
  final int productId;
  final Function(Map<String, VariationValue>)? onVariationsSelected;

  const VariationSelector({
    Key? key,
    required this.productId,
    this.onVariationsSelected,
  }) : super(key: key);

  @override
  State<VariationSelector> createState() => _VariationSelectorState();
}

class _VariationSelectorState extends State<VariationSelector> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    if (!_isInitialized) {
      _loadVariations();
      _isInitialized = true;
    }
  }

  Future<void> _loadVariations() async {
    final variationProvider = Provider.of<VariationProvider>(context, listen: false);
    await variationProvider.fetchAllVariations();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VariationProvider>(
      builder: (context, variationProvider, child) {
        if (variationProvider.isLoading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(color: Color(0xFF54A801)),
            ),
          );
        }

        if (variationProvider.error != null) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Error loading variations: ${variationProvider.error}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (variationProvider.variations.isEmpty) {
          return const SizedBox.shrink();
        }

        // Group variations by template name (size, color, etc.)
        final Map<String, List<VariationTemplate>> groupedVariations = {};
        
        for (var template in variationProvider.variations) {
          if (!groupedVariations.containsKey(template.templateName.toLowerCase())) {
            groupedVariations[template.templateName.toLowerCase()] = [];
          }
          groupedVariations[template.templateName.toLowerCase()]!.add(template);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Size selection
            if (groupedVariations.containsKey('size'))
              _buildVariationSection(
                'Size',
                groupedVariations['size']!,
                variationProvider,
              ),
            
            const SizedBox(height: 20),
            
            // Color selection
            if (groupedVariations.containsKey('color'))
              _buildVariationSection(
                'Colour',
                groupedVariations['color']!,
                variationProvider,
              ),
          ],
        );
      },
    );
  }

  Widget _buildVariationSection(
    String title,
    List<VariationTemplate> templates,
    VariationProvider variationProvider,
  ) {
    // Combine all values from templates with the same name
    final List<VariationValue> allValues = [];
    for (var template in templates) {
      allValues.addAll(template.values);
    }
    
    // Remove duplicates (based on value name)
    final uniqueValues = <String, VariationValue>{};
    for (var value in allValues) {
      uniqueValues[value.valueName.toLowerCase()] = value;
    }
    
    final values = uniqueValues.values.toList();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select $title',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Cabin',
            fontWeight: FontWeight.w500,
          ),
        ),
        
        const SizedBox(height: 10),
        
        Container(
          padding: const EdgeInsets.all(2),
          decoration: ShapeDecoration(
            color: const Color(0xFFEAEAEA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: values.map((value) {
              final isSelected = variationProvider.isVariationSelected(
                title.toLowerCase(),
                value.valueId,
              );
              
              return GestureDetector(
                onTap: () {
                  variationProvider.selectVariation(title.toLowerCase(), value);
                  
                  if (widget.onVariationsSelected != null) {
                    widget.onVariationsSelected!(variationProvider.selectedVariations);
                  }
                },
                child: title.toLowerCase() == 'colour'
                    ? _buildColorOption(value.valueName, isSelected)
                    : _buildSizeOption(value.valueName, isSelected),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSizeOption(String size, bool isSelected) {
    return Container(
      width: 30,
      height: 30,
      decoration: ShapeDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          size.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Cabin',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildColorOption(String colorName, bool isSelected) {
    // Map color names to actual colors
    final Map<String, Color> colorMap = {
      'red': Colors.red,
      'black': Colors.black,
      'green': Colors.green,
      'blue': Colors.blue,
      'white': Colors.white,
      'yellow': Colors.yellow,
      'purple': Colors.purple,
      'orange': Colors.orange,
      'pink': Colors.pink,
      'brown': Colors.brown,
      'grey': Colors.grey,
    };

    final color = colorMap[colorName.toLowerCase()] ?? Colors.grey;

    return Container(
      width: 30,
      height: 30,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          side: isSelected 
              ? const BorderSide(
                  width: 1,
                  color: Color(0xFF316300),
                )
              : BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
} 
import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  final Function? onApplyFilters;
  final Function? onClearFilters;
  final bool showOverlay;
  final Function onClose;
  final Function? onApply;

  const FilterWidget({
    Key? key,
    this.onApplyFilters,
    this.onClearFilters,
    this.showOverlay = true,
    required this.onClose,
    this.onApply,
  }) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  // Filter states
  bool _belowFiveHundred = false;
  bool _betweenFiveHundredAndThousand = false;
  bool _aboveThousand = false;
  bool _smallSize = false;
  bool _mediumSize = false;
  bool _largeSize = false;
  bool _redColor = false;
  bool _blueColor = false;
  bool _greenColor = false;

  void _applyFilters() {
    if (widget.onApplyFilters != null) {
      // You can create a map of filter values to pass to the parent
      final filterValues = {
        'price': {
          'below_500': _belowFiveHundred,
          'between_500_1000': _betweenFiveHundredAndThousand,
          'above_1000': _aboveThousand,
        },
        'size': {
          'small': _smallSize,
          'medium': _mediumSize,
          'large': _largeSize,
        },
        'color': {
          'red': _redColor,
          'blue': _blueColor,
          'green': _greenColor,
        },
      };
      
      widget.onApplyFilters!(filterValues);
    }
    
    // Use the onApply callback if provided
    if (widget.onApply != null) {
      final filterValues = {
        'price': {
          'below_500': _belowFiveHundred,
          'between_500_1000': _betweenFiveHundredAndThousand,
          'above_1000': _aboveThousand,
        },
        'size': {
          'small': _smallSize,
          'medium': _mediumSize,
          'large': _largeSize,
        },
        'color': {
          'red': _redColor,
          'blue': _blueColor,
          'green': _greenColor,
        },
      };
      
      widget.onApply!(filterValues);
    }
    
    widget.onClose();
  }

  void _clearFilters() {
    setState(() {
      _belowFiveHundred = false;
      _betweenFiveHundredAndThousand = false;
      _aboveThousand = false;
      _smallSize = false;
      _mediumSize = false;
      _largeSize = false;
      _redColor = false;
      _blueColor = false;
      _greenColor = false;
    });
    
    if (widget.onClearFilters != null) {
      widget.onClearFilters!();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.showOverlay) {
      return const SizedBox.shrink();
    }

    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 30,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Filters',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => widget.onClose(),
                        child: const Icon(
                          Icons.close,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0x33000000),
                ),
                
                // Filter content (scrollable)
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Price section
                        const Text(
                          'Price',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildCheckbox('Below ₹ 500', _belowFiveHundred, (value) {
                          setState(() {
                            _belowFiveHundred = value!;
                          });
                        }),
                        _buildCheckbox('₹ 500 - ₹ 1000', _betweenFiveHundredAndThousand, (value) {
                          setState(() {
                            _betweenFiveHundredAndThousand = value!;
                          });
                        }),
                        _buildCheckbox('₹ 1000 Above', _aboveThousand, (value) {
                          setState(() {
                            _aboveThousand = value!;
                          });
                        }),
                        
                        const Divider(
                          height: 20,
                          thickness: 1,
                          color: Color(0x33000000),
                        ),
                        
                        // Size section
                        const Text(
                          'Size',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildCheckbox('Small', _smallSize, (value) {
                          setState(() {
                            _smallSize = value!;
                          });
                        }),
                        _buildCheckbox('Medium', _mediumSize, (value) {
                          setState(() {
                            _mediumSize = value!;
                          });
                        }),
                        _buildCheckbox('Large', _largeSize, (value) {
                          setState(() {
                            _largeSize = value!;
                          });
                        }),
                        
                        const Divider(
                          height: 20,
                          thickness: 1,
                          color: Color(0x33000000),
                        ),
                        
                        // Color section
                        const Text(
                          'Colour',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildCheckbox('Red', _redColor, (value) {
                          setState(() {
                            _redColor = value!;
                          });
                        }),
                        _buildCheckbox('Blue', _blueColor, (value) {
                          setState(() {
                            _blueColor = value!;
                          });
                        }),
                        _buildCheckbox('Green', _greenColor, (value) {
                          setState(() {
                            _greenColor = value!;
                          });
                        }),
                        
                        const SizedBox(height: 20),
                        
                        // Action buttons
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 44,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xFF316300),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                child: TextButton(
                                  onPressed: _clearFilters,
                                  child: const Text(
                                    'Clear',
                                    style: TextStyle(
                                      color: Color(0xFF316300),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                height: 44,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF316300),
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                child: TextButton(
                                  onPressed: _applyFilters,
                                  child: const Text(
                                    'Apply',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(String label, bool value, Function(bool?) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF316300),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
} 
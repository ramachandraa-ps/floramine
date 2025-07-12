class VariationResponse {
  final bool success;
  final String message;
  final List<VariationTemplate> data;

  VariationResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory VariationResponse.fromJson(Map<String, dynamic> json) {
    List<VariationTemplate> templates = [];
    
    if (json['data'] != null && json['data'] is List) {
      templates = (json['data'] as List)
          .map((template) => VariationTemplate.fromJson(template))
          .toList();
    }

    return VariationResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: templates,
    );
  }
}

class VariationTemplate {
  final int templateId;
  final String templateName;
  final List<VariationValue> values;

  VariationTemplate({
    required this.templateId,
    required this.templateName,
    required this.values,
  });

  factory VariationTemplate.fromJson(Map<String, dynamic> json) {
    List<VariationValue> valuesList = [];
    
    if (json['values'] != null && json['values'] is List) {
      valuesList = (json['values'] as List)
          .map((value) => VariationValue.fromJson(value))
          .toList();
    }

    return VariationTemplate(
      templateId: json['template_id'] ?? 0,
      templateName: json['template_name'] ?? '',
      values: valuesList,
    );
  }
}

class VariationValue {
  final int valueId;
  final String valueName;

  VariationValue({
    required this.valueId,
    required this.valueName,
  });

  factory VariationValue.fromJson(Map<String, dynamic> json) {
    return VariationValue(
      valueId: json['value_id'] ?? 0,
      valueName: json['value_name'] ?? '',
    );
  }
} 
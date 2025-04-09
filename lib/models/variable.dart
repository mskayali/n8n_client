// lib/models/variable.dart

class Variable {
  final String id;
  final String key;
  final String value;
  final String? type;

  Variable({
    required this.id,
    required this.key,
    required this.value,
    this.type,
  });

  factory Variable.fromJson(Map<String, dynamic> json) {
    return Variable(
      id: json['id'] ?? '',
      key: json['key'] ?? '',
      value: json['value'] ?? '',
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'key': key,
      'value': value,
      if (type != null) 'type': type,
    };
  }
}

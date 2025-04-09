// lib/models/credential.dart

class Credential {
  final String id;
  final String name;
  final String type;
  final Map<String, dynamic>? data;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Credential({
    required this.id,
    required this.name,
    required this.type,
    this.data,
    this.createdAt,
    this.updatedAt,
  });

  factory Credential.fromJson(Map<String, dynamic> json) {
    return Credential(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      data: json['data'] != null ? Map<String, dynamic>.from(json['data']) : null,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      if (data != null) 'data': data,
      if (createdAt != null) 'createdAt': createdAt?.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

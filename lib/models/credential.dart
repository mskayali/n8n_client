// lib/models/credential.dart

class Credential {
  final String id;
  final String name;
  final String type;
  final Map<String, dynamic>? data;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isResolvable;
  final bool? isGlobal;
  final bool? isPartialData;

  Credential({
    required this.id,
    required this.name,
    required this.type,
    this.data,
    this.createdAt,
    this.updatedAt,
    this.isResolvable,
    this.isGlobal,
    this.isPartialData,
  });

  factory Credential.fromJson(Map<String, dynamic> json) {
    return Credential(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      data: json['data'] != null ? Map<String, dynamic>.from(json['data']) : null,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      isResolvable: json['isResolvable'],
      isGlobal: json['isGlobal'],
      isPartialData: json['isPartialData'],
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
      if (isResolvable != null) 'isResolvable': isResolvable,
      if (isGlobal != null) 'isGlobal': isGlobal,
      if (isPartialData != null) 'isPartialData': isPartialData,
    };
  }
}

/// Credential schema definition from API
class CredentialSchema {
  final List<CredentialProperty>? properties;
  final String? displayName;
  final String? name;
  final String? documentationUrl;

  CredentialSchema({
    this.properties,
    this.displayName,
    this.name,
    this.documentationUrl,
  });

  factory CredentialSchema.fromJson(Map<String, dynamic> json) {
    return CredentialSchema(
      properties: json['properties'] != null
          ? List<CredentialProperty>.from(
              json['properties'].map((p) => CredentialProperty.fromJson(p)))
          : null,
      displayName: json['displayName'],
      name: json['name'],
      documentationUrl: json['documentationUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (properties != null)
        'properties': properties!.map((p) => p.toJson()).toList(),
      if (displayName != null) 'displayName': displayName,
      if (name != null) 'name': name,
      if (documentationUrl != null) 'documentationUrl': documentationUrl,
    };
  }
}

/// Property definition for credential schema
class CredentialProperty {
  final String? displayName;
  final String? name;
  final String? type;
  final bool? required;
  final dynamic defaultValue;
  final String? description;
  final List<CredentialPropertyOption>? options;

  CredentialProperty({
    this.displayName,
    this.name,
    this.type,
    this.required,
    this.defaultValue,
    this.description,
    this.options,
  });

  factory CredentialProperty.fromJson(Map<String, dynamic> json) {
    return CredentialProperty(
      displayName: json['displayName'],
      name: json['name'],
      type: json['type'],
      required: json['required'],
      defaultValue: json['default'],
      description: json['description'],
      options: json['options'] != null
          ? List<CredentialPropertyOption>.from(
              json['options'].map((o) => CredentialPropertyOption.fromJson(o)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (displayName != null) 'displayName': displayName,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (required != null) 'required': required,
      if (defaultValue != null) 'default': defaultValue,
      if (description != null) 'description': description,
      if (options != null) 'options': options!.map((o) => o.toJson()).toList(),
    };
  }
}

/// Option for credential property
class CredentialPropertyOption {
  final String? name;
  final dynamic value;

  CredentialPropertyOption({
    this.name,
    this.value,
  });

  factory CredentialPropertyOption.fromJson(Map<String, dynamic> json) {
    return CredentialPropertyOption(
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    };
  }
}

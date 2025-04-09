// lib/models/user.dart

class User {
  final String id;
  final String email;
  final String? firstName;
  final String? lastName;
  final bool? isPending;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? role;

  User({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    this.isPending,
    this.createdAt,
    this.updatedAt,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'],
      lastName: json['lastName'],
      isPending: json['isPending'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (isPending != null) 'isPending': isPending,
      if (createdAt != null) 'createdAt': createdAt?.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toIso8601String(),
      if (role != null) 'role': role,
    };
  }
}

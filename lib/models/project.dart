// lib/models/project.dart

class Project {
  final String id;
  final String name;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<ProjectRelation>? relations;

  Project({
    required this.id,
    required this.name,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.relations,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      type: json['type'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      relations: json['relations'] != null
          ? List<ProjectRelation>.from(
              json['relations'].map((r) => ProjectRelation.fromJson(r)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (type != null) 'type': type,
      if (createdAt != null) 'createdAt': createdAt?.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toIso8601String(),
      if (relations != null)
        'relations': relations!.map((r) => r.toJson()).toList(),
    };
  }
}

/// Project user relation
class ProjectRelation {
  final String? userId;
  final String? role;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProjectRelation({
    this.userId,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory ProjectRelation.fromJson(Map<String, dynamic> json) {
    return ProjectRelation(
      userId: json['userId'],
      role: json['role'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (userId != null) 'userId': userId,
      if (role != null) 'role': role,
      if (createdAt != null) 'createdAt': createdAt?.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

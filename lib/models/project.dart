// lib/models/project.dart

class Project {
  final String id;
  final String name;
  final String? type;

  Project({
    required this.id,
    required this.name,
    this.type,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (type != null) 'type': type,
    };
  }
}

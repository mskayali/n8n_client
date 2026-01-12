// lib/models/variable.dart

import 'project.dart';

class Variable {
  final String id;
  final String key;
  final String value;
  final String? type;
  final String? projectId;
  final Project? project;

  Variable({
    required this.id,
    required this.key,
    required this.value,
    this.type,
    this.projectId,
    this.project,
  });

  factory Variable.fromJson(Map<String, dynamic> json) {
    return Variable(
      id: json['id']?.toString() ?? '',
      key: json['key'] ?? '',
      value: json['value'] ?? '',
      type: json['type'],
      projectId: json['projectId'],
      project: json['project'] != null ? Project.fromJson(json['project']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'key': key,
      'value': value,
      if (type != null) 'type': type,
      if (projectId != null) 'projectId': projectId,
      if (project != null) 'project': project!.toJson(),
    };
  }
}

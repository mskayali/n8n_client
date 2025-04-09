// lib/models/workflow.dart

import 'tag.dart';

class Workflow {
  final String id;
  final String name;
  final bool? active;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic> nodes; // TODO: Create a Node model
  final Map<String, dynamic> connections;
  final Map<String, dynamic> settings;
  final dynamic staticData;
  final List<Tag>? tags;

  Workflow({
    required this.id,
    required this.name,
    this.active,
    this.createdAt,
    this.updatedAt,
    required this.nodes,
    required this.connections,
    required this.settings,
    this.staticData,
    this.tags,
  });

  factory Workflow.fromJson(Map<String, dynamic> json) {
    return Workflow(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      active: json['active'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      nodes: json['nodes'] ?? [],
      connections: Map<String, dynamic>.from(json['connections'] ?? {}),
      settings: Map<String, dynamic>.from(json['settings'] ?? {}),
      staticData: json['staticData'],
      tags: json['tags'] != null ? List<Tag>.from(json['tags'].map((tag) => Tag.fromJson(tag))) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (active != null) 'active': active,
      if (createdAt != null) 'createdAt': createdAt?.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toIso8601String(),
      'nodes': nodes,
      'connections': connections,
      'settings': settings,
      'staticData': staticData,
      if (tags != null) 'tags': tags!.map((tag) => tag.toJson()).toList(),
    };
  }
}

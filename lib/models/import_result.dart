// lib/models/import_result.dart

class ImportResult {
  final Map<String, List<String>>? variables;
  final List<CredentialInfo>? credentials;
  final List<WorkflowInfo>? workflows;
  final TagMapping? tags;

  ImportResult({
    this.variables,
    this.credentials,
    this.workflows,
    this.tags,
  });

  factory ImportResult.fromJson(Map<String, dynamic> json) {
    return ImportResult(
      variables: json['variables'] != null
          ? Map<String, List<String>>.from((json['variables'] as Map).map(
              (key, value) => MapEntry(key, List<String>.from(value)),
            ))
          : null,
      credentials: json['credentials'] != null
          ? List<CredentialInfo>.from(
              json['credentials'].map((x) => CredentialInfo.fromJson(x)),
            )
          : null,
      workflows: json['workflows'] != null
          ? List<WorkflowInfo>.from(
              json['workflows'].map((x) => WorkflowInfo.fromJson(x)),
            )
          : null,
      tags: json['tags'] != null ? TagMapping.fromJson(json['tags']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (variables != null) 'variables': variables,
      if (credentials != null) 'credentials': credentials!.map((x) => x.toJson()).toList(),
      if (workflows != null) 'workflows': workflows!.map((x) => x.toJson()).toList(),
      if (tags != null) 'tags': tags!.toJson(),
    };
  }
}

class CredentialInfo {
  final String id;
  final String name;
  final String type;

  CredentialInfo({
    required this.id,
    required this.name,
    required this.type,
  });

  factory CredentialInfo.fromJson(Map<String, dynamic> json) {
    return CredentialInfo(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
    };
  }
}

class WorkflowInfo {
  final String id;
  final String name;

  WorkflowInfo({
    required this.id,
    required this.name,
  });

  factory WorkflowInfo.fromJson(Map<String, dynamic> json) {
    return WorkflowInfo(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class TagMapping {
  final List<TagInfo> tags;
  final List<TagAssignment> mappings;

  TagMapping({
    required this.tags,
    required this.mappings,
  });

  factory TagMapping.fromJson(Map<String, dynamic> json) {
    return TagMapping(
      tags: List<TagInfo>.from(json['tags'].map((x) => TagInfo.fromJson(x))),
      mappings: List<TagAssignment>.from(json['mappings'].map((x) => TagAssignment.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tags': tags.map((x) => x.toJson()).toList(),
      'mappings': mappings.map((x) => x.toJson()).toList(),
    };
  }
}

class TagInfo {
  final String id;
  final String name;

  TagInfo({
    required this.id,
    required this.name,
  });

  factory TagInfo.fromJson(Map<String, dynamic> json) {
    return TagInfo(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class TagAssignment {
  final String workflowId;
  final String tagId;

  TagAssignment({
    required this.workflowId,
    required this.tagId,
  });

  factory TagAssignment.fromJson(Map<String, dynamic> json) {
    return TagAssignment(
      workflowId: json['workflowId'] ?? '',
      tagId: json['tagId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'workflowId': workflowId,
      'tagId': tagId,
    };
  }
}

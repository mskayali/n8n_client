// lib/models/workflow.dart

import 'tag.dart';

class Workflow {
  final String id;
  final String name;
  final bool? active;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Node> nodes;
  final Map<String, dynamic> connections;
  final WorkflowSettings settings;
  final dynamic staticData;
  final List<Tag>? tags;
  final List<WorkflowShare>? shared;
  final ActiveVersion? activeVersion;

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
    this.shared,
    this.activeVersion,
  });

  factory Workflow.fromJson(Map<String, dynamic> json) {
    return Workflow(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      active: json['active'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      nodes: json['nodes'] != null
          ? List<Node>.from(json['nodes'].map((node) => Node.fromJson(node)))
          : [],
      connections: Map<String, dynamic>.from(json['connections'] ?? {}),
      settings: WorkflowSettings.fromJson(json['settings'] ?? {}),
      staticData: json['staticData'],
      tags: json['tags'] != null
          ? List<Tag>.from(json['tags'].map((tag) => Tag.fromJson(tag)))
          : null,
      shared: json['shared'] != null
          ? List<WorkflowShare>.from(json['shared'].map((s) => WorkflowShare.fromJson(s)))
          : null,
      activeVersion: json['activeVersion'] != null
          ? ActiveVersion.fromJson(json['activeVersion'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (active != null) 'active': active,
      if (createdAt != null) 'createdAt': createdAt?.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toIso8601String(),
      'nodes': nodes.map((node) => node.toJson()).toList(),
      'connections': connections,
      'settings': settings.toJson(),
      if (staticData != null) 'staticData': staticData,
      if (tags != null) 'tags': tags!.map((tag) => tag.toJson()).toList(),
      if (shared != null) 'shared': shared!.map((s) => s.toJson()).toList(),
      if (activeVersion != null) 'activeVersion': activeVersion!.toJson(),
    };
  }
}

/// Represents a node in the workflow
class Node {
  final String id;
  final String name;
  final String type;
  final List<double>? position;
  final Map<String, dynamic>? parameters;
  final Map<String, dynamic>? credentials;
  final bool? disabled;
  final String? notes;
  final bool? notesInFlow;
  final int? retryOnFail;
  final int? maxTries;
  final int? waitBetweenTries;
  final bool? continueOnFail;
  final bool? pairedItem;
  final String? onError;
  final dynamic typeVersion;
  final bool? alwaysOutputData;
  final bool? executeOnce;

  Node({
    required this.id,
    required this.name,
    required this.type,
    this.position,
    this.parameters,
    this.credentials,
    this.disabled,
    this.notes,
    this.notesInFlow,
    this.retryOnFail,
    this.maxTries,
    this.waitBetweenTries,
    this.continueOnFail,
    this.pairedItem,
    this.onError,
    this.typeVersion,
    this.alwaysOutputData,
    this.executeOnce,
  });

  factory Node.fromJson(Map<String, dynamic> json) {
    return Node(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      position: json['position'] != null
          ? List<double>.from(json['position'].map((p) => (p as num).toDouble()))
          : null,
      parameters: json['parameters'] != null
          ? Map<String, dynamic>.from(json['parameters'])
          : null,
      credentials: json['credentials'] != null
          ? Map<String, dynamic>.from(json['credentials'])
          : null,
      disabled: json['disabled'],
      notes: json['notes'],
      notesInFlow: json['notesInFlow'],
      retryOnFail: json['retryOnFail'],
      maxTries: json['maxTries'],
      waitBetweenTries: json['waitBetweenTries'],
      continueOnFail: json['continueOnFail'],
      pairedItem: json['pairedItem'],
      onError: json['onError'],
      typeVersion: json['typeVersion'],
      alwaysOutputData: json['alwaysOutputData'],
      executeOnce: json['executeOnce'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      if (position != null) 'position': position,
      if (parameters != null) 'parameters': parameters,
      if (credentials != null) 'credentials': credentials,
      if (disabled != null) 'disabled': disabled,
      if (notes != null) 'notes': notes,
      if (notesInFlow != null) 'notesInFlow': notesInFlow,
      if (retryOnFail != null) 'retryOnFail': retryOnFail,
      if (maxTries != null) 'maxTries': maxTries,
      if (waitBetweenTries != null) 'waitBetweenTries': waitBetweenTries,
      if (continueOnFail != null) 'continueOnFail': continueOnFail,
      if (pairedItem != null) 'pairedItem': pairedItem,
      if (onError != null) 'onError': onError,
      if (typeVersion != null) 'typeVersion': typeVersion,
      if (alwaysOutputData != null) 'alwaysOutputData': alwaysOutputData,
      if (executeOnce != null) 'executeOnce': executeOnce,
    };
  }
}

/// Workflow settings configuration
class WorkflowSettings {
  final bool? saveExecutionProgress;
  final bool? saveManualExecutions;
  final String? saveDataErrorExecution;
  final String? saveDataSuccessExecution;
  final int? executionTimeout;
  final String? timezone;
  final Map<String, dynamic>? errorWorkflow;
  final String? callerPolicy;
  final List<String>? callerIds;

  WorkflowSettings({
    this.saveExecutionProgress,
    this.saveManualExecutions,
    this.saveDataErrorExecution,
    this.saveDataSuccessExecution,
    this.executionTimeout,
    this.timezone,
    this.errorWorkflow,
    this.callerPolicy,
    this.callerIds,
  });

  factory WorkflowSettings.fromJson(Map<String, dynamic> json) {
    return WorkflowSettings(
      saveExecutionProgress: json['saveExecutionProgress'],
      saveManualExecutions: json['saveManualExecutions'],
      saveDataErrorExecution: json['saveDataErrorExecution'],
      saveDataSuccessExecution: json['saveDataSuccessExecution'],
      executionTimeout: json['executionTimeout'],
      timezone: json['timezone'],
      errorWorkflow: json['errorWorkflow'] != null
          ? Map<String, dynamic>.from(json['errorWorkflow'])
          : null,
      callerPolicy: json['callerPolicy'],
      callerIds: json['callerIds'] != null
          ? List<String>.from(json['callerIds'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (saveExecutionProgress != null) 'saveExecutionProgress': saveExecutionProgress,
      if (saveManualExecutions != null) 'saveManualExecutions': saveManualExecutions,
      if (saveDataErrorExecution != null) 'saveDataErrorExecution': saveDataErrorExecution,
      if (saveDataSuccessExecution != null) 'saveDataSuccessExecution': saveDataSuccessExecution,
      if (executionTimeout != null) 'executionTimeout': executionTimeout,
      if (timezone != null) 'timezone': timezone,
      if (errorWorkflow != null) 'errorWorkflow': errorWorkflow,
      if (callerPolicy != null) 'callerPolicy': callerPolicy,
      if (callerIds != null) 'callerIds': callerIds,
    };
  }
}

/// Workflow sharing information
class WorkflowShare {
  final String? id;
  final String? userId;
  final String? workflowId;
  final String? role;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  WorkflowShare({
    this.id,
    this.userId,
    this.workflowId,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory WorkflowShare.fromJson(Map<String, dynamic> json) {
    return WorkflowShare(
      id: json['id'],
      userId: json['userId'],
      workflowId: json['workflowId'],
      role: json['role'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      if (workflowId != null) 'workflowId': workflowId,
      if (role != null) 'role': role,
      if (createdAt != null) 'createdAt': createdAt?.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

/// Active version information for workflow
class ActiveVersion {
  final int? id;
  final int? versionId;
  final String? workflowId;
  final DateTime? createdAt;

  ActiveVersion({
    this.id,
    this.versionId,
    this.workflowId,
    this.createdAt,
  });

  factory ActiveVersion.fromJson(Map<String, dynamic> json) {
    return ActiveVersion(
      id: json['id'],
      versionId: json['versionId'],
      workflowId: json['workflowId'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (versionId != null) 'versionId': versionId,
      if (workflowId != null) 'workflowId': workflowId,
      if (createdAt != null) 'createdAt': createdAt?.toIso8601String(),
    };
  }
}

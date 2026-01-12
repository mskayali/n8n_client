// lib/models/audit.dart

/// Audit report containing security risk assessments
class AuditReport {
  final RiskReport? credentials;
  final RiskReport? database;
  final RiskReport? filesystem;
  final RiskReport? nodes;
  final RiskReport? instance;

  AuditReport({
    this.credentials,
    this.database,
    this.filesystem,
    this.nodes,
    this.instance,
  });

  factory AuditReport.fromJson(Map<String, dynamic> json) {
    return AuditReport(
      credentials: json['credentials'] != null
          ? RiskReport.fromJson(json['credentials'])
          : null,
      database: json['database'] != null
          ? RiskReport.fromJson(json['database'])
          : null,
      filesystem: json['filesystem'] != null
          ? RiskReport.fromJson(json['filesystem'])
          : null,
      nodes: json['nodes'] != null
          ? RiskReport.fromJson(json['nodes'])
          : null,
      instance: json['instance'] != null
          ? RiskReport.fromJson(json['instance'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (credentials != null) 'credentials': credentials!.toJson(),
      if (database != null) 'database': database!.toJson(),
      if (filesystem != null) 'filesystem': filesystem!.toJson(),
      if (nodes != null) 'nodes': nodes!.toJson(),
      if (instance != null) 'instance': instance!.toJson(),
    };
  }
}

/// Individual risk report section
class RiskReport {
  final String? risk;
  final List<RiskSection>? sections;

  RiskReport({
    this.risk,
    this.sections,
  });

  factory RiskReport.fromJson(Map<String, dynamic> json) {
    return RiskReport(
      risk: json['risk'],
      sections: json['sections'] != null
          ? List<RiskSection>.from(
              json['sections'].map((s) => RiskSection.fromJson(s)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (risk != null) 'risk': risk,
      if (sections != null)
        'sections': sections!.map((s) => s.toJson()).toList(),
    };
  }
}

/// Section within a risk report
class RiskSection {
  final String? title;
  final String? description;
  final String? recommendation;
  final List<RiskLocation>? location;

  RiskSection({
    this.title,
    this.description,
    this.recommendation,
    this.location,
  });

  factory RiskSection.fromJson(Map<String, dynamic> json) {
    return RiskSection(
      title: json['title'],
      description: json['description'],
      recommendation: json['recommendation'],
      location: json['location'] != null
          ? List<RiskLocation>.from(
              json['location'].map((l) => RiskLocation.fromJson(l)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (recommendation != null) 'recommendation': recommendation,
      if (location != null)
        'location': location!.map((l) => l.toJson()).toList(),
    };
  }
}

/// Location reference for a risk
class RiskLocation {
  final String? kind;
  final String? workflowId;
  final String? workflowName;
  final String? nodeId;
  final String? nodeName;
  final String? nodeType;
  final String? credentialId;
  final String? credentialName;
  final String? credentialType;

  RiskLocation({
    this.kind,
    this.workflowId,
    this.workflowName,
    this.nodeId,
    this.nodeName,
    this.nodeType,
    this.credentialId,
    this.credentialName,
    this.credentialType,
  });

  factory RiskLocation.fromJson(Map<String, dynamic> json) {
    return RiskLocation(
      kind: json['kind'],
      workflowId: json['workflowId'],
      workflowName: json['workflowName'],
      nodeId: json['nodeId'],
      nodeName: json['nodeName'],
      nodeType: json['nodeType'],
      credentialId: json['credentialId'],
      credentialName: json['credentialName'],
      credentialType: json['credentialType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (kind != null) 'kind': kind,
      if (workflowId != null) 'workflowId': workflowId,
      if (workflowName != null) 'workflowName': workflowName,
      if (nodeId != null) 'nodeId': nodeId,
      if (nodeName != null) 'nodeName': nodeName,
      if (nodeType != null) 'nodeType': nodeType,
      if (credentialId != null) 'credentialId': credentialId,
      if (credentialName != null) 'credentialName': credentialName,
      if (credentialType != null) 'credentialType': credentialType,
    };
  }
}

/// Audit generation options
class AuditOptions {
  final int? daysAbandonedWorkflow;
  final List<String>? categories;

  AuditOptions({
    this.daysAbandonedWorkflow,
    this.categories,
  });

  factory AuditOptions.fromJson(Map<String, dynamic> json) {
    return AuditOptions(
      daysAbandonedWorkflow: json['daysAbandonedWorkflow'],
      categories: json['categories'] != null
          ? List<String>.from(json['categories'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (daysAbandonedWorkflow != null)
        'daysAbandonedWorkflow': daysAbandonedWorkflow,
      if (categories != null) 'categories': categories,
    };
  }
}

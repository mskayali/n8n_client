// lib/models/pagination.dart

/// Generic paginated list response
class PaginatedList<T> {
  final List<T> data;
  final String? nextCursor;

  PaginatedList({
    required this.data,
    this.nextCursor,
  });

  factory PaginatedList.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PaginatedList(
      data: json['data'] != null
          ? List<T>.from(json['data'].map((item) => fromJsonT(item)))
          : [],
      nextCursor: json['nextCursor'],
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'data': data.map((item) => toJsonT(item)).toList(),
      if (nextCursor != null) 'nextCursor': nextCursor,
    };
  }

  bool get hasMore => nextCursor != null;
}

/// Workflow list response
class WorkflowListResponse {
  final List<Map<String, dynamic>> data;
  final String? nextCursor;

  WorkflowListResponse({
    required this.data,
    this.nextCursor,
  });

  factory WorkflowListResponse.fromJson(Map<String, dynamic> json) {
    return WorkflowListResponse(
      data: json['data'] != null
          ? List<Map<String, dynamic>>.from(json['data'])
          : [],
      nextCursor: json['nextCursor'],
    );
  }

  bool get hasMore => nextCursor != null;
}

/// Execution list response
class ExecutionListResponse {
  final List<Map<String, dynamic>> data;
  final String? nextCursor;

  ExecutionListResponse({
    required this.data,
    this.nextCursor,
  });

  factory ExecutionListResponse.fromJson(Map<String, dynamic> json) {
    return ExecutionListResponse(
      data: json['data'] != null
          ? List<Map<String, dynamic>>.from(json['data'])
          : [],
      nextCursor: json['nextCursor'],
    );
  }

  bool get hasMore => nextCursor != null;
}

/// User list response
class UserListResponse {
  final List<Map<String, dynamic>> data;
  final String? nextCursor;

  UserListResponse({
    required this.data,
    this.nextCursor,
  });

  factory UserListResponse.fromJson(Map<String, dynamic> json) {
    return UserListResponse(
      data: json['data'] != null
          ? List<Map<String, dynamic>>.from(json['data'])
          : [],
      nextCursor: json['nextCursor'],
    );
  }

  bool get hasMore => nextCursor != null;
}

/// Tag list response
class TagListResponse {
  final List<Map<String, dynamic>> data;
  final String? nextCursor;

  TagListResponse({
    required this.data,
    this.nextCursor,
  });

  factory TagListResponse.fromJson(Map<String, dynamic> json) {
    return TagListResponse(
      data: json['data'] != null
          ? List<Map<String, dynamic>>.from(json['data'])
          : [],
      nextCursor: json['nextCursor'],
    );
  }

  bool get hasMore => nextCursor != null;
}

/// Variable list response
class VariableListResponse {
  final List<Map<String, dynamic>> data;
  final String? nextCursor;

  VariableListResponse({
    required this.data,
    this.nextCursor,
  });

  factory VariableListResponse.fromJson(Map<String, dynamic> json) {
    return VariableListResponse(
      data: json['data'] != null
          ? List<Map<String, dynamic>>.from(json['data'])
          : [],
      nextCursor: json['nextCursor'],
    );
  }

  bool get hasMore => nextCursor != null;
}

/// Project list response
class ProjectListResponse {
  final List<Map<String, dynamic>> data;
  final String? nextCursor;

  ProjectListResponse({
    required this.data,
    this.nextCursor,
  });

  factory ProjectListResponse.fromJson(Map<String, dynamic> json) {
    return ProjectListResponse(
      data: json['data'] != null
          ? List<Map<String, dynamic>>.from(json['data'])
          : [],
      nextCursor: json['nextCursor'],
    );
  }

  bool get hasMore => nextCursor != null;
}

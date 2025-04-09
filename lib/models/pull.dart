// lib/models/pull.dart

class PullOptions {
  final bool? force;
  final Map<String, dynamic>? variables;

  PullOptions({
    this.force,
    this.variables,
  });

  factory PullOptions.fromJson(Map<String, dynamic> json) {
    return PullOptions(
      force: json['force'],
      variables: json['variables'] != null ? Map<String, dynamic>.from(json['variables']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (force != null) 'force': force,
      if (variables != null) 'variables': variables,
    };
  }
}

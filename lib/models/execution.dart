// lib/models/execution.dart

class Execution {
  final int id;
  final Map<String, dynamic> data;
  final bool finished;
  final String mode;
  final int? retryOf;
  final int? retrySuccessId;
  final DateTime? startedAt;
  final DateTime? stoppedAt;
  final int workflowId;
  final DateTime? waitTill;
  final Map<String, dynamic>? customData;

  Execution({
    required this.id,
    required this.data,
    required this.finished,
    required this.mode,
    this.retryOf,
    this.retrySuccessId,
    this.startedAt,
    this.stoppedAt,
    required this.workflowId,
    this.waitTill,
    this.customData,
  });

  factory Execution.fromJson(Map<String, dynamic> json) {
    return Execution(
      id: json['id'] ?? 0,
      data: Map<String, dynamic>.from(json['data'] ?? {}),
      finished: json['finished'] ?? false,
      mode: json['mode'] ?? '',
      retryOf: json['retryOf'],
      retrySuccessId: json['retrySuccessId'],
      startedAt: json['startedAt'] != null ? DateTime.parse(json['startedAt']) : null,
      stoppedAt: json['stoppedAt'] != null ? DateTime.parse(json['stoppedAt']) : null,
      workflowId: json['workflowId'] ?? 0,
      waitTill: json['waitTill'] != null ? DateTime.parse(json['waitTill']) : null,
      customData: json['customData'] != null ? Map<String, dynamic>.from(json['customData']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'data': data,
      'finished': finished,
      'mode': mode,
      if (retryOf != null) 'retryOf': retryOf,
      if (retrySuccessId != null) 'retrySuccessId': retrySuccessId,
      if (startedAt != null) 'startedAt': startedAt?.toIso8601String(),
      if (stoppedAt != null) 'stoppedAt': stoppedAt?.toIso8601String(),
      'workflowId': workflowId,
      if (waitTill != null) 'waitTill': waitTill?.toIso8601String(),
      if (customData != null) 'customData': customData,
    };
  }
}

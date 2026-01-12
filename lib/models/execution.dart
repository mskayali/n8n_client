// lib/models/execution.dart

/// Execution status enumeration
enum ExecutionStatus {
  canceled,
  crashed,
  error,
  newExecution,
  running,
  success,
  unknown,
  waiting,
}

/// Execution mode enumeration
enum ExecutionMode {
  cli,
  error,
  integrated,
  internal,
  manual,
  retry,
  trigger,
  webhook,
  evaluation,
  chat,
}

class Execution {
  final String id;
  final Map<String, dynamic>? data;
  final bool finished;
  final String mode;
  final ExecutionStatus? status;
  final String? retryOf;
  final String? retrySuccessId;
  final DateTime? startedAt;
  final DateTime? stoppedAt;
  final String workflowId;
  final DateTime? waitTill;
  final Map<String, dynamic>? customData;
  final String? workflowName;

  Execution({
    required this.id,
    this.data,
    required this.finished,
    required this.mode,
    this.status,
    this.retryOf,
    this.retrySuccessId,
    this.startedAt,
    this.stoppedAt,
    required this.workflowId,
    this.waitTill,
    this.customData,
    this.workflowName,
  });

  factory Execution.fromJson(Map<String, dynamic> json) {
    return Execution(
      id: json['id']?.toString() ?? '',
      data: json['data'] != null ? Map<String, dynamic>.from(json['data']) : null,
      finished: json['finished'] ?? false,
      mode: json['mode'] ?? '',
      status: _parseStatus(json['status']),
      retryOf: json['retryOf']?.toString(),
      retrySuccessId: json['retrySuccessId']?.toString(),
      startedAt: json['startedAt'] != null ? DateTime.parse(json['startedAt']) : null,
      stoppedAt: json['stoppedAt'] != null ? DateTime.parse(json['stoppedAt']) : null,
      workflowId: json['workflowId']?.toString() ?? '',
      waitTill: json['waitTill'] != null ? DateTime.parse(json['waitTill']) : null,
      customData: json['customData'] != null
          ? Map<String, dynamic>.from(json['customData'])
          : null,
      workflowName: json['workflowName'],
    );
  }

  static ExecutionStatus? _parseStatus(String? status) {
    if (status == null) return null;
    switch (status.toLowerCase()) {
      case 'canceled':
        return ExecutionStatus.canceled;
      case 'crashed':
        return ExecutionStatus.crashed;
      case 'error':
        return ExecutionStatus.error;
      case 'new':
        return ExecutionStatus.newExecution;
      case 'running':
        return ExecutionStatus.running;
      case 'success':
        return ExecutionStatus.success;
      case 'waiting':
        return ExecutionStatus.waiting;
      default:
        return ExecutionStatus.unknown;
    }
  }

  static String? _statusToString(ExecutionStatus? status) {
    if (status == null) return null;
    switch (status) {
      case ExecutionStatus.canceled:
        return 'canceled';
      case ExecutionStatus.crashed:
        return 'crashed';
      case ExecutionStatus.error:
        return 'error';
      case ExecutionStatus.newExecution:
        return 'new';
      case ExecutionStatus.running:
        return 'running';
      case ExecutionStatus.success:
        return 'success';
      case ExecutionStatus.waiting:
        return 'waiting';
      case ExecutionStatus.unknown:
        return 'unknown';
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      if (data != null) 'data': data,
      'finished': finished,
      'mode': mode,
      if (status != null) 'status': _statusToString(status),
      if (retryOf != null) 'retryOf': retryOf,
      if (retrySuccessId != null) 'retrySuccessId': retrySuccessId,
      if (startedAt != null) 'startedAt': startedAt?.toIso8601String(),
      if (stoppedAt != null) 'stoppedAt': stoppedAt?.toIso8601String(),
      'workflowId': workflowId,
      if (waitTill != null) 'waitTill': waitTill?.toIso8601String(),
      if (customData != null) 'customData': customData,
      if (workflowName != null) 'workflowName': workflowName,
    };
  }
}

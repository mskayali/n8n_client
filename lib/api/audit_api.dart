// lib/api/audit_api.dart

import 'package:dio/dio.dart';

class AuditApi {
  final Dio _dio;

  AuditApi(this._dio);

  /// Generate a security audit for your n8n instance
  Future<Response> generateAudit({Map<String, dynamic>? additionalOptions}) async {
    try {
      final response = await _dio.post(
        '/audit',
        data: additionalOptions != null
            ? {
                'additionalOptions': additionalOptions,
              }
            : null,
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to generate audit: ${e.message}');
    }
  }
}

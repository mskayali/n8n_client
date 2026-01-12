// lib/api/executions_api.dart

import 'package:dio/dio.dart';

class ExecutionsApi {
  final Dio _dio;

  ExecutionsApi(this._dio);

  /// Retrieve all executions
  Future<Response> getExecutions({
    bool? includeData,
    String? status,
    String? workflowId,
    String? projectId,
    int? limit,
    String? cursor,
  }) async {
    try {
      final response = await _dio.get(
        '/executions',
        queryParameters: {
          if (includeData != null) 'includeData': includeData,
          if (status != null) 'status': status,
          if (workflowId != null) 'workflowId': workflowId,
          if (projectId != null) 'projectId': projectId,
          if (limit != null) 'limit': limit,
          if (cursor != null) 'cursor': cursor,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to retrieve executions: ${e.message}');
    }
  }

  /// Retrieve a single execution by ID
  Future<Response> getExecution(String id, {bool? includeData}) async {
    try {
      final response = await _dio.get(
        '/executions/$id',
        queryParameters: {
          if (includeData != null) 'includeData': includeData,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to retrieve execution: ${e.message}');
    }
  }

  /// Delete an execution by ID
  Future<Response> deleteExecution(String id) async {
    try {
      final response = await _dio.delete(
        '/executions/$id',
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to delete execution: ${e.message}');
    }
  }

  /// Retry a failed execution
  Future<Response> retryExecution(String id, {bool? loadWorkflow}) async {
    try {
      final response = await _dio.post(
        '/executions/$id/retry',
        data: {
          if (loadWorkflow != null) 'loadWorkflow': loadWorkflow,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to retry execution: ${e.message}');
    }
  }
}

// lib/api/variables_api.dart

import 'package:dio/dio.dart';

class VariablesApi {
  final Dio _dio;

  VariablesApi(this._dio);

  /// Create a variable
  Future<Response> createVariable(Map<String, dynamic> variableData) async {
    try {
      final response = await _dio.post(
        '/variables',
        data: variableData,
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to create variable: ${e.message}');
    }
  }

  /// Retrieve all variables
  Future<Response> getVariables({
    int? limit,
    String? cursor,
    String? projectId,
    String? state,
  }) async {
    try {
      final response = await _dio.get(
        '/variables',
        queryParameters: {
          if (limit != null) 'limit': limit,
          if (cursor != null) 'cursor': cursor,
          if (projectId != null) 'projectId': projectId,
          if (state != null) 'state': state,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to retrieve variables: ${e.message}');
    }
  }

  /// Update a variable by ID
  Future<Response> updateVariable(String id, {
    required String key,
    required String value,
    String? projectId,
  }) async {
    try {
      final response = await _dio.put(
        '/variables/$id',
        data: {
          'key': key,
          'value': value,
          if (projectId != null) 'projectId': projectId,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to update variable: ${e.message}');
    }
  }

  /// Delete a variable by ID
  Future<Response> deleteVariable(String id) async {
    try {
      final response = await _dio.delete(
        '/variables/$id',
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to delete variable: ${e.message}');
    }
  }
}

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
  Future<Response> getVariables({int? limit, String? cursor}) async {
    try {
      final response = await _dio.get(
        '/variables',
        queryParameters: {
          if (limit != null) 'limit': limit,
          if (cursor != null) 'cursor': cursor,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to retrieve variables: ${e.message}');
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

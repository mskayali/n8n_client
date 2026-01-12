// lib/api/credentials_api.dart

import 'package:dio/dio.dart';

class CredentialsApi {
  final Dio _dio;

  CredentialsApi(this._dio);

  /// Create a credential
  Future<Response> createCredential(Map<String, dynamic> credentialData) async {
    try {
      final response = await _dio.post(
        '/credentials',
        data: credentialData,
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to create credential: ${e.message}');
    }
  }

  /// Delete credential by ID
  Future<Response> deleteCredential(String id) async {
    try {
      final response = await _dio.delete(
        '/credentials/$id',
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to delete credential: ${e.message}');
    }
  }

  /// Update a credential
  Future<Response> updateCredential(String id, {
    String? name,
    String? type,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.patch(
        '/credentials/$id',
        data: {
          if (name != null) 'name': name,
          if (type != null) 'type': type,
          if (data != null) 'data': data,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to update credential: ${e.message}');
    }
  }

  /// Get credential type schema by credential type name
  Future<Response> getCredentialType(String credentialTypeName) async {
    try {
      final response = await _dio.get(
        '/credentials/schema/$credentialTypeName',
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to get credential type: ${e.message}');
    }
  }

  /// Transfer a credential to another project
  Future<Response> transferCredential(String id, String destinationProjectId) async {
    try {
      final response = await _dio.put(
        '/credentials/$id/transfer',
        data: {
          'destinationProjectId': destinationProjectId,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to transfer credential: ${e.message}');
    }
  }
}

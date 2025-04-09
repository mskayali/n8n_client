// lib/api/users_api.dart

import 'package:dio/dio.dart';

class UsersApi {
  final Dio _dio;

  UsersApi(this._dio);

  /// Retrieve all users
  Future<Response> getUsers({
    int? limit,
    String? cursor,
    bool? includeRole,
    String? projectId,
  }) async {
    try {
      final response = await _dio.get(
        '/users',
        queryParameters: {
          if (limit != null) 'limit': limit,
          if (cursor != null) 'cursor': cursor,
          if (includeRole != null) 'includeRole': includeRole,
          if (projectId != null) 'projectId': projectId,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to retrieve users: ${e.message}');
    }
  }

  /// Create multiple users
  Future<Response> createUsers(List<Map<String, dynamic>> users) async {
    try {
      final response = await _dio.post(
        '/users',
        data: users,
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to create users: ${e.message}');
    }
  }

  /// Get a user by ID or email
  Future<Response> getUser(String idOrEmail, {bool? includeRole}) async {
    try {
      final response = await _dio.get(
        '/users/$idOrEmail',
        queryParameters: {
          if (includeRole != null) 'includeRole': includeRole,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to retrieve user: ${e.message}');
    }
  }

  /// Delete a user by ID or email
  Future<Response> deleteUser(String idOrEmail) async {
    try {
      final response = await _dio.delete(
        '/users/$idOrEmail',
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to delete user: ${e.message}');
    }
  }

  /// Change a user's global role
  Future<Response> changeRole(String idOrEmail, String newRoleName) async {
    try {
      final response = await _dio.patch(
        '/users/$idOrEmail/role',
        data: {
          'newRoleName': newRoleName,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to change user role: ${e.message}');
    }
  }
}

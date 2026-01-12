// lib/api/projects_api.dart

import 'package:dio/dio.dart';

class ProjectsApi {
  final Dio _dio;

  ProjectsApi(this._dio);

  /// Create a project
  Future<Response> createProject(Map<String, dynamic> projectData) async {
    try {
      final response = await _dio.post(
        '/projects',
        data: projectData,
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to create project: ${e.message}');
    }
  }

  /// Retrieve all projects
  Future<Response> getProjects({int? limit, String? cursor}) async {
    try {
      final response = await _dio.get(
        '/projects',
        queryParameters: {
          if (limit != null) 'limit': limit,
          if (cursor != null) 'cursor': cursor,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to retrieve projects: ${e.message}');
    }
  }

  /// Update a project
  Future<Response> updateProject(String projectId, Map<String, dynamic> updatedProjectData) async {
    try {
      final response = await _dio.put(
        '/projects/$projectId',
        data: updatedProjectData,
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to update project: ${e.message}');
    }
  }

  /// Delete a project
  Future<Response> deleteProject(String projectId) async {
    try {
      final response = await _dio.delete(
        '/projects/$projectId',
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to delete project: ${e.message}');
    }
  }

  /// Add users to a project
  Future<Response> addUsersToProject(String projectId, List<Map<String, dynamic>> relations) async {
    try {
      final response = await _dio.post(
        '/projects/$projectId/users',
        data: relations,
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to add users to project: ${e.message}');
    }
  }

  /// Remove a user from a project
  Future<Response> removeUserFromProject(String projectId, String userId) async {
    try {
      final response = await _dio.delete(
        '/projects/$projectId/users/$userId',
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to remove user from project: ${e.message}');
    }
  }

  /// Change a user's role in a project
  Future<Response> changeUserRoleInProject(String projectId, String userId, String role) async {
    try {
      final response = await _dio.patch(
        '/projects/$projectId/users/$userId',
        data: {
          'role': role,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to change user role in project: ${e.message}');
    }
  }
}

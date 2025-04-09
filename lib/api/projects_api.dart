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
}

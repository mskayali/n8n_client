// lib/api/workflows_api.dart

import 'package:dio/dio.dart';

class WorkflowsApi {
  final Dio _dio;

  WorkflowsApi(this._dio);

  /// Create a workflow
  Future<Response> createWorkflow(Map<String, dynamic> workflowData) async {
    try {
      final response = await _dio.post(
        '/workflows',
        data: workflowData,
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to create workflow: ${e.message}');
    }
  }

  /// Retrieve all workflows
  Future<Response> getWorkflows({
    bool? active,
    String? tags,
    String? name,
    String? projectId,
    bool? excludePinnedData,
    int? limit,
    String? cursor,
  }) async {
    try {
      final response = await _dio.get(
        '/workflows',
        queryParameters: {
          if (active != null) 'active': active,
          if (tags != null) 'tags': tags,
          if (name != null) 'name': name,
          if (projectId != null) 'projectId': projectId,
          if (excludePinnedData != null) 'excludePinnedData': excludePinnedData,
          if (limit != null) 'limit': limit,
          if (cursor != null) 'cursor': cursor,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to retrieve workflows: ${e.message}');
    }
  }

  /// Retrieve a workflow by ID
  Future<Response> getWorkflow(String id, {bool? excludePinnedData}) async {
    try {
      final response = await _dio.get(
        '/workflows/$id',
        queryParameters: {
          if (excludePinnedData != null) 'excludePinnedData': excludePinnedData,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to retrieve workflow: ${e.message}');
    }
  }

  /// Update a workflow
  Future<Response> updateWorkflow(String id, Map<String, dynamic> updatedWorkflowData) async {
    try {
      final response = await _dio.put(
        '/workflows/$id',
        data: updatedWorkflowData,
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to update workflow: ${e.message}');
    }
  }

  /// Delete a workflow
  Future<Response> deleteWorkflow(String id) async {
    try {
      final response = await _dio.delete(
        '/workflows/$id',
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to delete workflow: ${e.message}');
    }
  }

  /// Activate a workflow
  Future<Response> activateWorkflow(String id) async {
    try {
      final response = await _dio.post(
        '/workflows/$id/activate',
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to activate workflow: ${e.message}');
    }
  }

  /// Deactivate a workflow
  Future<Response> deactivateWorkflow(String id) async {
    try {
      final response = await _dio.post(
        '/workflows/$id/deactivate',
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to deactivate workflow: ${e.message}');
    }
  }

  /// Transfer a workflow to another project
  Future<Response> transferWorkflow(String id, String destinationProjectId) async {
    try {
      final response = await _dio.put(
        '/workflows/$id/transfer',
        data: {
          'destinationProjectId': destinationProjectId,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to transfer workflow: ${e.message}');
    }
  }

  /// Get workflow tags
  Future<Response> getWorkflowTags(String id) async {
    try {
      final response = await _dio.get(
        '/workflows/$id/tags',
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to get workflow tags: ${e.message}');
    }
  }

  /// Update workflow tags
  Future<Response> updateWorkflowTags(String id, List<Map<String, String>> tags) async {
    try {
      final response = await _dio.put(
        '/workflows/$id/tags',
        data: tags,
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to update workflow tags: ${e.message}');
    }
  }
}

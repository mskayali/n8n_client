// lib/api/tags_api.dart

import 'package:dio/dio.dart';

class TagsApi {
  final Dio _dio;

  TagsApi(this._dio);

  /// Create a tag
  Future<Response> createTag(Map<String, dynamic> tagData) async {
    try {
      final response = await _dio.post(
        '/tags',
        data: tagData,
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to create tag: ${e.message}');
    }
  }

  /// Retrieve all tags
  Future<Response> getTags({int? limit, String? cursor}) async {
    try {
      final response = await _dio.get(
        '/tags',
        queryParameters: {
          if (limit != null) 'limit': limit,
          if (cursor != null) 'cursor': cursor,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to retrieve tags: ${e.message}');
    }
  }

  /// Retrieve a tag by ID
  Future<Response> getTag(String id) async {
    try {
      final response = await _dio.get(
        '/tags/$id',
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to retrieve tag: ${e.message}');
    }
  }

  /// Update a tag
  Future<Response> updateTag(String id, Map<String, dynamic> updatedTagData) async {
    try {
      final response = await _dio.put(
        '/tags/$id',
        data: updatedTagData,
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to update tag: ${e.message}');
    }
  }

  /// Delete a tag by ID
  Future<Response> deleteTag(String id) async {
    try {
      final response = await _dio.delete(
        '/tags/$id',
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to delete tag: ${e.message}');
    }
  }
}

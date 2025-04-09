// lib/api/source_control_api.dart

import 'package:dio/dio.dart';

class SourceControlApi {
  final Dio _dio;

  SourceControlApi(this._dio);

  /// Pull changes from the remote repository
  Future<Response> pullChanges({Map<String, dynamic>? pullOptions}) async {
    try {
      final response = await _dio.post(
        '/source-control/pull',
        data: pullOptions,
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to pull changes: ${e.message}');
    }
  }
}

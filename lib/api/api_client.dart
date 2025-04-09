// lib/api/api_client.dart

import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient({
    required String baseUrl,
    required String apiKey,
  }) : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: {
              'X-N8N-API-KEY': apiKey,
              'Content-Type': 'application/json',
            },
            responseType: ResponseType.json,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 30),
          ),
        ) {
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }
}

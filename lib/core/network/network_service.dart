import 'package:dio/dio.dart';

import 'exceptions.dart';

class NetworkService {
  final Dio _dio;

  NetworkService(this._dio) {
    _dio.options.baseUrl = 'https://api.themoviedb.org/3/';
    _dio.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NWJlOWFmZjJkODYwMjI5YjM2YWVkNDU2MjZkMzVmOCIsIm5iZiI6MTczNDUyMjkwMy44OTY5OTk4LCJzdWIiOiI2NzYyYjgxN2NjMmI2ZDlmY2NhYWZiNDciLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.CXhItTfPXK7QwOEyes1SomFQb-RqEtpqLde7wNqkVF4',
    };
  }

  Future<Response> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response;
    } on DioException catch (e) {
      throw ServerException(e.message.toString());
    }
  }

  Future<Response> post(String endpoint, dynamic data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw ServerException(e.message.toString());
    }
  }
}

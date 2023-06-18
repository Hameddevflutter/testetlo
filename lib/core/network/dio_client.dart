import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';

class ApiClient {
  ApiClient() {
    _dio = Dio();
    _dio.interceptors.add(
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      ),
    );
    _dio.options.headers = {
      'Authorization': 'hi',
    };
  }
  late Dio _dio;
  Dio getDio() => _dio;
}

// ignore_for_file: avoid_classes_with_only_static_members, avoid_dynamic_calls, avoid_catches_without_on_clauses, no_default_cases
import 'package:dio/dio.dart';

import '../services/logger_service.dart';
import '../values/constants.dart';

class NetworkExceptions {
  static String getErrorMessage(final error) {
    var errorMessage = Constants.defaultError;
    if (error is DioException) {
      try {
        switch (error.type) {
          case DioExceptionType.cancel:
            LoggerService.logger.e("Request Cancelled");
            break;
          case DioExceptionType.connectionTimeout:
            errorMessage = Constants.noInternet;
            LoggerService.logger.e("Connection request timeout");
            break;
          case DioExceptionType.unknown:
            errorMessage = Constants.noInternet;
            LoggerService.logger.e(Constants.noInternet);
            break;
          case DioExceptionType.receiveTimeout:
            LoggerService.logger
                .e("Send timeout in connection with API server");
            break;
          case DioExceptionType.sendTimeout:
            LoggerService.logger
                .e("Send timeout in connection with API server");
            break;
          case DioExceptionType.badCertificate:
            LoggerService.logger.e("Bad certificate");
            break;
          default:
            LoggerService.logger.e("Unexpected DioErrorType: ${error.type}");
        }
      } on FormatException catch (_) {
        LoggerService.logger.e("Bad Request");
      } catch (_) {
        LoggerService.logger.e("Unexpected error occurred");
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        LoggerService.logger.e(error.toString());
      } else {
        LoggerService.logger.e(error.toString());
      }
    }

    return errorMessage;
  }
}

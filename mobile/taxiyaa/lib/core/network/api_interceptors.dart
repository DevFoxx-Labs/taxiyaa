import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/app_constants.dart';
import 'api_exceptions.dart';

/// Interceptor to automatically attach JWT / Bearer tokens from SecureStorage
class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage secureStorage;

  AuthInterceptor({required this.secureStorage});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await secureStorage.read(key: AppConstants.storageTokenKey);
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (e) {
      debugPrint('[AuthInterceptor] Failed to retrieve auth token: $e');
    }
    return handler.next(options);
  }
}

/// Lightweight debug logger that avoids printing sensitive authorization credentials
class ApiLoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('--> ${options.method} ${options.uri}');
      if (options.data != null) {
        debugPrint('Body: ${options.data}');
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('<-- ${response.statusCode} ${response.requestOptions.uri}');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('<-- ERROR ${err.response?.statusCode} ${err.requestOptions.uri}: ${err.message}');
    }
    handler.next(err);
  }
}

/// Normalizes Dio errors into domain-specific [ApiException] classes
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final apiException = _mapDioException(err);
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: apiException,
        message: apiException.message,
      ),
    );
  }

  ApiException _mapDioException(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const NetworkException();

      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        final data = err.response?.data;
        String message = 'An unexpected server error occurred.';

        if (data is Map && data['message'] != null) {
          message = data['message'].toString();
        } else if (data is Map && data['error'] != null) {
          message = data['error'].toString();
        }

        if (statusCode == 401) {
          return UnauthorizedException(message);
        } else if (statusCode == 403) {
          return ForbiddenException(message);
        } else if (statusCode == 404) {
          return NotFoundException(message);
        } else if (statusCode != null && statusCode >= 500) {
          return ServerException(message);
        }
        return ApiException(message, statusCode: statusCode, details: data);

      case DioExceptionType.cancel:
        return const ApiException('Request was cancelled.');

      case DioExceptionType.badCertificate:
        return const ApiException('Security certificate validation failed.');

      case DioExceptionType.unknown:
      default:
        return ApiException(err.message ?? 'Unknown network error occurred.');
    }
  }
}


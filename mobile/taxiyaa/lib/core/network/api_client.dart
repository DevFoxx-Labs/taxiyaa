import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/app_constants.dart';
import 'api_exceptions.dart';
import 'api_interceptors.dart';

/// Centralized API Client with Dio, HTTP Caching, ETag support, and Auth
class ApiClient {
  late final Dio _dio;
  final CacheOptions cacheOptions;
  final FlutterSecureStorage secureStorage;

  ApiClient({
    required this.cacheOptions,
    required this.secureStorage,
    String? baseUrl,
    Dio? customDio,
  }) {
    _dio = customDio ??
        Dio(
          BaseOptions(
            baseUrl: baseUrl ?? AppConstants.defaultBaseUrl,
            connectTimeout: AppConstants.connectTimeout,
            receiveTimeout: AppConstants.receiveTimeout,
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
          ),
        );

    _dio.interceptors.addAll([
      AuthInterceptor(secureStorage: secureStorage),
      DioCacheInterceptor(options: cacheOptions),
      ApiLoggingInterceptor(),
      ErrorInterceptor(),
    ]);
  }

  Dio get dio => _dio;

  /// Performs a cached GET request supporting HTTP ETags and 304 responses
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    CachePolicy? cachePolicy,
    Duration? maxStale,
  }) async {
    try {
      final reqOptions = options ?? Options();
      if (cachePolicy != null || maxStale != null) {
        final customCacheOptions = cacheOptions.copyWith(
          policy: cachePolicy ?? cacheOptions.policy,
          maxStale: maxStale ?? cacheOptions.maxStale,
        );
        reqOptions.extra = {
          ...?reqOptions.extra,
          ...customCacheOptions.toExtra(),
        };
      }

      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: reqOptions,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error as ApiException;
      }
      throw ApiException(e.message ?? 'Failed to execute GET request');
    }
  }

  /// Performs a POST request (never cached)
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error as ApiException;
      }
      throw ApiException(e.message ?? 'Failed to execute POST request');
    }
  }

  /// Performs a PUT request
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error as ApiException;
      }
      throw ApiException(e.message ?? 'Failed to execute PUT request');
    }
  }

  /// Performs a DELETE request
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error as ApiException;
      }
      throw ApiException(e.message ?? 'Failed to execute DELETE request');
    }
  }
}

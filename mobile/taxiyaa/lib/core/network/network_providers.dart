import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../cache/api_cache_service.dart';
import '../constants/app_constants.dart';
import 'api_client.dart';

/// Secure storage provider for auth tokens
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage(
    aOptions: AndroidOptions(resetOnError: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );
});

/// MemCacheStore provider for HTTP response and ETag caching
final dioCacheStoreProvider = Provider<CacheStore>((ref) {
  final store = MemCacheStore(maxSize: 10485760, maxEntrySize: 1048576); // 10MB memory cache
  ref.onDispose(() {
    store.close();
  });
  return store;
});

/// CacheOptions configured for Taxiyaa API
final cacheOptionsProvider = Provider<CacheOptions>((ref) {
  final store = ref.watch(dioCacheStoreProvider);
  return CacheOptions(
    store: store,
    policy: CachePolicy.request, // Respects cache-control & ETags
    hitCacheOnNetworkFailure: true, // Use stale cache on network dropouts
    maxStale: AppConstants.defaultApiCacheDuration,
    priority: CachePriority.normal,
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    allowPostMethod: false,
  );
});

/// Central ApiClient provider
final apiClientProvider = Provider<ApiClient>((ref) {
  final cacheOptions = ref.watch(cacheOptionsProvider);
  final secureStorage = ref.watch(secureStorageProvider);

  return ApiClient(
    cacheOptions: cacheOptions,
    secureStorage: secureStorage,
    baseUrl: AppConstants.defaultBaseUrl,
  );
});

/// Persistent disk cache service provider (initialized on app start or lazily)
final apiCacheServiceProvider = Provider<ApiCacheService>((ref) {
  // Can be overridden in main with SharedPreferences instance
  return ApiCacheService();
});

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import '../../../core/cache/api_cache_service.dart';
import '../../../core/network/api_client.dart';
import '../models/route_item.dart';
import '../models/service_item.dart';
import 'canonical_catalog_data.dart';

abstract class CatalogRepository {
  Future<List<ServiceItem>> fetchServices({bool forceRefresh = false});
  Future<List<RouteItem>> fetchRoutes({bool forceRefresh = false});
}

class TaxiyaaCatalogRepository implements CatalogRepository {
  final ApiClient apiClient;
  final ApiCacheService cacheService;

  TaxiyaaCatalogRepository({
    required this.apiClient,
    required this.cacheService,
  });

  static const String servicesCacheKey = 'catalog_services';
  static const String routesCacheKey = 'catalog_routes';

  @override
  Future<List<ServiceItem>> fetchServices({bool forceRefresh = false}) async {
    // If not forcing refresh, check local persistent disk cache first (0ms load)
    if (!forceRefresh) {
      final cached = cacheService.get(servicesCacheKey);
      if (cached is List) {
        // Silently revalidate in background
        _backgroundFetchServices();
        return cached
            .map((e) => ServiceItem.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList();
      }
    }

    try {
      final response = await apiClient.get<List<dynamic>>(
        '/services',
        cachePolicy: forceRefresh ? CachePolicy.refreshForceCache : CachePolicy.request,
      );

      if (response.data != null && response.data!.isNotEmpty) {
        final list = response.data!
            .map((e) => ServiceItem.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList();
        await cacheService.put(servicesCacheKey, response.data!);
        return list;
      }
    } catch (e) {
      debugPrint('[CatalogRepository] API error fetching services: $e. Using canonical catalog.');
    }

    // Default to canonical catalog and persist to disk cache
    final canonical = CanonicalCatalogData.services;
    await cacheService.put(servicesCacheKey, canonical.map((s) => s.toJson()).toList());
    return canonical;
  }

  void _backgroundFetchServices() {
    apiClient
        .get<List<dynamic>>('/services', cachePolicy: CachePolicy.refreshForceCache)
        .then((response) {
      if (response.data != null && response.data!.isNotEmpty) {
        cacheService.put(servicesCacheKey, response.data!);
      }
    }).catchError((err) {
      debugPrint('[CatalogRepository] Background revalidation failed: $err');
    });
  }

  @override
  Future<List<RouteItem>> fetchRoutes({bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final cached = cacheService.get(routesCacheKey);
      if (cached is List) {
        _backgroundFetchRoutes();
        return cached
            .map((e) => RouteItem.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList();
      }
    }

    try {
      final response = await apiClient.get<List<dynamic>>(
        '/routes',
        cachePolicy: forceRefresh ? CachePolicy.refreshForceCache : CachePolicy.request,
      );

      if (response.data != null && response.data!.isNotEmpty) {
        final list = response.data!
            .map((e) => RouteItem.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList();
        await cacheService.put(routesCacheKey, response.data!);
        return list;
      }
    } catch (e) {
      debugPrint('[CatalogRepository] API error fetching routes: $e. Using canonical routes.');
    }

    final canonical = CanonicalCatalogData.routes;
    await cacheService.put(routesCacheKey, canonical.map((r) => r.toJson()).toList());
    return canonical;
  }

  void _backgroundFetchRoutes() {
    apiClient
        .get<List<dynamic>>('/routes', cachePolicy: CachePolicy.refreshForceCache)
        .then((response) {
      if (response.data != null && response.data!.isNotEmpty) {
        cacheService.put(routesCacheKey, response.data!);
      }
    }).catchError((err) {
      debugPrint('[CatalogRepository] Background routes revalidation failed: $err');
    });
  }
}


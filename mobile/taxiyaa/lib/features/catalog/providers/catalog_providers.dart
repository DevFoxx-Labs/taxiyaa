import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/cache/riverpod_cache_extensions.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/network/network_providers.dart';
import '../data/catalog_repository.dart';
import '../models/route_item.dart';
import '../models/service_item.dart';

/// Provider for the catalog repository
final catalogRepositoryProvider = Provider<CatalogRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final cacheService = ref.watch(apiCacheServiceProvider);
  return TaxiyaaCatalogRepository(
    apiClient: apiClient,
    cacheService: cacheService,
  );
});

/// Services Provider with Riverpod In-Memory SWR Caching
/// (PERFORMANCE_AND_CACHING_GUIDE.md Section 2.A)
final servicesProvider = FutureProvider.autoDispose<List<ServiceItem>>((ref) async {
  // Retain cached API data in memory for 5 minutes after leaving screen
  ref.cacheFor(AppConstants.defaultApiCacheDuration);

  final repository = ref.watch(catalogRepositoryProvider);
  return repository.fetchServices();
});

/// Routes Provider with Riverpod In-Memory SWR Caching
final routesProvider = FutureProvider.autoDispose<List<RouteItem>>((ref) async {
  ref.cacheFor(AppConstants.defaultApiCacheDuration);

  final repository = ref.watch(catalogRepositoryProvider);
  return repository.fetchRoutes();
});

/// Active selected service filter notifier
class SelectedServiceNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void select(String? id) => state = id;
}

final selectedServiceIdProvider =
    NotifierProvider<SelectedServiceNotifier, String?>(SelectedServiceNotifier.new);

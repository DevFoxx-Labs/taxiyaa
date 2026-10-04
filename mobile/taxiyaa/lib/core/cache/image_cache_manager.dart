import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// Central Image Cache Manager for Taxiyaa (PERFORMANCE_AND_CACHING_GUIDE.md Section 1)
/// Implements dual-tier disk caching with 14-day retention and LRU eviction.
class TaxiyaaImageCacheManager {
  TaxiyaaImageCacheManager._();

  static const String key = 'taxiyaa_image_cache';

  static final CacheManager instance = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(days: 14),
      maxNrOfCacheObjects: 250,
      repo: JsonCacheInfoRepository(databaseName: key),
      fileService: HttpFileService(),
    ),
  );

  /// Empty entire image cache from disk
  static Future<void> clearCache() async {
    await instance.emptyCache();
  }
}


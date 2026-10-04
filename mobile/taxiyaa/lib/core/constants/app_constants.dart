class AppConstants {
  AppConstants._();

  static const String appName = 'Taxiyaa';
  static const String appTagline = 'Executive Cab & Outstation Travel';

  // Support & Booking Dispatch
  static const String supportPhone = '+916392767985';
  static const String supportPhoneDisplay = '+91 6392767985';
  static const String whatsappUrl = 'https://wa.me/916392767985';

  // Network & Cache Config
  static const String defaultBaseUrl = 'https://astrogaon.com/api/v1';
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Duration defaultApiCacheDuration = Duration(minutes: 5);
  static const Duration imageCacheStalePeriod = Duration(days: 30);
  static const int imageCacheMaxObjects = 250;

  // Image Memory Downscaling Defaults (PERFORMANCE_AND_CACHING_GUIDE.md Section 1.B)
  static const int defaultMemCacheWidth = 400;
  static const int defaultMemCacheHeight = 300;
  static const int avatarMemCacheWidth = 150;
  static const int bannerMemCacheWidth = 800;

  // Storage Keys
  static const String storageTokenKey = 'taxiyaa_auth_token';
  static const String storageRefreshTokenKey = 'taxiyaa_refresh_token';
  static const String apiCachePrefix = 'taxiyaa_api_cache_';
}


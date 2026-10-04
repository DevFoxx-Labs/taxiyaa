import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

/// Service managing persistent disk cache for API payloads
/// Implements instant 0ms offline display and background revalidation
/// (PERFORMANCE_AND_CACHING_GUIDE.md Section 2.B)
class ApiCacheService {
  final SharedPreferences? _prefs;

  ApiCacheService([this._prefs]);

  static Future<ApiCacheService> create() async {
    final prefs = await SharedPreferences.getInstance();
    return ApiCacheService(prefs);
  }

  String _formatKey(String key) => '${AppConstants.apiCachePrefix}$key';
  String _formatTimeKey(String key) => '${AppConstants.apiCachePrefix}${key}_timestamp';

  /// Saves data to local disk cache with timestamp
  Future<void> put(String key, dynamic data) async {
    if (_prefs == null) return;
    try {
      final jsonString = jsonEncode(data);
      await _prefs.setString(_formatKey(key), jsonString);
      await _prefs.setInt(
        _formatTimeKey(key),
        DateTime.now().millisecondsSinceEpoch,
      );
    } catch (e) {
      debugPrint('[ApiCacheService] Error saving cache for key "$key": $e');
    }
  }

  /// Retrieves cached payload from disk
  dynamic get(String key, {Duration? maxAge}) {
    if (_prefs == null) return null;
    try {
      final raw = _prefs.getString(_formatKey(key));
      if (raw == null) return null;

      if (maxAge != null) {
        final timestamp = _prefs.getInt(_formatTimeKey(key));
        if (timestamp != null) {
          final cacheTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
          if (DateTime.now().difference(cacheTime) > maxAge) {
            // Expired
            return null;
          }
        }
      }

      return jsonDecode(raw);
    } catch (e) {
      debugPrint('[ApiCacheService] Error reading cache for key "$key": $e');
      return null;
    }
  }

  /// Returns cached JSON payload immediately if present on disk,
  /// while triggering a background fetch to silently update disk cache
  Future<T> getCachedOrFetch<T>({
    required String key,
    required Future<T> Function() fetcher,
    required T Function(dynamic json) fromJson,
    required dynamic Function(T data) toJson,
    Duration? maxAge,
    void Function(T fresh)? onBackgroundUpdate,
  }) async {
    final cachedData = get(key, maxAge: maxAge);

    if (cachedData != null) {
      // 1. Instant 0ms return from disk
      final parsedCached = fromJson(cachedData);

      // 2. Background revalidation
      fetcher().then((fresh) async {
        await put(key, toJson(fresh));
        onBackgroundUpdate?.call(fresh);
      }).catchError((err) {
        debugPrint('[ApiCacheService] Silent background fetch failed for "$key": $err');
      });

      return parsedCached;
    }

    // 3. No cache available: fetch directly and save
    final fresh = await fetcher();
    await put(key, toJson(fresh));
    return fresh;
  }

  /// Clears specific cache entry
  Future<void> remove(String key) async {
    if (_prefs == null) return;
    await _prefs.remove(_formatKey(key));
    await _prefs.remove(_formatTimeKey(key));
  }

  /// Clears all API cache entries
  Future<void> clearAll() async {
    if (_prefs == null) return;
    final keys = _prefs.getKeys().where((k) => k.startsWith(AppConstants.apiCachePrefix));
    for (final k in keys) {
      await _prefs.remove(k);
    }
  }
}


import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/app_constants.dart';

/// Extension on Riverpod [Ref] implementing Stale-While-Revalidate (SWR) in-memory caching.
/// Retains provider state in active memory for a given duration after subscribers leave.
/// (PERFORMANCE_AND_CACHING_GUIDE.md Section 2.A)
extension RiverpodCacheExtension on Ref {
  /// Retains the provider value in memory for [duration] after all listeners are removed.
  /// Once the duration expires, the provider link closes and allows garbage collection / re-fetch.
  void cacheFor([Duration duration = AppConstants.defaultApiCacheDuration]) {
    final link = keepAlive();
    final timer = Timer(duration, () {
      link.close();
    });
    onDispose(() {
      timer.cancel();
    });
  }
}


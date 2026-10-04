import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/cache/api_cache_service.dart';
import 'core/constants/app_constants.dart';
import 'core/network/network_providers.dart';
import 'core/theme/app_theme.dart';
import 'features/customer/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences for fast persistent API disk caching
  final sharedPreferences = await SharedPreferences.getInstance();
  final cacheService = ApiCacheService(sharedPreferences);

  runApp(
    ProviderScope(
      overrides: [
        apiCacheServiceProvider.overrideWithValue(cacheService),
      ],
      child: const TaxiyaaApp(),
    ),
  );
}

class TaxiyaaApp extends StatelessWidget {
  const TaxiyaaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}


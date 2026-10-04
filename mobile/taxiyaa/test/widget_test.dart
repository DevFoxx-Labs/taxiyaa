import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxiyaa/core/cache/api_cache_service.dart';
import 'package:taxiyaa/core/constants/app_constants.dart';
import 'package:taxiyaa/core/network/network_providers.dart';
import 'package:taxiyaa/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('TaxiyaaApp smoke and provider test', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final cacheService = ApiCacheService(prefs);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          apiCacheServiceProvider.overrideWithValue(cacheService),
        ],
        child: const TaxiyaaApp(),
      ),
    );

    // Pump frames to render UI without waiting indefinitely for continuous shimmer repeat loops
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    // Verify app title and performance banner are rendered
    expect(find.text(AppConstants.appName), findsOneWidget);
    expect(find.text('PERFORMANCE ACTIVE'), findsOneWidget);
  });
}

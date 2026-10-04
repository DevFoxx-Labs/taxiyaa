import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxiyaa/core/cache/api_cache_service.dart';
import 'package:taxiyaa/core/data/mock_seed_data.dart';
import 'package:taxiyaa/core/models/app_role.dart';
import 'package:taxiyaa/core/models/booking_model.dart';
import 'package:taxiyaa/core/network/network_providers.dart';
import 'package:taxiyaa/core/state/taxiyaa_state.dart';
import 'package:taxiyaa/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Taxiyaa App & Riverpod State Verification', () {
    testWidgets('TaxiyaaApp renders splash screen correctly on startup', (WidgetTester tester) async {
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

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 600));

      // Verify the splash screen branding tagline is rendered
      expect(find.text('Your Journey\nOur Priority'), findsOneWidget);

      // Advance past the 2200ms splash timer so no timers are left pending
      await tester.pump(const Duration(milliseconds: 2000));
      await tester.pumpAndSettle();
    });

    test('Riverpod state providers initialize with valid domain models', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Verify default role
      expect(container.read(activeRoleProvider), AppRole.customer);

      // Switch roles
      container.read(activeRoleProvider.notifier).state = AppRole.driver;
      expect(container.read(activeRoleProvider), AppRole.driver);

      container.read(activeRoleProvider.notifier).state = AppRole.vendor;
      expect(container.read(activeRoleProvider), AppRole.vendor);

      container.read(activeRoleProvider.notifier).state = AppRole.admin;
      expect(container.read(activeRoleProvider), AppRole.admin);

      // Verify bookings state
      final bookings = container.read(bookingsProvider);
      expect(bookings.isNotEmpty, true);
      expect(bookings.first.id, 'TX-20261012-000125');

      // Verify drivers and vendors
      final drivers = container.read(driversProvider);
      final vendors = container.read(vendorsProvider);
      expect(drivers.isNotEmpty, true);
      expect(vendors.isNotEmpty, true);
    });

    test('BookingsNotifier updates booking status correctly across workflow', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      const targetId = 'TX-20261012-000125';
      
      // Accept booking by vendor
      container.read(bookingsProvider.notifier).acceptBooking(targetId, MockSeedData.defaultVendor);
      var booking = container.read(bookingsProvider).firstWhere((b) => b.id == targetId);
      expect(booking.status, BookingStatus.vendorAssigned);

      // Assign driver and vehicle
      container.read(bookingsProvider.notifier).assignDriverAndVehicle(
            bookingId: targetId,
            driver: MockSeedData.drivers.first,
            vehicle: MockSeedData.vehicles.first,
          );
      booking = container.read(bookingsProvider).firstWhere((b) => b.id == targetId);
      expect(booking.status, BookingStatus.driverAssigned);
      expect(booking.driver?.name, isNotEmpty);

      // Settle booking
      container.read(bookingsProvider.notifier).settleBooking(targetId);
      booking = container.read(bookingsProvider).firstWhere((b) => b.id == targetId);
      expect(booking.status, BookingStatus.settled);
      expect(booking.paymentStatus, 'Settled to Bank');
    });

    test('ApiCacheService performs get, put, and invalidate operations accurately', () async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      final cacheService = ApiCacheService(prefs);

      // Put cache
      final testData = {'status': 'success', 'rate': 12.5};
      await cacheService.put('test_route_key', testData);

      // Get cache
      final retrieved = cacheService.get('test_route_key') as Map<String, dynamic>?;
      expect(retrieved, isNotNull);
      expect(retrieved?['status'], 'success');
      expect(retrieved?['rate'], 12.5);

      // Invalidate cache
      await cacheService.remove('test_route_key');
      expect(cacheService.get('test_route_key'), isNull);
    });
  });
}

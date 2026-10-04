import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/booking_model.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_card.dart';
import 'driver_trip_details_screen.dart';

/// Driver Screen 02 — Dashboard (Section 23)
class DriverDashboardScreen extends ConsumerWidget {
  final VoidCallback onOpenRoleSwitcher;

  const DriverDashboardScreen({super.key, required this.onOpenRoleSwitcher});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final driver = ref.watch(activeDriverProvider);
    final bookings = ref.watch(bookingsProvider);

    final activeTrip = bookings.firstWhere(
      (b) => b.status != BookingStatus.tripCompleted && b.status != BookingStatus.cancelled,
      orElse: () => bookings.first,
    );

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${driver.name.split(' ').first}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.black,
              ),
            ),
            const Text(
              'Good Morning!',
              style: TextStyle(fontSize: 12, color: AppColors.textGray),
            ),
          ],
        ),
        actions: [
          // Online Toggle (Section 23)
          GestureDetector(
            onTap: () {
              ref.read(activeDriverProvider.notifier).toggleOnline();
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: driver.isOnline ? AppColors.success.withValues(alpha: 0.15) : AppColors.lightGray,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: driver.isOnline ? AppColors.success : AppColors.border,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: driver.isOnline ? AppColors.success : AppColors.textGray,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    driver.isOnline ? 'Online' : 'Offline',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: driver.isOnline ? AppColors.success : AppColors.textGray,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            tooltip: 'Switch Portal',
            icon: const Icon(Icons.swap_horiz, color: AppColors.black),
            onPressed: onOpenRoleSwitcher,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Row (Section 23)
            Row(
              children: [
                _statCard('Today\'s Trips', '₹5,200', Icons.currency_rupee),
                const SizedBox(width: 10),
                _statCard('Driver Rating', '${driver.rating} ★', Icons.star),
                const SizedBox(width: 10),
                _statCard('Total Trips', '${driver.totalTrips}', Icons.directions_car),
              ],
            ),

            const SizedBox(height: 24),

            // Today's Trips / Next Assigned Trip (Section 23)
            const Text(
              "Today's Assigned Trip",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 12),

            TaxiyaaCard(
              padding: const EdgeInsets.all(16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DriverTripDetailsScreen(booking: activeTrip),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        activeTrip.id,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textGray,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'Upcoming',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: AppColors.darkYellow,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${activeTrip.pickupLocation.split(',').first} → ${activeTrip.dropLocation.split(',').first}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${activeTrip.pickupDate} • ${activeTrip.pickupTime}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textGray,
                    ),
                  ),
                  const Divider(height: 24, color: AppColors.border),
                  Row(
                    children: [
                      const Icon(Icons.directions_car, size: 18, color: AppColors.darkGray),
                      const SizedBox(width: 8),
                      Text(
                        '${activeTrip.vehicle.name} • ${driver.vehicleNumber}',
                        style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.textGray),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String label, String value, IconData icon) {
    return Expanded(
      child: TaxiyaaCard(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        child: Column(
          children: [
            Icon(icon, color: AppColors.darkYellow, size: 20),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textGray,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


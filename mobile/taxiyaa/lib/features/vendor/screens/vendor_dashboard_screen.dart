import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/booking_model.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_button.dart';
import '../../../core/widgets/taxiyaa_card.dart';
import '../../../core/widgets/status_badge.dart';
import 'vendor_assign_screen.dart';

/// Screen 01 - Vendor Dashboard (Section 33)
class VendorDashboardScreen extends ConsumerWidget {
  final VoidCallback onOpenRoleSwitcher;

  const VendorDashboardScreen({
    super.key,
    required this.onOpenRoleSwitcher,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendor = ref.watch(activeVendorProvider);
    final bookings = ref.watch(bookingsProvider);

    // Bookings awaiting vendor acceptance or assignment
    final newRequests = bookings
        .where((b) =>
            b.status == BookingStatus.assignmentPending ||
            b.status == BookingStatus.quoteReady)
        .toList();

    final activeTrips = bookings
        .where((b) =>
            b.status == BookingStatus.vendorAssigned ||
            b.status == BookingStatus.driverAssigned ||
            b.status == BookingStatus.driverArriving ||
            b.status == BookingStatus.tripStarted)
        .toList();

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  vendor.companyName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    vendor.tier,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'ID: ${vendor.id} • ★ ${vendor.rating}',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textGray,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.swap_horiz, color: AppColors.black),
            tooltip: 'Switch Portal',
            onPressed: onOpenRoleSwitcher,
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        color: AppColors.black,
        backgroundColor: AppColors.primary,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top KPI Metrics Grid (Section 33)
              Row(
                children: [
                  Expanded(
                    child: _buildMetricCard(
                      title: 'Total Fleet',
                      value: '${vendor.activeVehicles}',
                      subtitle: 'Vehicles',
                      icon: Icons.directions_car,
                      color: AppColors.info,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildMetricCard(
                      title: 'Active Drivers',
                      value: '${vendor.activeDrivers}',
                      subtitle: 'On Duty',
                      icon: Icons.badge,
                      color: AppColors.success,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12, height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildMetricCard(
                      title: 'Total Bookings',
                      value: '${bookings.length}',
                      subtitle: 'Platform Trips',
                      icon: Icons.local_taxi,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildMetricCard(
                      title: 'Pending Payout',
                      value: '₹${vendor.pendingEarnings.toStringAsFixed(0)}',
                      subtitle: 'Next: Monday',
                      icon: Icons.currency_rupee,
                      color: AppColors.warning,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Section: New Booking Requests (Urgent dispatch)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'New Booking Requests',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      if (newRequests.isNotEmpty) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.error,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${newRequests.length}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),

              if (newRequests.isEmpty)
                TaxiyaaCard(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: AppColors.success,
                            size: 40,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'All booking requests fulfilled!',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'New customer trips will appear here in real-time.',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              else
                ...newRequests.map((booking) => _buildRequestCard(context, ref, booking)),

              const SizedBox(height: 24),

              // Section: Active & Dispatched Trips
              const Text(
                'Active & Assigned Trips',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 12),

              if (activeTrips.isEmpty)
                const TaxiyaaCard(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        'No ongoing trips currently.',
                        style: TextStyle(color: AppColors.textGray),
                      ),
                    ),
                  ),
                )
              else
                ...activeTrips.take(3).map((booking) => _buildActiveTripCard(context, ref, booking)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return TaxiyaaCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textGray,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(icon, size: 20, color: color),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRequestCard(
    BuildContext context,
    WidgetRef ref,
    BookingModel booking,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: TaxiyaaCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  booking.id,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textGray,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.lightYellow,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    booking.tripType,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 16),
            Row(
              children: [
                const Icon(Icons.circle, size: 10, color: AppColors.success),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    booking.pickupLocation,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on, size: 12, color: AppColors.error),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    booking.dropLocation,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 13, color: AppColors.textGray),
                const SizedBox(width: 6),
                Text(
                  '${booking.pickupDate} • ${booking.pickupTime}',
                  style: const TextStyle(fontSize: 12, color: AppColors.textGray),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Requested Category',
                        style: TextStyle(fontSize: 11, color: AppColors.textGray),
                      ),
                      Text(
                        booking.vehicle.name,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Vendor Payout',
                        style: TextStyle(fontSize: 11, color: AppColors.textGray),
                      ),
                      Text(
                        '₹${booking.vendorPayout.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.success,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TaxiyaaOutlinedButton(
                    text: 'Reject',
                    onPressed: () {
                      ref.read(bookingsProvider.notifier).rejectBooking(booking.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Booking ${booking.id} declined')),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TaxiyaaButton(
                    text: 'Accept Trip',
                    onPressed: () {
                      final vendor = ref.read(activeVendorProvider);
                      ref.read(bookingsProvider.notifier).acceptBooking(booking.id, vendor);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => VendorAssignScreen(booking: booking),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveTripCard(
    BuildContext context,
    WidgetRef ref,
    BookingModel booking,
  ) {
    final hasDriver = booking.driver != null;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: TaxiyaaCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  booking.id,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textGray,
                  ),
                ),
                StatusBadge(status: booking.status),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '${booking.pickupLocation.split(',').first} → ${booking.dropLocation.split(',').first}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${booking.pickupDate} • ${booking.pickupTime}',
              style: const TextStyle(fontSize: 12, color: AppColors.textGray),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  hasDriver ? Icons.person : Icons.person_off_outlined,
                  size: 16,
                  color: hasDriver ? AppColors.black : AppColors.error,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    hasDriver
                        ? '${booking.driver!.name} (${booking.vehicle.registrationNo})'
                        : 'Driver Not Assigned Yet',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: hasDriver ? AppColors.black : AppColors.error,
                    ),
                  ),
                ),
                if (!hasDriver)
                  TaxiyaaButton(
                    text: 'Assign Driver',
                    height: 36,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => VendorAssignScreen(booking: booking),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/booking_model.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/status_badge.dart';
import '../../../core/widgets/taxiyaa_button.dart';
import '../../../core/widgets/taxiyaa_card.dart';
import 'vendor_assign_screen.dart';

/// Screen 02 - Booking Requests & Management (Section 34)
class VendorRequestsScreen extends ConsumerStatefulWidget {
  const VendorRequestsScreen({super.key});

  @override
  ConsumerState<VendorRequestsScreen> createState() => _VendorRequestsScreenState();
}

class _VendorRequestsScreenState extends ConsumerState<VendorRequestsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bookings = ref.watch(bookingsProvider);

    final newBookings = bookings
        .where((b) =>
            b.status == BookingStatus.assignmentPending ||
            b.status == BookingStatus.quoteReady)
        .toList();

    final activeBookings = bookings
        .where((b) =>
            b.status == BookingStatus.vendorAssigned ||
            b.status == BookingStatus.driverAssigned ||
            b.status == BookingStatus.driverArriving ||
            b.status == BookingStatus.driverArrived ||
            b.status == BookingStatus.tripStarted)
        .toList();

    final completedBookings = bookings
        .where((b) =>
            b.status == BookingStatus.tripCompleted ||
            b.status == BookingStatus.settlementPending ||
            b.status == BookingStatus.settled)
        .toList();

    final cancelledBookings = bookings
        .where((b) => b.status == BookingStatus.cancelled)
        .toList();

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Booking Management',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.black,
          unselectedLabelColor: AppColors.textGray,
          indicatorColor: AppColors.primary,
          indicatorWeight: 3,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          tabs: [
            Tab(text: 'New (${newBookings.length})'),
            Tab(text: 'Active (${activeBookings.length})'),
            Tab(text: 'Done (${completedBookings.length})'),
            Tab(text: 'Cancelled (${cancelledBookings.length})'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildBookingsList(newBookings, isNew: true),
          _buildBookingsList(activeBookings, isActive: true),
          _buildBookingsList(completedBookings),
          _buildBookingsList(cancelledBookings),
        ],
      ),
    );
  }

  Widget _buildBookingsList(
    List<BookingModel> items, {
    bool isNew = false,
    bool isActive = false,
  }) {
    if (items.isEmpty) {
      return const EmptyState(
        title: 'No Bookings Found',
        message: 'No trips match this status filter currently.',
        icon: Icons.assignment_outlined,
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final booking = items[index];
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
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textGray,
                      ),
                    ),
                    StatusBadge(status: booking.status),
                  ],
                ),
                const Divider(height: 16),
                Row(
                  children: [
                    const Icon(Icons.circle, size: 8, color: AppColors.success),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        booking.pickupLocation,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
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
                    const Icon(Icons.location_on, size: 10, color: AppColors.error),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        booking.dropLocation,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${booking.pickupDate} • ${booking.pickupTime}',
                      style: const TextStyle(fontSize: 12, color: AppColors.textGray),
                    ),
                    Text(
                      'Payout: ₹${booking.vendorPayout.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.success,
                      ),
                    ),
                  ],
                ),
                if (booking.driver != null) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.person, size: 14, color: AppColors.black),
                        const SizedBox(width: 6),
                        Text(
                          '${booking.driver!.name} • ${booking.vehicle.registrationNo}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                if (isNew) ...[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TaxiyaaOutlinedButton(
                          text: 'Decline',
                          onPressed: () {
                            ref
                                .read(bookingsProvider.notifier)
                                .rejectBooking(booking.id);
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TaxiyaaButton(
                          text: 'Accept & Assign',
                          onPressed: () {
                            final vendor = ref.read(activeVendorProvider);
                            ref
                                .read(bookingsProvider.notifier)
                                .acceptBooking(booking.id, vendor);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    VendorAssignScreen(booking: booking),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ] else if (isActive && booking.driver == null) ...[
                  const SizedBox(height: 12),
                  TaxiyaaButton(
                    text: 'Assign Driver & Vehicle',
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
              ],
            ),
          ),
        );
      },
    );
  }
}


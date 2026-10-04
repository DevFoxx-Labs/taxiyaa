import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/booking_model.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/booking_card.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/price_breakdown.dart';
import '../../../core/widgets/route_timeline.dart';
import '../../../core/widgets/status_badge.dart';
import '../../../core/widgets/taxiyaa_button.dart';
import '../../../core/widgets/taxiyaa_card.dart';
import 'customer_review_screen.dart';
import 'customer_support_screen.dart';
import 'live_tracking_screen.dart';

/// Customer Screen 10 — My Bookings (Section 16 & 17)
class CustomerBookingsScreen extends ConsumerStatefulWidget {
  const CustomerBookingsScreen({super.key});

  @override
  ConsumerState<CustomerBookingsScreen> createState() => _CustomerBookingsScreenState();
}

class _CustomerBookingsScreenState extends ConsumerState<CustomerBookingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allBookings = ref.watch(bookingsProvider);

    final upcoming = allBookings
        .where((b) =>
            b.status != BookingStatus.tripCompleted &&
            b.status != BookingStatus.cancelled)
        .toList();

    final completed = allBookings
        .where((b) => b.status == BookingStatus.tripCompleted)
        .toList();

    final cancelled = allBookings
        .where((b) => b.status == BookingStatus.cancelled)
        .toList();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: const Text('My Bookings'),
        elevation: 0,
        backgroundColor: AppColors.white,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.black,
          unselectedLabelColor: AppColors.textGray,
          indicatorColor: AppColors.primary,
          indicatorWeight: 3,
          labelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Completed'),
            Tab(text: 'Cancelled'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildList(upcoming, 'No upcoming bookings', 'Book your next taxi with Taxiyaa.'),
          _buildList(completed, 'No completed trips yet', 'Your travel history will appear here.'),
          _buildList(cancelled, 'No cancelled bookings', 'You have no cancelled taxi bookings.'),
        ],
      ),
    );
  }

  Widget _buildList(List<BookingModel> items, String emptyTitle, String emptyMessage) {
    if (items.isEmpty) {
      return EmptyState(
        title: emptyTitle,
        message: emptyMessage,
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final booking = items[index];
        return BookingCard(
          booking: booking,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CustomerBookingDetailsScreen(booking: booking),
              ),
            );
          },
        );
      },
    );
  }
}

/// Customer Booking Details (Section 17)
class CustomerBookingDetailsScreen extends StatelessWidget {
  final BookingModel booking;

  const CustomerBookingDetailsScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final isCompleted = booking.status == BookingStatus.tripCompleted;
    final isCancelled = booking.status == BookingStatus.cancelled;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: Text(booking.id),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status & Route Card
            TaxiyaaCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        booking.tripType,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textGray,
                        ),
                      ),
                      StatusBadge(status: booking.status),
                    ],
                  ),
                  const SizedBox(height: 14),
                  RouteTimeline(
                    pickup: booking.pickupLocation,
                    drop: booking.dropLocation,
                    pickupTime: '${booking.pickupDate} • ${booking.pickupTime}',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Vehicle & Chauffeur Card
            TaxiyaaCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Vehicle & Driver Details',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          booking.vehicle.image,
                          width: 60,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              booking.vehicle.name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                              ),
                            ),
                            Text(
                              booking.driver?.vehicleNumber ?? 'UP32 AB 1234',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (booking.driver != null) ...[
                    const Divider(height: 20, color: AppColors.border),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColors.lightGray,
                          child: const Icon(Icons.person, color: AppColors.black),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                booking.driver!.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '${booking.driver!.rating} ★ • ${booking.driver!.phone}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textGray,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Fare Breakdown
            const Text(
              'Fare Summary',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 10),
            PriceBreakdown(
              baseFare: booking.customerPrice - booking.tax,
              taxes: booking.tax,
              discount: booking.discount,
              total: booking.customerPrice,
            ),

            const SizedBox(height: 24),

            // Actions Buttons based on status (Section 17)
            if (!isCompleted && !isCancelled) ...[
              TaxiyaaButton(
                text: 'Track Ride',
                icon: Icons.navigation_outlined,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LiveTrackingScreen(booking: booking),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
            ],

            if (isCompleted) ...[
              TaxiyaaButton(
                text: 'Rate Trip',
                icon: Icons.star_border,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CustomerReviewScreen(booking: booking),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
            ],

            TaxiyaaOutlinedButton(
              text: 'Download Invoice (PDF)',
              icon: Icons.download_outlined,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Tax invoice generated for ${booking.id}. Downloading PDF.'),
                  ),
                );
              },
            ),

            const SizedBox(height: 10),

            TaxiyaaOutlinedButton(
              text: 'Contact Support',
              icon: Icons.support_agent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CustomerSupportScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


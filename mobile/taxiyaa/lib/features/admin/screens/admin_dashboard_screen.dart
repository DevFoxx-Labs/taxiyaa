import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/booking_model.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_card.dart';

/// Screen 01 - Admin Operations & Executive Dashboard (Section 41)
class AdminDashboardScreen extends ConsumerWidget {
  final VoidCallback onOpenRoleSwitcher;

  const AdminDashboardScreen({
    super.key,
    required this.onOpenRoleSwitcher,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookings = ref.watch(bookingsProvider);
    final vendors = ref.watch(vendorsProvider);

    final unassigned = bookings
        .where((b) =>
            b.status == BookingStatus.assignmentPending ||
            b.status == BookingStatus.vendorAssigned)
        .toList();

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Taxiyaa Operations HQ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            Row(
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  'Live Network • All Systems Optimal',
                  style: TextStyle(fontSize: 11, color: AppColors.textGray),
                ),
              ],
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
            icon: const Icon(Icons.tune, color: AppColors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // High Level Metrics
            Row(
              children: [
                Expanded(
                  child: _buildKpiCard(
                    title: "Today's Bookings",
                    value: '${bookings.length + 138}',
                    trend: '+18.4% vs last week',
                    icon: Icons.receipt_long,
                    color: AppColors.primaryDark,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildKpiCard(
                    title: 'Gross Platform GMV',
                    value: '₹16,75,500',
                    trend: '+12.1% growth',
                    icon: Icons.currency_rupee,
                    color: AppColors.success,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildKpiCard(
                    title: 'Fleet Network',
                    value: '${vendors.length * 16} Cabs',
                    trend: '78% Utilization',
                    icon: Icons.local_taxi,
                    color: AppColors.info,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildKpiCard(
                    title: 'Active Vendors',
                    value: '${vendors.length + 45}',
                    trend: 'Across 14 Cities',
                    icon: Icons.hub,
                    color: AppColors.warning,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Urgent Operations Attention
            if (unassigned.isNotEmpty) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.lightYellow,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary, width: 1.5),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.warning_amber_rounded,
                        color: AppColors.primaryDark, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${unassigned.length} Trips Need Dispatch Attention',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Assign available vendors or dispatch internal backup fleet immediately.',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.darkGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],

            // Active Operations Feed
            const Text(
              'Real-Time Fleet & Dispatch Status',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 12),

            ...bookings.take(4).map((b) => _buildLiveDispatchRow(b)),

            const SizedBox(height: 20),

            // Quick Operations Console
            const Text(
              'Operations Quick Actions',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _buildActionTile(
                    icon: Icons.add_circle_outline,
                    label: 'Manual Dispatch',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Manual trip booking console opened')),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildActionTile(
                    icon: Icons.campaign_outlined,
                    label: 'Broadcast SMS/Push',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Driver broadcast notification sent!')),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildActionTile(
                    icon: Icons.price_change_outlined,
                    label: 'Dynamic Pricing',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Surge / Base tariff rates locked')),
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

  Widget _buildKpiCard({
    required String title,
    required String value,
    required String trend,
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
                  fontSize: 11,
                  color: AppColors.textGray,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(icon, size: 18, color: color),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            trend,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: trend.startsWith('+') ? AppColors.success : AppColors.textGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveDispatchRow(BookingModel booking) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TaxiyaaCard(
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.route, color: AppColors.black, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${booking.pickupLocation.split(',').first} → ${booking.dropLocation.split(',').first}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${booking.id} • ${booking.passengerName}',
                    style: const TextStyle(fontSize: 11, color: AppColors.textGray),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  booking.status.label,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '₹${booking.customerPrice.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.success,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            Icon(icon, size: 24, color: AppColors.black),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


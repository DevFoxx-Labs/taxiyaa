import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/booking_model.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/status_badge.dart';
import '../../../core/widgets/taxiyaa_card.dart';
import '../../../core/widgets/taxiyaa_text_field.dart';

/// Screen 02 - Central Bookings Operations & Margin Breakdown (Section 42 & 43)
class AdminBookingsScreen extends ConsumerStatefulWidget {
  const AdminBookingsScreen({super.key});

  @override
  ConsumerState<AdminBookingsScreen> createState() => _AdminBookingsScreenState();
}

class _AdminBookingsScreenState extends ConsumerState<AdminBookingsScreen> {
  final _searchController = TextEditingController();
  String _selectedFilter = 'All';

  final List<String> _filters = [
    'All',
    'Pending',
    'Dispatched',
    'In Progress',
    'Completed',
    'Cancelled'
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showBookingDetailsSheet(BookingModel booking) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.85,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        builder: (_, scrollController) => Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(20),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          booking.id,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        StatusBadge(status: booking.status),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${booking.pickupLocation} → ${booking.dropLocation}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${booking.pickupDate} at ${booking.pickupTime} • ${booking.tripType}',
                      style: const TextStyle(fontSize: 13, color: AppColors.textGray),
                    ),
                    const Divider(height: 24),

                    // Customer Details
                    const Text(
                      'Customer Information',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text('Name: ${booking.passengerName}'),
                    Text('Phone: ${booking.passengerPhone}'),
                    if (booking.passengerEmail.isNotEmpty)
                      Text('Email: ${booking.passengerEmail}'),
                    if (booking.specialInstructions.isNotEmpty)
                      Text('Notes: ${booking.specialInstructions}'),

                    const Divider(height: 24),

                    // Vendor & Driver
                    const Text(
                      'Fulfillment Assignment',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Vendor: ${booking.vendor != null ? booking.vendor!.companyName : "Unassigned"}',
                    ),
                    Text(
                      'Driver: ${booking.driver != null ? "${booking.driver!.name} (${booking.driver!.phone})" : "Unassigned"}',
                    ),
                    Text('Vehicle: ${booking.vehicle.name} (${booking.vehicle.registrationNo})'),
                    Text('OTP: ${booking.otp}'),

                    const Divider(height: 24),

                    // Complete Margin & Financial Breakdown (Section 51)
                    const Text(
                      'Platform Margin & Financial Audit',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.lightGray,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          _buildAuditRow('Customer Gross Paid', '₹${booking.customerPrice.toStringAsFixed(0)}'),
                          _buildAuditRow('Vendor Base Payout', '₹${booking.vendorBasePrice.toStringAsFixed(0)}'),
                          if (booking.vendorExtraCharges > 0)
                            _buildAuditRow('Vendor Extra Charges', '₹${booking.vendorExtraCharges.toStringAsFixed(0)}'),
                          _buildAuditRow('GST & Taxes Collected', '₹${booking.tax.toStringAsFixed(0)}'),
                          const Divider(height: 16),
                          _buildAuditRow(
                            'Taxiyaa Net Margin',
                            '₹${booking.platformMargin.toStringAsFixed(0)} (${((booking.platformMargin / booking.customerPrice) * 100).toStringAsFixed(1)}%)',
                            isBold: true,
                            color: AppColors.success,
                          ),
                          _buildAuditRow(
                            'Vendor Net Payable',
                            '₹${booking.vendorPayout.toStringAsFixed(0)}',
                            isBold: true,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Status Override Actions
                    const Text(
                      'Operational Override',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ActionChip(
                          avatar: const Icon(Icons.check, size: 16),
                          label: const Text('Mark Completed'),
                          onPressed: () {
                            ref.read(bookingsProvider.notifier).updateBookingStatus(
                                  booking.id,
                                  BookingStatus.tripCompleted,
                                );
                            Navigator.pop(ctx);
                          },
                        ),
                        ActionChip(
                          avatar: const Icon(Icons.account_balance, size: 16),
                          label: const Text('Approve Settlement'),
                          onPressed: () {
                            ref.read(bookingsProvider.notifier).settleBooking(booking.id);
                            Navigator.pop(ctx);
                          },
                        ),
                        ActionChip(
                          avatar: const Icon(Icons.cancel_outlined, size: 16, color: AppColors.error),
                          label: const Text('Cancel Trip', style: TextStyle(color: AppColors.error)),
                          onPressed: () {
                            ref.read(bookingsProvider.notifier).updateBookingStatus(
                                  booking.id,
                                  BookingStatus.cancelled,
                                );
                            Navigator.pop(ctx);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAuditRow(
    String label,
    String value, {
    bool isBold = false,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: AppColors.textGray,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              color: color ?? AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bookings = ref.watch(bookingsProvider);
    final query = _searchController.text.trim().toLowerCase();

    final filtered = bookings.where((b) {
      if (query.isNotEmpty) {
        final matches = b.id.toLowerCase().contains(query) ||
            b.passengerName.toLowerCase().contains(query) ||
            b.passengerPhone.toLowerCase().contains(query);
        if (!matches) return false;
      }

      if (_selectedFilter == 'All') return true;
      if (_selectedFilter == 'Pending') {
        return b.status == BookingStatus.assignmentPending ||
            b.status == BookingStatus.vendorAssigned;
      }
      if (_selectedFilter == 'Dispatched') {
        return b.status == BookingStatus.driverAssigned ||
            b.status == BookingStatus.driverArriving ||
            b.status == BookingStatus.driverArrived;
      }
      if (_selectedFilter == 'In Progress') {
        return b.status == BookingStatus.tripStarted;
      }
      if (_selectedFilter == 'Completed') {
        return b.status == BookingStatus.tripCompleted ||
            b.status == BookingStatus.settlementPending ||
            b.status == BookingStatus.settled;
      }
      if (_selectedFilter == 'Cancelled') {
        return b.status == BookingStatus.cancelled;
      }
      return true;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Central Bookings Desk',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          // Search & Filter header
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                TaxiyaaTextField(
                  hint: 'Search by Booking ID, Customer, Mobile...',
                  controller: _searchController,
                  prefixIcon: const Icon(Icons.search, color: AppColors.textGray),
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _filters.map((filter) {
                      final isSelected = _selectedFilter == filter;
                      return Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: FilterChip(
                          label: Text(filter),
                          selected: isSelected,
                          selectedColor: AppColors.primary,
                          backgroundColor: AppColors.lightGray,
                          labelStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            color: AppColors.black,
                          ),
                          onSelected: (val) {
                            setState(() {
                              _selectedFilter = filter;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),

          // Bookings List
          Expanded(
            child: filtered.isEmpty
                ? const EmptyState(
                    title: 'No Bookings Match Query',
                    subtitle: 'Try adjusting your search keywords or active status filter.',
                    icon: Icons.search_off,
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final booking = filtered[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: InkWell(
                          onTap: () => _showBookingDetailsSheet(booking),
                          borderRadius: BorderRadius.circular(12),
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
                                  'Passenger: ${booking.passengerName} (${booking.passengerPhone})',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${booking.pickupDate} • ${booking.pickupTime} • ${booking.vehicle.name}',
                                  style: const TextStyle(fontSize: 12, color: AppColors.textGray),
                                ),
                                const Divider(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Customer Gross',
                                          style: TextStyle(fontSize: 11, color: AppColors.textGray),
                                        ),
                                        Text(
                                          '₹${booking.customerPrice.toStringAsFixed(0)}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Vendor Payout',
                                          style: TextStyle(fontSize: 11, color: AppColors.textGray),
                                        ),
                                        Text(
                                          '₹${booking.vendorPayout.toStringAsFixed(0)}',
                                          style: const TextStyle(
                                            fontSize: 14,
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
                                          'Platform Margin',
                                          style: TextStyle(fontSize: 11, color: AppColors.textGray),
                                        ),
                                        Text(
                                          '+₹${booking.platformMargin.toStringAsFixed(0)}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.success,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}


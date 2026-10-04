import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/vendor_model.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_card.dart';

/// Screen 03 - Vendor & Driver Fleet Network (Section 44 & 45)
class AdminVendorsScreen extends ConsumerStatefulWidget {
  const AdminVendorsScreen({super.key});

  @override
  ConsumerState<AdminVendorsScreen> createState() => _AdminVendorsScreenState();
}

class _AdminVendorsScreenState extends ConsumerState<AdminVendorsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showKycVerificationDialog(VendorModel vendor) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('${vendor.companyName} — KYC Documents'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDocCheckRow('GST Certificate', 'GSTIN: 09AAFCB1234F1Z8', true),
            const SizedBox(height: 10),
            _buildDocCheckRow('PAN Card', 'PAN: AAFCB1234F', true),
            const SizedBox(height: 10),
            _buildDocCheckRow('Commercial Trade License', 'LIC-UP-2024-99881', true),
            const SizedBox(height: 10),
            _buildDocCheckRow('Bank Account Mandate', 'HDFC Bank (Verified)', true),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Close'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () {
              ref.read(vendorsProvider.notifier).verifyVendor(vendor.id);
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.black,
                  content: Text('${vendor.companyName} KYC status verified!'),
                ),
              );
            },
            child: const Text('Approve & Verify', style: TextStyle(color: AppColors.black)),
          ),
        ],
      ),
    );
  }

  Widget _buildDocCheckRow(String title, String detail, bool verified) {
    return Row(
      children: [
        Icon(
          verified ? Icons.check_circle : Icons.pending,
          color: verified ? AppColors.success : AppColors.warning,
          size: 20,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              Text(detail, style: const TextStyle(color: AppColors.textGray, fontSize: 11)),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final vendors = ref.watch(vendorsProvider);
    final drivers = ref.watch(driversProvider);

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Fleet Network Operations',
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
          tabs: [
            Tab(text: 'Registered Vendors (${vendors.length})'),
            Tab(text: 'Drivers Network (${drivers.length})'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Vendors Tab
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: vendors.length,
            itemBuilder: (context, index) {
              final vendor = vendors[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: TaxiyaaCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                vendor.companyName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
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
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.success.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'Verified KYC',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: AppColors.success,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Owner: ${vendor.ownerName} • ${vendor.phone}',
                        style: const TextStyle(fontSize: 13, color: AppColors.textGray),
                      ),
                      const Divider(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildStatItem('Fleet', '${vendor.activeVehicles} Cars'),
                          _buildStatItem('Drivers', '${vendor.activeDrivers}'),
                          _buildStatItem('Rating', '★ ${vendor.rating}'),
                          _buildStatItem(
                            'Pending',
                            '₹${(vendor.pendingEarnings / 1000).toStringAsFixed(0)}k',
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(40),
                          side: const BorderSide(color: AppColors.border),
                        ),
                        icon: const Icon(Icons.verified_user_outlined, size: 16),
                        label: const Text('Review Compliance & KYC'),
                        onPressed: () => _showKycVerificationDialog(vendor),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // Drivers Tab
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: drivers.length,
            itemBuilder: (context, index) {
              final driver = drivers[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: TaxiyaaCard(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.lightYellow,
                        child: Text(
                          driver.name.split(' ').map((n) => n[0]).take(2).join(),
                          style: const TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  driver.name,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '★ ${driver.rating}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryDark,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${driver.vehicleName} (${driver.vehicleNumber})',
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${driver.phone} • ${driver.totalTrips} Trips',
                              style: const TextStyle(fontSize: 12, color: AppColors.textGray),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.success.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'Active',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: AppColors.success,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 11, color: AppColors.textGray)),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.black),
        ),
      ],
    );
  }
}

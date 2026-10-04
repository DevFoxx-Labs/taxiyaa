import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_card.dart';

/// Driver Screen 09 — Profile (Section 30)
class DriverProfileScreen extends ConsumerWidget {
  final VoidCallback onSwitchRole;

  const DriverProfileScreen({super.key, required this.onSwitchRole});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final driver = ref.watch(activeDriverProvider);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: const Text('My Profile'),
        elevation: 0,
        backgroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Driver Profile Header Card
            TaxiyaaCard(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.primary,
                    child: const Icon(Icons.person, color: AppColors.black, size: 32),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          driver.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          driver.phone,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textGray,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.star, color: AppColors.darkYellow, size: 14),
                            const SizedBox(width: 3),
                            Text(
                              '${driver.rating} • ${driver.totalTrips} Trips Completed',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.darkGray,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Document Status Checklist (Section 30)
            TaxiyaaCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'KYC & Document Status',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _docStatusRow('Driving License (Commercial)', driver.dlVerified),
                  _docStatusRow('Vehicle RC & Fitness Permit', driver.rcVerified),
                  _docStatusRow('Commercial Comprehensive Insurance', driver.insuranceVerified),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Switch Portal Banner
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.primary),
              ),
              child: ListTile(
                leading: const Icon(Icons.swap_horiz, color: AppColors.black),
                title: const Text(
                  'Switch Experience Portal',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                subtitle: const Text(
                  'Switch to Customer, Vendor, or Admin view',
                  style: TextStyle(fontSize: 12, color: AppColors.textGray),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.black),
                onTap: onSwitchRole,
              ),
            ),

            const SizedBox(height: 14),

            // Menu Items (Section 30)
            TaxiyaaCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  _menuTile(Icons.badge_outlined, 'Personal Details'),
                  const Divider(height: 1, color: AppColors.border),
                  _menuTile(Icons.folder_outlined, 'Uploaded Documents'),
                  const Divider(height: 1, color: AppColors.border),
                  _menuTile(Icons.directions_car_outlined, 'Assigned Vehicle Details'),
                  const Divider(height: 1, color: AppColors.border),
                  _menuTile(Icons.account_balance_outlined, 'Bank Account & Settlement'),
                  const Divider(height: 1, color: AppColors.border),
                  _menuTile(Icons.settings_outlined, 'App Settings'),
                  const Divider(height: 1, color: AppColors.border),
                  _menuTile(Icons.logout, 'Logout', isDestructive: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _docStatusRow(String label, bool isVerified) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 13, color: AppColors.darkGray),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: isVerified
                  ? AppColors.success.withValues(alpha: 0.12)
                  : AppColors.error.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isVerified ? Icons.check_circle : Icons.warning_amber,
                  color: isVerified ? AppColors.success : AppColors.error,
                  size: 13,
                ),
                const SizedBox(width: 4),
                Text(
                  isVerified ? 'Verified' : 'Pending',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: isVerified ? AppColors.success : AppColors.error,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuTile(IconData icon, String title, {bool isDestructive = false}) {
    return ListTile(
      leading: Icon(icon, color: isDestructive ? AppColors.error : AppColors.darkGray, size: 20),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: isDestructive ? AppColors.error : AppColors.black,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.textGray),
      onTap: () {},
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_button.dart';
import '../../../core/widgets/taxiyaa_card.dart';

/// Screen 04 - Finance, Settlements & Margins (Section 49 & 51)
class AdminFinanceScreen extends ConsumerWidget {
  const AdminFinanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendors = ref.watch(vendorsProvider);

    final totalPendingPayouts =
        vendors.fold<double>(0, (sum, v) => sum + v.pendingEarnings);

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Financial Desk & Settlements',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Margin & Financial Summary
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Taxiyaa Platform Margin (FY 2026-27)',
                    style: TextStyle(color: AppColors.lightGray, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '₹16,84,000',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Net Margin Ratio: 20.0% of ₹84.20 Lakhs GMV',
                    style: TextStyle(color: AppColors.textGray, fontSize: 12),
                  ),
                  const Divider(color: AppColors.darkGray, height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDarkMetric('Gross GMV', '₹84,20,000'),
                      _buildDarkMetric('Vendor Payouts', '₹67,36,000'),
                      _buildDarkMetric('GST/TDS Inflow', '₹4,21,000'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Vendor Settlement Queue
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pending Vendor Payout Queue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  'Total: ₹${totalPendingPayouts.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.error,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            ...vendors.map((vendor) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: TaxiyaaCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              vendor.companyName,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.warning.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                'Pending Release',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.warning,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Owner: ${vendor.ownerName} • Bank: HDFC Bank (Verified)',
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
                                  'Payable Balance',
                                  style: TextStyle(fontSize: 11, color: AppColors.textGray),
                                ),
                                Text(
                                  '₹${vendor.pendingEarnings.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                            TaxiyaaButton(
                              text: 'Release NEFT',
                              height: 38,
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: AppColors.black,
                                    content: Text(
                                      'NEFT batch transfer of ₹${vendor.pendingEarnings.toStringAsFixed(0)} triggered to ${vendor.companyName}!',
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),

            const SizedBox(height: 20),

            // Settlement Batch Action
            TaxiyaaButton(
              text: 'Execute Bulk Weekly Settlement (All Vendors)',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: AppColors.black,
                    content: Text('Bulk NEFT settlement file generated and sent to banking gateway!'),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDarkMetric(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: AppColors.textGray, fontSize: 11)),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_button.dart';
import '../../../core/widgets/taxiyaa_card.dart';

/// Screen 04 - Vendor Earnings & Payouts (Section 37)
class VendorEarningsScreen extends ConsumerWidget {
  const VendorEarningsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendor = ref.watch(activeVendorProvider);

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Earnings & Payouts',
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
            // Total balance card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Pending Settlement',
                        style: TextStyle(color: AppColors.lightGray, fontSize: 13),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'Weekly Cycle',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '₹${vendor.pendingEarnings.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Next automatic bank transfer: Monday, 16 Oct 2026',
                    style: TextStyle(color: AppColors.textGray, fontSize: 12),
                  ),
                  const Divider(color: AppColors.darkGray, height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Lifetime Revenue',
                            style: TextStyle(color: AppColors.textGray, fontSize: 11),
                          ),
                          Text(
                            '₹${vendor.totalEarnings.toStringAsFixed(0)}',
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Bank Account',
                            style: TextStyle(color: AppColors.textGray, fontSize: 11),
                          ),
                          const Text(
                            'HDFC Bank ••••4821',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Settlement breakdown calculation (Section 51 & 37)
            const Text(
              'Current Settlement Statement',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 12),

            TaxiyaaCard(
              child: Column(
                children: [
                  _buildStatementRow('Gross Fare Generated', '₹1,46,500', isBold: false),
                  const SizedBox(height: 8),
                  _buildStatementRow(
                    'Taxiyaa Platform Commission (-15%)',
                    '-₹21,975',
                    isNegative: true,
                  ),
                  const SizedBox(height: 8),
                  _buildStatementRow(
                    'TDS 194C Deductions (-1%)',
                    '-₹1,465',
                    isNegative: true,
                  ),
                  const SizedBox(height: 8),
                  _buildStatementRow('Toll & Parking Reimbursed', '+₹1,440'),
                  const Divider(height: 20),
                  _buildStatementRow(
                    'Net Payable Amount',
                    '₹1,24,500',
                    isBold: true,
                    highlight: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Settlement history ledger
            const Text(
              'Past Settlements',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 12),

            _buildLedgerItem(
              reference: 'SETTL-20261009-8812',
              date: '09 Oct 2026',
              amount: '₹84,200',
              status: 'Settled to HDFC Bank',
              isSuccess: true,
            ),
            const SizedBox(height: 8),
            _buildLedgerItem(
              reference: 'SETTL-20261002-7721',
              date: '02 Oct 2026',
              amount: '₹1,12,450',
              status: 'Settled to HDFC Bank',
              isSuccess: true,
            ),
            const SizedBox(height: 8),
            _buildLedgerItem(
              reference: 'SETTL-20260925-6619',
              date: '25 Sep 2026',
              amount: '₹95,000',
              status: 'Settled to HDFC Bank',
              isSuccess: true,
            ),

            const SizedBox(height: 24),

            TaxiyaaButton(
              text: 'Request Instant Settlement (T+0)',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: AppColors.black,
                    content: Text('Instant settlement request submitted to Taxiyaa Finance desk!'),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildStatementRow(
    String label,
    String value, {
    bool isBold = false,
    bool isNegative = false,
    bool highlight = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isBold ? 14 : 13,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: highlight ? AppColors.black : AppColors.textGray,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 16 : 13,
            fontWeight: FontWeight.bold,
            color: highlight
                ? AppColors.success
                : (isNegative ? AppColors.error : AppColors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildLedgerItem({
    required String reference,
    required String date,
    required String amount,
    required String status,
    required bool isSuccess,
  }) {
    return TaxiyaaCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reference,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$date • $status',
                style: const TextStyle(fontSize: 11, color: AppColors.textGray),
              ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}


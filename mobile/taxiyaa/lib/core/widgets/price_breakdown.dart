import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Reusable Fare Breakdown Component (Section 13)
class PriceBreakdown extends StatelessWidget {
  final double baseFare;
  final double taxes;
  final double discount;
  final double total;
  final double? driverAllowance;
  final double? tollCharges;

  const PriceBreakdown({
    super.key,
    required this.baseFare,
    required this.taxes,
    required this.discount,
    required this.total,
    this.driverAllowance,
    this.tollCharges,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          _buildRow('Base Fare', '₹${baseFare.toStringAsFixed(0)}'),
          if (driverAllowance != null && driverAllowance! > 0) ...[
            const SizedBox(height: 6),
            _buildRow('Driver Allowance', '₹${driverAllowance!.toStringAsFixed(0)}'),
          ],
          if (tollCharges != null && tollCharges! > 0) ...[
            const SizedBox(height: 6),
            _buildRow('Estimated Toll & State Tax', '₹${tollCharges!.toStringAsFixed(0)}'),
          ],
          const SizedBox(height: 6),
          _buildRow('Taxes & GST (5%)', '₹${taxes.toStringAsFixed(0)}'),
          if (discount > 0) ...[
            const SizedBox(height: 6),
            _buildRow(
              'Coupon Discount',
              '-₹${discount.toStringAsFixed(0)}',
              color: AppColors.success,
            ),
          ],
          const Divider(height: 18, color: AppColors.border),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Payable',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              Text(
                '₹${total.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.textGray,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: color ?? AppColors.black,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../models/booking_model.dart';
import '../theme/app_colors.dart';
import 'status_badge.dart';
import 'taxiyaa_card.dart';

class BookingCard extends StatelessWidget {
  final BookingModel booking;
  final VoidCallback onTap;

  const BookingCard({
    super.key,
    required this.booking,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TaxiyaaCard(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(vertical: 6),
      onTap: onTap,
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
                  fontWeight: FontWeight.w700,
                  color: AppColors.textGray,
                ),
              ),
              StatusBadge(status: booking.status),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${booking.pickupLocation.split(',').first} → ${booking.dropLocation.split(',').first}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
              Text(
                '₹${booking.customerPrice.toInt()}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '${booking.pickupDate} • ${booking.pickupTime}',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textGray,
            ),
          ),
          const Divider(height: 18, color: AppColors.border),
          Row(
            children: [
              const Icon(Icons.directions_car, size: 16, color: AppColors.textGray),
              const SizedBox(width: 6),
              Text(
                booking.vehicle.name,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGray,
                ),
              ),
              if (booking.driver != null) ...[
                const SizedBox(width: 8),
                Text(
                  '• ${booking.driver!.name}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textGray,
                  ),
                ),
              ],
              const Spacer(),
              const Icon(Icons.chevron_right, size: 20, color: AppColors.textGray),
            ],
          ),
        ],
      ),
    );
  }
}


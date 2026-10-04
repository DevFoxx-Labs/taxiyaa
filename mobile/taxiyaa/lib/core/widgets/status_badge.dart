import 'package:flutter/material.dart';
import '../models/booking_model.dart';
import '../theme/app_colors.dart';

class StatusBadge extends StatelessWidget {
  final BookingStatus status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color text;

    switch (status) {
      case BookingStatus.paid:
      case BookingStatus.tripCompleted:
      case BookingStatus.settled:
        bg = AppColors.success.withValues(alpha: 0.12);
        text = AppColors.success;
        break;
      case BookingStatus.driverAssigned:
      case BookingStatus.driverArriving:
      case BookingStatus.driverArrived:
      case BookingStatus.tripStarted:
        bg = AppColors.primary.withValues(alpha: 0.2);
        text = AppColors.darkYellow;
        break;
      case BookingStatus.cancelled:
        bg = AppColors.error.withValues(alpha: 0.12);
        text = AppColors.error;
        break;
      default:
        bg = AppColors.info.withValues(alpha: 0.12);
        text = AppColors.info;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.label,
        style: TextStyle(
          color: text,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import '../models/vehicle_model.dart';
import '../theme/app_colors.dart';
import 'taxiyaa_button.dart';
import 'taxiyaa_card.dart';

class VehicleCard extends StatelessWidget {
  final VehicleModel vehicle;
  final VoidCallback onSelect;
  final bool isSelected;

  const VehicleCard({
    super.key,
    required this.vehicle,
    required this.onSelect,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return TaxiyaaCard(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 6),
      borderColor: isSelected ? AppColors.primary : AppColors.border,
      backgroundColor: isSelected ? AppColors.primaryLight.withValues(alpha: 0.3) : AppColors.white,
      onTap: onSelect,
      child: Row(
        children: [
          // Vehicle Image thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 90,
              height: 70,
              color: AppColors.lightGray,
              child: Image.asset(
                vehicle.image,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(
                errorBuilder: (_, _, _) => const Icon(
                  Icons.directions_car_outlined,
                  color: AppColors.textGray,
                  size: 32,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          // Vehicle Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vehicle.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  vehicle.subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textGray,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  vehicle.formattedPrice,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
          // Select CTA button
          SizedBox(
            width: 80,
            height: 38,
            child: TaxiyaaButton(
              text: isSelected ? 'Selected' : 'Select',
              height: 38,
              backgroundColor: isSelected ? AppColors.black : AppColors.primary,
              textColor: isSelected ? AppColors.white : AppColors.black,
              onPressed: onSelect,
            ),
          ),
        ],
      ),
    );
  }
}


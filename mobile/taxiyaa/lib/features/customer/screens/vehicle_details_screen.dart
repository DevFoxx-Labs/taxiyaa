import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/vehicle_model.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_button.dart';
import '../../../core/widgets/taxiyaa_card.dart';
import 'booking_details_screen.dart';

/// Customer Screen 05 — Vehicle Details (Section 11)
class VehicleDetailsScreen extends ConsumerWidget {
  final VehicleModel vehicle;

  const VehicleDetailsScreen({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchParams = ref.watch(bookingSearchProvider);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: Text(vehicle.name),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Vehicle Image Card
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      color: AppColors.white,
                      child: Image.asset(
                        vehicle.image,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Center(
                          child: Icon(Icons.directions_car, size: 80, color: AppColors.textGray),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Title, Subtitle, Price
                  TaxiyaaCard(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              vehicle.name,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: AppColors.black,
                              ),
                            ),
                            Text(
                              vehicle.formattedPrice,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              vehicle.subtitle,
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.textGray,
                              ),
                            ),
                            Text(
                              '${searchParams.tripType} (All charges incl.)',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textGray,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Features Icon Grid (Section 11)
                  TaxiyaaCard(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Vehicle Features',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _featureItem(Icons.airline_seat_recline_normal, '${vehicle.seats} Seats'),
                            _featureItem(Icons.luggage, '${vehicle.bags} Bags'),
                            _featureItem(Icons.ac_unit, 'Chilled AC'),
                            _featureItem(Icons.music_note, 'Audio System'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Inclusions Checklist (Section 11)
                  TaxiyaaCard(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Trip Inclusions',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...vehicle.inclusions.map((inc) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                const Icon(Icons.check_circle, color: AppColors.success, size: 18),
                                const SizedBox(width: 10),
                                Text(
                                  inc,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.darkGray,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Extra Charges Warning Banner
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.primary),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline, color: AppColors.darkYellow, size: 20),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Beyond 400 km limit, ${vehicle.formattedExtraKm}. No hidden parking or night driver fees.',
                            style: const TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Sticky CTA (Section 4 & 11)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.white,
              border: Border(top: BorderSide(color: AppColors.border)),
            ),
            child: SafeArea(
              top: false,
              child: TaxiyaaButton(
                text: 'Book Now',
                onPressed: () {
                  ref.read(bookingSearchProvider.notifier).selectVehicle(vehicle);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookingDetailsScreen(vehicle: vehicle),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: AppColors.lightGray,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.black, size: 22),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}


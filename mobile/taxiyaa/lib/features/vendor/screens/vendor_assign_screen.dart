import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/booking_model.dart';
import '../../../core/models/driver_model.dart';
import '../../../core/models/vehicle_model.dart';
import '../../../core/state/taxiyaa_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/taxiyaa_button.dart';
import '../../../core/widgets/taxiyaa_card.dart';

/// Screen 06 - Assign Vehicle & Driver Flow (Section 38)
class VendorAssignScreen extends ConsumerStatefulWidget {
  final BookingModel booking;

  const VendorAssignScreen({
    super.key,
    required this.booking,
  });

  @override
  ConsumerState<VendorAssignScreen> createState() => _VendorAssignScreenState();
}

class _VendorAssignScreenState extends ConsumerState<VendorAssignScreen> {
  VehicleModel? _selectedVehicle;
  DriverModel? _selectedDriver;

  @override
  void initState() {
    super.initState();
    // Default to the booking's suggested vehicle if available
    _selectedVehicle = widget.booking.vehicle;
  }

  @override
  Widget build(BuildContext context) {
    final vehicles = ref.watch(vehiclesProvider);
    final drivers = ref.watch(driversProvider);

    _selectedDriver ??= drivers.first;

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Assign Fleet & Driver',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Booking Summary
            TaxiyaaCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.booking.id,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textGray,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.lightYellow,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          widget.booking.tripType,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 16),
                  Text(
                    '${widget.booking.pickupLocation} → ${widget.booking.dropLocation}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Pickup: ${widget.booking.pickupDate} at ${widget.booking.pickupTime}',
                    style: const TextStyle(fontSize: 13, color: AppColors.textGray),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Passenger: ${widget.booking.passengerName} (${widget.booking.passengerPhone})',
                    style: const TextStyle(fontSize: 13, color: AppColors.black),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Select Vehicle
            const Text(
              'Select Vehicle from Fleet',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 12),

            ...vehicles.map((v) {
              final isSelected = _selectedVehicle?.id == v.id;
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedVehicle = v;
                    });
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? AppColors.primary : AppColors.border,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.directions_car,
                          color: isSelected ? AppColors.primaryDark : AppColors.textGray,
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                v.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                ),
                              ),
                              Text(
                                '${v.registrationNo} • ${v.subtitle}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textGray,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Radio<String>(
                          value: v.id,
                          groupValue: _selectedVehicle?.id,
                          activeColor: AppColors.primaryDark,
                          onChanged: (_) {
                            setState(() {
                              _selectedVehicle = v;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),

            const SizedBox(height: 24),

            // Select Driver
            const Text(
              'Select On-Duty Driver',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 12),

            ...drivers.map((d) {
              final isSelected = _selectedDriver?.id == d.id;
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedDriver = d;
                    });
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? AppColors.primary : AppColors.border,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColors.lightYellow,
                          child: Text(
                            d.name.split(' ').map((n) => n[0]).take(2).join(),
                            style: const TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    d.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    '★ ${d.rating}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textGray,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '${d.phone} • ${d.totalTrips} completed',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textGray,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Radio<String>(
                          value: d.id,
                          groupValue: _selectedDriver?.id,
                          activeColor: AppColors.primaryDark,
                          onChanged: (_) {
                            setState(() {
                              _selectedDriver = d;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),

            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(top: BorderSide(color: AppColors.border, width: 1)),
        ),
        child: SafeArea(
          child: TaxiyaaButton(
            text: 'Confirm Assignment',
            onPressed: () {
              if (_selectedVehicle == null || _selectedDriver == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please select both a vehicle and a driver')),
                );
                return;
              }

              ref.read(bookingsProvider.notifier).assignDriverAndVehicle(
                    bookingId: widget.booking.id,
                    driver: _selectedDriver!,
                    vehicle: _selectedVehicle!,
                  );

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.black,
                  content: Text(
                    'Trip assigned to ${_selectedDriver!.name} (${_selectedVehicle!.registrationNo})',
                  ),
                ),
              );

              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

